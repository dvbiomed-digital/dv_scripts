CREATE TABLE OHB_FILE (
	"OHB01" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"OHB03" NUMBER(5,0) NOT NULL ENABLE, 
	"OHB04" VARCHAR2(40 BYTE), 
	"OHB05" VARCHAR2(4 BYTE), 
	"OHB05_FAC" NUMBER(20,8) NOT NULL ENABLE, 
	"OHB06" VARCHAR2(120 BYTE), 
	"OHB07" VARCHAR2(10 BYTE), 
	"OHB08" VARCHAR2(10 BYTE), 
	"OHB09" VARCHAR2(10 BYTE), 
	"OHB091" VARCHAR2(10 BYTE), 
	"OHB092" VARCHAR2(24 BYTE), 
	"OHB11" VARCHAR2(40 BYTE), 
	"OHB12" NUMBER(15,3) NOT NULL ENABLE, 
	"OHB13" NUMBER(20,6) NOT NULL ENABLE, 
	"OHB14" NUMBER(20,6) NOT NULL ENABLE, 
	"OHB14T" NUMBER(20,6) NOT NULL ENABLE, 
	"OHB15" VARCHAR2(4 BYTE), 
	"OHB15_FAC" NUMBER(20,8) NOT NULL ENABLE, 
	"OHB16" NUMBER(15,3) NOT NULL ENABLE, 
	"OHB30" VARCHAR2(20 BYTE), 
	"OHB31" VARCHAR2(20 BYTE), 
	"OHB32" NUMBER(5,0), 
	"OHB33" VARCHAR2(20 BYTE), 
	"OHB34" NUMBER(5,0), 
	"OHB50" VARCHAR2(10 BYTE), 
	"OHB51" VARCHAR2(30 BYTE), 
	"OHB52" VARCHAR2(20 BYTE), 
	"OHB53" VARCHAR2(1 BYTE), 
	"OHB60" NUMBER(15,3) NOT NULL ENABLE, 
	"OHB910" VARCHAR2(4 BYTE), 
	"OHB911" NUMBER(20,8), 
	"OHB912" NUMBER(15,3), 
	"OHB913" VARCHAR2(4 BYTE), 
	"OHB914" NUMBER(20,8), 
	"OHB915" NUMBER(15,3), 
	"OHB916" VARCHAR2(4 BYTE), 
	"OHB917" NUMBER(15,3), 
	"OHB1001" VARCHAR2(10 BYTE), 
	"OHB1002" VARCHAR2(20 BYTE), 
	"OHB1003" NUMBER(9,4), 
	"OHB1004" VARCHAR2(1 BYTE), 
	"OHB1005" VARCHAR2(1 BYTE), 
	"OHB1007" VARCHAR2(20 BYTE), 
	"OHB1008" VARCHAR2(4 BYTE), 
	"OHB1009" NUMBER(9,4), 
	"OHB1010" VARCHAR2(1 BYTE), 
	"OHB1011" VARCHAR2(15 BYTE), 
	"OHB930" VARCHAR2(10 BYTE), 
	"OHB1012" NUMBER(20,6), 
	"OHB61" VARCHAR2(1 BYTE), 
	"OHBUD01" VARCHAR2(255 BYTE), 
	"OHBUD02" VARCHAR2(40 BYTE), 
	"OHBUD03" VARCHAR2(40 BYTE), 
	"OHBUD04" VARCHAR2(40 BYTE), 
	"OHBUD05" VARCHAR2(40 BYTE), 
	"OHBUD06" VARCHAR2(40 BYTE), 
	"OHBUD07" NUMBER(15,3), 
	"OHBUD08" NUMBER(15,3), 
	"OHBUD09" NUMBER(15,3), 
	"OHBUD10" NUMBER(10,0), 
	"OHBUD11" NUMBER(10,0), 
	"OHBUD12" NUMBER(10,0), 
	"OHBUD13" DATE, 
	"OHBUD14" DATE, 
	"OHBUD15" DATE, 
	"OHB64" VARCHAR2(1 BYTE) DEFAULT ' ' NOT NULL ENABLE, 
	"OHB65" NUMBER(5,2), 
	"OHB66" NUMBER(5,2), 
	"OHB67" NUMBER(20,6) DEFAULT 0 NOT NULL ENABLE, 
	"OHB68" VARCHAR2(1 BYTE) DEFAULT 'N' NOT NULL ENABLE, 
	"OHBPLANT" VARCHAR2(10 BYTE) NOT NULL ENABLE, 
	"OHBLEGAL" VARCHAR2(10 BYTE) NOT NULL ENABLE, 
	"OHB69" VARCHAR2(20 BYTE), 
	"OHB70" VARCHAR2(10 BYTE), 
	"OHB37" NUMBER(20,6) DEFAULT 0 NOT NULL ENABLE, 
	"OHB40" VARCHAR2(10 BYTE), 
	"OHB71" VARCHAR2(20 BYTE), 
	"OHB56" NUMBER(5,0), 
	"OHB72" NUMBER(22,2), 
	 CONSTRAINT "OHB_PK" PRIMARY KEY ("OHB01", "OHB03")
)