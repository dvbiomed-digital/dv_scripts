CREATE TABLE CRMGG (
  COMPANY           nchar(40)
, CREATOR           nchar(10)
, USR_GROUP         nchar(10)
, CREATE_DATE       nchar(8)
, MODIFIER          nchar(10)
, MODI_DATE         nchar(8)
, FLAG              numeric(5, 0)
, GG001             nvarchar2(10) NOT NULL PRIMARY KEY
, GG002             nvarchar2(1)
, GG003             nvarchar2(50)
, GG004             nvarchar2(100)
, GG005             nvarchar2(6)
, GG006             nvarchar2(6)
, GG007             nvarchar2(6)
, GG008             nvarchar2(10)
, GG009             nvarchar2(10)
, GG010             nvarchar2(10)
, GG011             nvarchar2(6)
, GG012             nvarchar2(6)
, GG013             nvarchar2(6)
, GG014             nvarchar2(6)
, GG015             nvarchar2(100)
, GG016             nvarchar2(8)
, GG017             nvarchar2(8)
, GG018             nvarchar2(50)
, GG019             nvarchar2(50)
, GG020             nvarchar2(5)
, GG021             nvarchar2(10)
, GG022             nvarchar2(20)
, GG023             nvarchar2(8)
, GG024             nvarchar2(20)
, GG025             nvarchar2(8)
, GG026             nvarchar2(10)
, GG027             nvarchar2(20)
, GG028             nvarchar2(100)
, GG029             nvarchar2(5)
, GG030             nvarchar2(100)
, GG031             numeric(24, 8)
, GG032             numeric(10, 0)
, GG033             numeric(24, 8)
, GG034             numeric(5, 2)
, GG035             numeric(5, 0)
, GG036             nvarchar2(255)
, GG037             nvarchar2(10)
, GG038             nvarchar2(255)
, GG039             nvarchar2(10)
, GG040             nvarchar2(4000)
, GG041             nvarchar2(1)
, GG042             nvarchar2(10)
, GG043             nvarchar2(10)
, GG044             nchar(1)
, GG045             nchar(1)
, GG046             nchar(1)
, GG047             nvarchar2(6)
, GG048             nvarchar2(20)
, GG049             nvarchar2(4000)
, GG050             nvarchar2(10)
, GG051             nvarchar2(4000)
, GG052             nchar(1)
, GG053             nchar(8)
, GG054             nchar(20)
, GG055             nchar(6)
, GG056             nchar(6)
, GG057             numeric(10, 0)
, GG058             numeric(10, 0)
, GG059             nvarchar2(50)
, GG060             nvarchar2(50)
, GG061             nchar(1)
, GG062             nvarchar2(40)
, GG063             nchar(1)
, GG064             nvarchar2(5)
, GG065             nvarchar2(20)
, GG066             nvarchar2(20)
, GG067             nvarchar2(255)
, GG068             nvarchar2(10)
, GG069             nvarchar2(6)
, GG070             nvarchar2(6)
, GG071             nvarchar2(100)
, GG072             nvarchar2(100)
, GG073             nvarchar2(100)
, GG074             nvarchar2(100)
, GG075             nvarchar2(100)
, GG076             nvarchar2(1)
, GG077             nvarchar2(6)
, GG078             nvarchar2(10)
, GG079             nvarchar2(30)
, GG080             nchar(1)
, GG081             nchar(1)
, GG082             nvarchar2(255)
, GG083             nvarchar2(255)
, GG084             nchar(6)
, GG085             nchar(6)
, GG086             nchar(18)
, GG087             nchar(18)
, GG088             nchar(18)
, GG089             nchar(1)
, GG090             nchar(1)
, GG091             nchar(10)
, GG092             nchar(2)
, GG093             nchar(40)
, GG094             nchar(255)
, GG095             nchar(255)
, GG096             nchar(255)
, GG097             nchar(255)
, GG098             nchar(1)
, GG099             numeric(3, 0)
, GG100             numeric(3, 0)
, GG101             nvarchar2(10)
, GG102             nvarchar2(10)
, GG103             nchar(1)
, GG104             nvarchar2(100)
, GG105             nvarchar2(200)
, GG106             nvarchar2(10)
, GG107             nchar(1)
, GG108             nvarchar2(500)
, GG109             nchar(4)
, GG110             nchar(10)
, GG111             nchar(1)
, GG112             nchar(1)
, GG113             nchar(1)
, GG114             nchar(4)
, GG115             nvarchar2(20)
, GG116             nvarchar2(6)
, GG117             numeric(21, 6)
, GG118             numeric(15, 6)
, GG119             nchar(1)
, GG120             nvarchar2(30)
, GG121             nvarchar2(60)
, GG122             nchar(15)
, GG123             numeric(8, 5)
, GG124             nchar(1)
, GG125             numeric(3, 0)
, GG126             nchar(6)
, GG127             numeric(8, 5)
, GG128             numeric(8, 5)
, GG129             numeric(8, 5)
, GG130             numeric(8, 5)
, GG131             numeric(8, 5)
, CUSTOMER          nchar(20)
, PRODUCT           nchar(20)
, REGION            nchar(20)
, DEALER            nchar(20)
, GG132             nchar(1)
, GG133             numeric(21, 6)
, GG134             nvarchar2(10)
, GG135             nvarchar2(10)
, GG136             nvarchar2(1)
, GG137             numeric(10, 0)
, GG138             nvarchar2(5)
, GG139             nchar(6)
, GG140             nvarchar2(1)
, GG141             numeric(21, 6)
, GG142             nvarchar2(10)
, GG143             nvarchar2(10)
, GG144             numeric(10, 0)
, GG145             numeric(21, 6)
, GG146             nvarchar2(10)
, GG147             nvarchar2(10)
, GG148             numeric(10, 0)
, GG149             nchar(10)
, GG150             nchar(10)
, CRMGG01           nvarchar2(255)
, CRMGG02           nvarchar2(255)
, CRMGG03           nvarchar2(255)
, CRMGG04           nvarchar2(255)
, CRMGG05           nvarchar2(255)
, CRMGG06           nvarchar2(255)
, CRMGG07           nvarchar2(255)
, CRMGG08           nvarchar2(255)
, CRMGG09           nvarchar2(255)
, CRMGG10           nvarchar2(255)
, CRMGG11           nvarchar2(255)
, CRMGG12           nvarchar2(255)
, CRMGG13           nvarchar2(255)
, CRMGG14           nvarchar2(255)
, CRMGG15           nvarchar2(255)
, CRMGG16           nvarchar2(255)
, CRMGG17           nvarchar2(255)
, CRMGG18           nvarchar2(255)
, CRMGG19           nvarchar2(255)
, CRMGG20           nvarchar2(255)
, GG151             nvarchar2(10)
, GG152             nvarchar2(10)
, GG200             nvarchar2(5)
, GG201             nvarchar2(10)
, GG202             nvarchar2(20)
, GG203             nvarchar2(1000)
, GG204             numeric(5, 2)
, GG205             numeric(5, 2)
, GG206             nchar(1)
, GG207             numeric(21, 6)
, GG300             nchar(6)
, GG301             nchar(1)
, GG302             nchar(8)
, GG303             nchar(4)
, GG304             nchar(1)
, GG305             nchar(1)
, GG306             nchar(10)
, GG307             nchar(10)
, GG308             nchar(10)
, GG309             nchar(1)
, GG310             nchar(10)
, GG311             nchar(10)
, GG312             nchar(1)
, GG313             nchar(10)
, GG314             nchar(8)
, GG315             nchar(10)
)