�
 TCALCFORM 0�  TPF0	TCalcFormCalcFormLeft� TopnWidth�HeighteActiveControlPanel1CaptionCalculated Field
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style PositionpoScreenCenterPixelsPerInch`
TextHeight TPanelPanel1Left Top Width�Height*AlignalTopTabOrder  TPanelPanel2LeftTopWidth� Height(AlignalRight
BevelOuterbvNoneCaptionPanel2TabOrder  TDBNavigatorDBNavigatorLeftTopWidth� Height!
DataSourceDataSource1VisibleButtonsnbFirstnbPriornbNextnbLast FlatTabOrder     TDBGridDBGrid1Left Top*Width�Height AlignalClientColumns	FieldNameNAME 	FieldNameCAPITAL 	FieldNameAREA 	FieldName
POPULATIONWidthM 	FieldNameDENSITYWidthC  
DataSourceDataSource1
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTabOrderTitleFont.ColorclBlackTitleFont.Height�TitleFont.NameArialTitleFont.Style   TDataSourceDataSource1DataSetQuery1LeftTop  TQueryQuery1Active	AutoCalcFieldsDatabaseNameIBLOCALSQL.StringsSELECT$  AMERICAS.NAME , AMERICAS.CAPITAL ,&  AMERICAS.CONTINENT , AMERICAS.AREA ,  AMERICAS.POPULATION ,3  (AMERICAS.POPULATION / AMERICAS.AREA)  as DensityFROM  AMERICAS AMERICASORDER BY  AMERICAS.NAME LeftETop TStringField
Query1NAMEDisplayWidth	FieldNameNAMESize  TStringFieldQuery1CAPITALDisplayWidth	FieldNameCAPITALSize  TFloatField
Query1AREADisplayWidth
	FieldNameAREADisplayFormat###,###,###  TFloatFieldQuery1POPULATIONDisplayWidth	FieldName
POPULATIONDisplayFormat###,###,###  TFloatFieldQuery1DENSITYDisplayWidth	FieldNameDENSITYDisplayFormat###.##    