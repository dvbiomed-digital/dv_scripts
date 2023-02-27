CREATE TABLE CRMYA (
  COMPANY           nchar(40)
, CREATOR           nchar(10)
, USR_GROUP         nchar(10)
, CREATE_DATE       nchar(8)
, MODIFIER          nchar(10)
, MODI_DATE         nchar(8)
, FLAG              numeric(5, 0)
, CUSTOMER          nchar(20)
, PRODUCT           nchar(20)
, REGION            nchar(20)
, DEALER            nchar(20)
, YA001             nchar(10) NOT NULL
, YA002             nchar(10) NOT NULL
, YA003             nchar(10)
, YA004             nchar(6)
, YA005             nchar(8)
, YA006             nchar(8)
, YA007             nchar(8)
, CRMYA01           nvarchar2(255)
, CRMYA02           nvarchar2(255)
, CRMYA03           nvarchar2(255)
, CRMYA04           nvarchar2(255)
, CRMYA05           nvarchar2(255)
, CRMYA06           nvarchar2(255)
, CRMYA07           nvarchar2(255)
, CRMYA08           nvarchar2(255)
, CRMYA09           nvarchar2(255)
, CRMYA10           nvarchar2(255)
, CRMYA11           nvarchar2(255)
, CRMYA12           nvarchar2(255)
, CRMYA13           nvarchar2(255)
, CRMYA14           nvarchar2(255)
, CRMYA15           nvarchar2(255)
, CRMYA16           nvarchar2(255)
, CRMYA17           nvarchar2(255)
, CRMYA18           nvarchar2(255)
, CRMYA19           nvarchar2(255)
, CRMYA20           nvarchar2(255)
, YA008             nchar(10)
, YA009             nchar(10)
, YA010             nchar(10)
, YA011             nchar(10)
, YA012             nchar(1)
, YA013             nchar(10)
, YA014             nchar(8)
, YA015             nchar(1)
, YA016             nchar(1)
, YA017             nchar(10)
, YA018             nchar(8)
, YA019             nchar(50)
, YA020             numeric(21, 6)
, YA021             nchar(6)
, YA022             nchar(1)
, CONSTRAINT "PK_YA001_YA002" PRIMARY KEY ("YA001", "YA002")
)