�
 TFORM1 0�  TPF0TForm1Form1LeftDTop"Width<Height�CaptionSQL JoinFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.Style PixelsPerInch`
TextHeight TDBGridDBGrid1Left Top Width4HeightAlignalClient
DataSourceDataSource1TabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclBlackTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style   TQueryQuery1Active	DatabaseNameIBLOCALSQL.Strings+SELECT CUSTOMER.COMPANY , ORDERS.ORDERNO , ' EMPLOYEE.LASTNAME , ORDERS.SALEDATE , " CUSTOMER.STATE , CUSTOMER.COUNTRY)FROM CUSTOMER CUSTOMER , ORDERS ORDERS ,  EMPLOYEE EMPLOYEE)WHERE ( CUSTOMER.CUSTNO = ORDERS.CUSTNO )  AND" ( EMPLOYEE.EMPNO = ORDERS.EMPNO )ORDER BY% CUSTOMER.COMPANY , EMPLOYEE.LASTNAME Left@TopData
&  Ver 2.0,QBE - Integra Visual Database Builder,0, 0, 2048, 1442,,,,,
 , , - Distinct & Quote,,,,,
    3, - Number of Tables,-1, -1, 654, 471, 646, 220,,,,
CUSTOMER,CUSTOMER,20, 10, 143, 175,,,,,
ORDERS,ORDERS,180, 11, 366, 189,,,,,
EMPLOYEE,EMPLOYEE,409, 11, 564, 189,,,,,
    6, - Number of Columns,,,,,,
COMPANY,CUSTOMER,                  65,     , ,,1,
     , - Number of Criteria,,,,,,
ORDERNO,ORDERS,                   1,     , ,,,
     , - Number of Criteria,,,,,,
LASTNAME,EMPLOYEE,                  65,     , ,,2,
     , - Number of Criteria,,,,,,
SALEDATE,ORDERS,                   1,     , ,,,
     , - Number of Criteria,,,,,,
STATE,CUSTOMER,                   1,     , ,,,
     , - Number of Criteria,,,,,,
COUNTRY,CUSTOMER,                   1,     , ,,,
     , - Number of Criteria,,,,,,
    2, - Number of Joins,,,,,,
CUSTNO,CUSTOMER,CUSTNO,ORDERS,          ,          ,,
EMPNO,EMPLOYEE,EMPNO,ORDERS,          ,          ,,

"SELECT Statement"
,,,,,,,
SELECT	CUSTOMER.COMPANY , ORDERS.ORDERNO , 
	EMPLOYEE.LASTNAME , ORDERS.SALEDATE , 
	CUSTOMER.STATE , CUSTOMER.COUNTRY
FROM	CUSTOMER CUSTOMER , ORDERS ORDERS , 
	EMPLOYEE EMPLOYEE
WHERE	( CUSTOMER.CUSTNO = ORDERS.CUSTNO )
		AND
	( EMPLOYEE.EMPNO = ORDERS.EMPNO )
ORDER BY
	CUSTOMER.COMPANY , EMPLOYEE.LASTNAME,,,,,,,
  TDataSourceDataSource1DataSetQuery1Left� Top   