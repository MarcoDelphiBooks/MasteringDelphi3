�
 TFORM1 0n
  TPF0TForm1Form1LeftTop9WidthcHeightyCaptionSQL Join
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.Style PixelsPerInch`
TextHeight TDBGridDBGrid1Left Top Width[Height^AlignalClientColumns	FieldNameDESCRIPTIONTitle.CaptionProductWidth�  	FieldNameQTYTitle.CaptionAmountWidth2 	FieldNameCOMPANYTitle.CaptionCompany 	FieldNameSALEDATETitle.Caption	Sale Date 	FieldNameLASTNAMETitle.CaptionEmployee  
DataSourceDataSource1TabOrder TitleFont.ColorclBlackTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style   TDataSourceDataSource1DataSetQuery1Left� Top  TQueryQuery1Active	DatabaseNameIBLOCALSQL.Strings'SELECT PARTS.DESCRIPTION , ITEMS.QTY , & CUSTOMER.COMPANY , ORDERS.SALEDATE ,  EMPLOYEE.LASTNAME)FROM ORDERS ORDERS , CUSTOMER CUSTOMER ,  PARTS PARTS , ITEMS ITEMS ,  EMPLOYEE EMPLOYEE)WHERE ( CUSTOMER.CUSTNO = ORDERS.CUSTNO )  AND" ( EMPLOYEE.EMPNO = ORDERS.EMPNO )  AND  ( ITEMS.PARTNO = PARTS.PARTNO )  AND# ( ITEMS.ORDERNO = ORDERS.ORDERNO )ORDER BY% PARTS.DESCRIPTION , CUSTOMER.COMPANY Left@TopData
�  Ver 2.0,QBE - Integra Visual Database Builder,0, 0, 2048, 1442,,,,,
 , , - Distinct & Quote,,,,,
    5, - Number of Tables,-1, -1, 771, 554, 763, 347,,,,
ORDERS,ORDERS,242, 5, 379, 323,,,,,
CUSTOMER,CUSTOMER,20, 10, 143, 175,,,,,
PARTS,PARTS,614, 58, 731, 223,,,,,
ITEMS,ITEMS,434, 70, 551, 195,,,,,
EMPLOYEE,EMPLOYEE,58, 185, 187, 325,,,,,
    5, - Number of Columns,,,,,,
DESCRIPTION,PARTS,                  65,     , ,,1,
     , - Number of Criteria,,,,,,
QTY,ITEMS,                   1,     , ,,,
     , - Number of Criteria,,,,,,
COMPANY,CUSTOMER,                  65,     , ,,2,
     , - Number of Criteria,,,,,,
SALEDATE,ORDERS,                   1,     , ,,,
     , - Number of Criteria,,,,,,
LASTNAME,EMPLOYEE,                   1,     , ,,,
     , - Number of Criteria,,,,,,
    4, - Number of Joins,,,,,,
CUSTNO,CUSTOMER,CUSTNO,ORDERS,          ,          ,,
EMPNO,EMPLOYEE,EMPNO,ORDERS,          ,          ,,
PARTNO,ITEMS,PARTNO,PARTS,          ,          ,,
ORDERNO,ITEMS,ORDERNO,ORDERS,          ,          ,,

"SELECT Statement"
,,,,,,,
SELECT	PARTS.DESCRIPTION , ITEMS.QTY , 
	CUSTOMER.COMPANY , ORDERS.SALEDATE , 
	EMPLOYEE.LASTNAME
FROM	ORDERS ORDERS , CUSTOMER CUSTOMER , 
	PARTS PARTS , ITEMS ITEMS , 
	EMPLOYEE EMPLOYEE
WHERE	( CUSTOMER.CUSTNO = ORDERS.CUSTNO )
		AND
	( EMPLOYEE.EMPNO = ORDERS.EMPNO )
		AND
	( ITEMS.PARTNO = PARTS.PARTNO )
		AND
	( ITEMS.ORDERNO = ORDERS.ORDERNO )
ORDER BY
	PARTS.DESCRIPTION , CUSTOMER.COMPANY,,,,,,,
   