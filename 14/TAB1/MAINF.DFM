�
 TFORM1 0�  TPF0TForm1Form1Left� Top� Width�Height� CaptionTab Test AppFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.Style OnCreate
FormCreatePixelsPerInch`
TextHeight 	TNotebook	Notebook1Left Top Width�Height� AlignalClientTabOrder  TPage Left Top CaptionOne TLabelLabel1LeftTopWidthyHeightaAutoSizeCaption1First page: The list of the pages of the notebookWordWrap	  TListBoxListBox1Left� TopWidth� Heighty
ItemHeightTabOrder OnClickListBox1Click   TPage Left Top CaptionTwo TLabelLabel2LeftTopWidth� HeightYAutoSizeCaption+Second page: Change tabset background styleWordWrap	  	TGroupBox	GroupBox1Left� Top Width� HeightiCaption	DitheringTabOrder  TRadioButtonRadioButton1Left@TopWidthaHeightCaptionOnTabOrder OnClickRadioButton1Click  TRadioButtonRadioButton2Left@Top@WidthYHeightCaptionOffChecked	TabOrderTabStop	OnClickRadioButton2Click    TPage Left Top CaptionThree TLabelLabel3LeftTopWidthiHeightAutoSizeCaption2Third page: Select form and tabset backgound color  
TColorGrid
ColorGrid1Left-Top8Width@HeightPGridOrderinggo8x2ForegroundIndexBackgroundIndexTabOrder OnChangeColorGrid1Change   TPage Left Top CaptionFour TLabelLabel4LeftTopWidth� HeightIAutoSizeCaption<Fourth page: Change tabs (there should be always 5 strings!)WordWrap	  TMemoMemo1Left� TopWidth� HeightqTabOrder   TButtonChangeButtonLeft(TophWidthYHeight!CaptionChangeTabOrderOnClickChangeButtonClick   TPage Left Top CaptionFive TLabelLabel5LeftTopWidth/HeightCaption
Fifth page  TLabelLabel6LeftCTop(WidthHeightmCaptionHello !Font.CharsetDEFAULT_CHARSET
Font.ColorclRedFont.Height�	Font.NameTimes New Roman
Font.StylefsBold 
ParentFont    TTabSetTabSet1Left Top� Width�Height AlignalBottomDitherBackground	EndMarginFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.Style StartMargin	TabHeightTabs.StringsPages	DitheringColorsTabsHello TabIndex OnChangeTabSet1Change   