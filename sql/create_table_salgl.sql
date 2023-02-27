CREATE TABLE SALGL (
  COMPANY           nchar(40)
, CREATOR           nchar(10)
, USR_GROUP	        nchar(10)
, CREATE_DATE	      nchar(8)
, MODIFIER	        nchar(10)
, MODI_DATE	        nchar(8)
, FLAG	            numeric(5, 0)
, GL001	            nchar(15) NOT NULL PRIMARY KEY
, GL002	            nchar(120)
, GL003	            nchar(8)
, GL004	            nchar(8)
, GL005	            nchar(10)
, GL006	            nvarchar2(255)
, GL007	            nchar(25)
, GL008	            nvarchar2(60)
, GL009	            numeric(21, 6)
, GL010	            nvarchar2(255)
, CUSTOMER	        nchar(20)
, PRODUCT	          nchar(20)
, REGION	          nchar(20)
, DEALER	          nchar(20)
, GL197	            nchar(10)
, GL198	            nchar(10)
, GL199	            nchar(10)
, SALGL01	          nvarchar2(255)
, SALGL02	          nvarchar2(255)
, SALGL03	          nvarchar2(255)
, SALGL04	          nvarchar2(255)
, SALGL05	          nvarchar2(255)
, SALGL06	          nvarchar2(255)
, SALGL07	          nvarchar2(255)
, SALGL08	          nvarchar2(255)
, SALGL09	          nvarchar2(255)
, SALGL10	          nvarchar2(255)
, SALGL11	          nvarchar2(255)
, SALGL12	          nvarchar2(255)
, SALGL13	          nvarchar2(255)
, SALGL14	          nvarchar2(255)
, SALGL15	          nvarchar2(255)
, SALGL16	          nvarchar2(255)
, SALGL17	          nvarchar2(255)
, SALGL18	          nvarchar2(255)
, SALGL19	          nvarchar2(255)
, SALGL20	          nvarchar2(255)
, GL200	            nchar(80)
, GL201	            nchar(6)
, GL202	            numeric(21, 6)
, GL203	            numeric(21, 6)
, GL204	            numeric(21, 6)
, GL205	            numeric(21, 6)
, GL206	            numeric(21, 6)
, GL207	            nchar(10)
, GL208	            nchar(15)
, GL300	            nchar(10)
, GL301	            nchar(10)
, GL302	            nchar(1)
, GL303	            numeric(21, 6)
, GL304	            nchar(1)
, GL305	            numeric(2, 0)
, GL306	            nchar(1)
, GL307	            nchar(1)
)
	