import os
import sys
import requests
import pandas as pd
import numpy as np
import math
import pyodbc
import pymssql
import cx_Oracle
import oracledb
import sqlalchemy
import platform
from datetime import datetime, timedelta
from dotenv import load_dotenv
from pathlib import Path
from time import gmtime, strftime
import warnings
warnings.filterwarnings("ignore")

oracledb.version = "8.3.0"
sys.modules["cx_Oracle"] = oracledb

if platform.system() == 'Windows':
    dotenv_path = Path('C:/Users/opc/Desktop/SERVER/GitHub/dv_airflow/dags/.env')
else:
    dotenv_path = Path('/opt/airflow/dags/.env')
load_dotenv(dotenv_path = dotenv_path)


def sql_conn(dest):
    if dest == 'src':
        sqlconn = cx_Oracle.connect(
            user = os.getenv('ERP_ORACLE_USER'),
            password = os.getenv('ERP_ORACLE_PASSWORD'),
            dsn = os.getenv('ERP_ORACLE_DSN'),
            encoding = "UTF-8"
            )
        cursor = sqlconn.cursor()
    elif dest == 'trg':
        sqlconn = oracledb.connect(
            user = os.getenv('ADWML_ORACLE_USER'),
            password = os.getenv('ADWML_ORACLE_PASSWORD'),
            dsn = os.getenv("ADWML_ORACLE_DSN")
            )
        cursor = sqlconn.cursor()
    return sqlconn, cursor



def db_read_sql(query, dest):
    sqlconn, cursor = sql_conn(dest)
    df = pd.read_sql(query, sqlconn)
    sqlconn.commit()
    sqlconn.close()
    return df


def db_to_sql(query, dest):
    sqlconn, cursor = sql_conn(dest)
    cursor.execute(query)
    sqlconn.commit()
    sqlconn.close()
    return True


def db_append_sql(src_df, trg_table_name):
    src_df = src_df.replace({np.nan:None})
    sqlconn, cursor = sql_conn('trg')
    column_name = ', '.join(src_df.columns)
    insert_values = []
    for i in range(len(src_df.columns)):
        insert_values.append(str(i+1))
    insert_values = ':'+', :'.join(insert_values)
    value = list(src_df.itertuples(index = False, name = None))
    query = """
        INSERT INTO {}(
        {}	
        ) VALUES ({})
        """.format(trg_table_name, column_name, insert_values)
    cursor.executemany(query, value)
    sqlconn.commit()
    sqlconn.close()
    return True


def db_delete_sql(src_df, table_name):
    src_pkey_query = f"""
        SELECT distinct column_name 
        FROM all_cons_columns 
        WHERE constraint_name = (
          SELECT constraint_name FROM user_constraints 
          WHERE UPPER(table_name) = UPPER('{table_name}') AND CONSTRAINT_TYPE = 'P'
            )
        AND TABLE_NAME = UPPER('{table_name}')
        """
    sqlconn, cursor = sql_conn('trg')
    pkey = db_read_sql(src_pkey_query, 'src')
    pkey_list = pkey['COLUMN_NAME'].tolist()
    for i, pkey in enumerate(pkey_list):
        # pkey_value = '(' + ','.join("('" + np.unique(src_df[pkey]) + "',0)").replace(' ','') + ')'
        if i == 0:
            del_trg_sql = f"""
                DELETE FROM {table_name} WHERE {pkey_list[i]} = :{i+1}
                """
        else:
            del_trg_sql = del_trg_sql + f"""
                AND {pkey_list[i]} = :{i+1}
                """
    data_to_delete = src_df[pkey_list].values.tolist()
    cursor.executemany(del_trg_sql, data_to_delete)
    sqlconn.commit()
    sqlconn.close()
    return True


def check_table_if_exist(table_name, dest):
    if dest.lower() == 'src':
        query = f'SELECT * FROM {table_name.upper()} WHERE ROWNUM = 1'
    elif dest.lower() == 'trg':
        query = f'SELECT * FROM {table_name.upper()} WHERE ROWNUM = 1'
    else:
        return False

    try:
        db_read_sql(query, dest)
        print(f'資料表{table_name.upper()}:存在')
        return True
    except:
        print(f'資料表{table_name.upper()}:不存在')
        return False


def request_sql(table_name, prefix = ['create_table', 'select_table'][1]):
    token = os.getenv('GITHUB_TOKEN')
    sql_path = os.getenv('GITHUB_SQL_PATH')
    url = f'{sql_path}/{prefix.lower()}_{table_name.lower()}.sql'
    response = requests.get(f'{url}?token={token}')
    sql_txt = response.text
    return sql_txt


def update_erp(table_name):
    table_name = table_name.upper()
    print(f'更新表格{table_name}')
    # 如果資料表不存在則建立表格
    if not check_table_if_exist(table_name, 'trg'):
        db_to_sql(request_sql(table_name, 'create_table'), 'trg')
    # 寫入更動資料
    
    if table_name == 'CCC_FILE':
        time_col = "CCC02||LPAD(CCC03, 2, '0')"
    elif table_name == 'IMG_FILE':
        time_col = "to_char(IMG17, 'YYYYMM')"
    elif table_name == 'IMK_FILE':
        time_col = "IMK05||LPAD(IMK06, 2, '0')"
    elif table_name == 'OGA_FILE':
        time_col = "'20'||substr(OGA01, 9, 4)"
    elif table_name == 'OGB_FILE':
        time_col = "'20'||substr(OGB01, 9, 4)"
    elif table_name == 'OHA_FILE':
        time_col = "'20'||substr(OHA01, 9, 4)"
    elif table_name == 'OHB_FILE':
        time_col = "'20'||substr(OHB01, 9, 4)"
    elif table_name == 'TC_OBG_FILE':
        time_col = "to_char(TC_OBG04, 'YYYYMM')"
    elif table_name == 'TLF_FILE':
        time_col = "to_char(TLF07, 'YYYYMM')"
    else:
        time_col = f"SUBSTR(to_char({'_'.join(table_name.split('_')[:-1])+'DATE'},'YYYYMMDD'),1,6)"
    
    src_ym_num_query = f"""
        SELECT 
            {time_col} AS CREATE_TIME,
            count(*) AS NUM_SRC
        FROM {table_name}
        GROUP BY {time_col}
        ORDER BY {time_col}
        """
    trg_ym_num_query = f"""
        SELECT 
            {time_col} AS CREATE_TIME,
            count(*) AS NUM_TRG
        FROM {table_name}
        GROUP BY {time_col}
        ORDER BY {time_col}
        """
    trg_ym_num = db_read_sql(trg_ym_num_query, 'trg')
    if trg_ym_num.shape[0] == 0:
        src_df = db_read_sql(request_sql(table_name, 'select_table'), 'src')
        db_append_sql(src_df, table_name)
    else:
        src_ym_num = db_read_sql(src_ym_num_query, 'src')
        ym_num = src_ym_num.merge(
            trg_ym_num, 
            on = ['CREATE_TIME'],
            how = 'outer',
            indicator = False
            )
        ym_num = ym_num.assign(CHECK = np.select([ym_num['NUM_SRC'] == ym_num['NUM_TRG']], 'Y', 'N'))
        YM = ym_num.loc[ym_num['CHECK'] == 'N'].assign(YM = lambda x: x['CREATE_TIME'])

        if YM.shape[0] != 0:
            idx_start = 0
            idx_range = 10000
            length = YM['YM'].size
            m = math.floor(length / idx_range)
            n = length - m * idx_range
            src_df = []
            for i in range(m+1):
                start_ = i*idx_range+1
                if i == m:
                  end_ = i*idx_range+n
                else:
                  end_ = (i+1)*idx_range
                YM_STR = '(' + ','.join(("'" + YM['YM'].iloc[(start_-1):end_] + "'").tolist()).replace(" ", "") + ')'
                query_src_sql = request_sql(table_name, 'select_table') + f"""
                  \nWHERE REPLACE({time_col}, ' ','') IN {YM_STR}
                  """
                src_df.append(db_read_sql(query_src_sql, 'src'))
                
            src_df = pd.concat(src_df)
 
            if table_name == 'TLF_FILE':
                YM_STR = '(' + ','.join(("'" + YM['YM'] + "'").tolist()).replace(" ", "") + ')'
                db_to_sql(f"DELETE FROM {table_name} WHERE REPLACE({time_col}, ' ','') IN {YM_STR}", 'trg')
            else:
                # db_delete_sql(src_df, table_name)
                YM_STR = '(' + ','.join(("'" + YM['YM'] + "'").tolist()).replace(" ", "") + ')'
                db_to_sql(f"DELETE FROM {table_name} WHERE REPLACE({time_col}, ' ','') IN {YM_STR}", 'trg')

            db_append_sql(src_df, table_name)
            
            return True


def check_table():
    table_names = [
        "BMA_FILE",
        "BMB_FILE",
        "CCC_FILE",
        "GEM_FILE",
        "IMA_FILE",
        "IMD_FILE",
        "IMG_FILE",
        "IMK_FILE",
        "OCC_FILE",
        "OGA_FILE",
        "OGB_FILE",
        "OHA_FILE",
        "OHB_FILE",
        "TC_OBG_FILE",
        "TC_OBK_FILE",
        "TLF_FILE"
        ]
    check_table = pd.DataFrame(
        table_names,
        columns = ['TABLE_NAME']
        )
    
    for i, table_name in enumerate(table_names):
        src_ym_num_query = f"""
            SELECT 
                CAST(count(*) AS INT) AS NUM_SRC
            FROM {table_name}
            """
        trg_ym_num_query = f"""
            SELECT 
                CAST(count(*) AS INT) AS NUM_TRG
            FROM {table_name}
            """
        check_table.loc[check_table['TABLE_NAME'] == table_name, 'NUM_SRC'] = db_read_sql(src_ym_num_query, 'src').iloc[0,0]
        check_table.loc[check_table['TABLE_NAME'] == table_name, 'NUM_TRG'] = db_read_sql(trg_ym_num_query, 'trg').iloc[0,0]
        check_table.loc[check_table['TABLE_NAME'] == table_name, 'TIME'] = (datetime.utcnow() + timedelta(hours=+8)).strftime("%Y-%m-%dT%H:%M:%S")
    check_table = check_table.assign(CHECK = np.select([check_table['NUM_TRG'] == check_table['NUM_SRC']], 'Y', 'N'))
    return check_table

