�
 TNAVIGFORM 0H  TPF0
TNavigForm	NavigFormLeft� Top� Width1Height� Caption	NavigForm
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.Style OnCreate
FormCreatePixelsPerInch`
TextHeight TBevelBevel1Left TopWidth)HeightyAlignalTop  TLabelLabel3Left ToplWidth9HeightCaption
Continent:  TLabelLabel2Left TopKWidth1HeightCaptionCapital:  TLabelLabel1Left Top(Width6HeightCaptionCountry:  	TGroupBox	GroupBox1Left Top� Width)HeightBAlignalClientCaption	SelectionCtl3D	ParentCtl3DTabOrder  TRadioButtonRadioButton2LeftTopWidthaHeightCaptionNorth AmericaChecked	TabOrder TabStop	OnClickRadioButton2Click  TRadioButtonRadioButton3LeftTop%WidthaHeightCaptionSouth AmericaTabOrderOnClickRadioButton2Click   TDBEditDBEdit3Left`TophWidth� Height	DataField	Continent
DataSourceDataSource1	MaxLength TabOrder  TDBEditDBEdit2Left`TopFWidth� Height	DataFieldCapital
DataSourceDataSource1	MaxLengthTabOrder  TDBEditDBEdit1Left`Top$Width� Height	DataFieldName
DataSourceDataSource1	MaxLengthTabOrder  TDBNavigatorDBNavigator1Left Top Width)Height
DataSourceDataSource1VisibleButtonsnbFirstnbPriornbNextnbLastnbInsertnbEditnbPostnbCancel AlignalTopFlat	TabOrder  TDataSourceDataSource1DataSetQuery1Left� Top�   TQueryQuery1DatabaseNameDBDEMOSParams.Data
"     	Continent  North America  RequestLive	SQL.Strings2select * from Country where Continent = :Continent Left� Top�    