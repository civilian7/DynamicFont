object FontForm: TFontForm
  Left = 0
  Top = 0
  VertScrollBar.Tracking = True
  ActiveControl = pnlSearch
  Caption = 'Font'
  ClientHeight = 641
  ClientWidth = 964
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -27
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  TextHeight = 37
  object pnlSearch: TPanel
    Left = 0
    Top = 0
    Width = 964
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    ExplicitWidth = 904
    DesignSize = (
      964
      57)
    object lblUntitled: TLabel
      Left = 666
      Top = 18
      Width = 126
      Height = 21
      Anchors = [akTop, akRight]
      Caption = '(use * for untitled)'
      Layout = tlCenter
      ExplicitLeft = 486
    end
    object lblFound: TLabel
      Left = 833
      Top = 18
      Width = 116
      Height = 21
      Hint = ' symbols found'
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = '0 symbols found'
      Layout = tlCenter
      ExplicitLeft = 653
    end
    object cbxFont: TComboBox
      Left = 8
      Top = 16
      Width = 185
      Height = 29
      Style = csDropDownList
      ParentColor = True
      TabOrder = 0
      OnChange = cbxFontChange
    end
    object edtSearch: TEdit
      Left = 460
      Top = 16
      Width = 200
      Height = 29
      Anchors = [akTop, akRight]
      TabOrder = 1
      OnChange = cbxFontChange
      ExplicitLeft = 400
    end
  end
  object clSymbols: TControlList
    Left = 0
    Top = 57
    Width = 964
    Height = 537
    Align = alClient
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemWidth = 300
    ItemHeight = 140
    ItemMargins.Left = 0
    ItemMargins.Top = 0
    ItemMargins.Right = 0
    ItemMargins.Bottom = 0
    ColumnLayout = cltMultiTopToBottom
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    OnItemDblClick = clSymbolsItemDblClick
    ExplicitWidth = 904
    ExplicitHeight = 358
    object lblSymbol: TLabel
      Left = 8
      Top = -6
      Width = 79
      Height = 111
      Alignment = taCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -67
      Font.Name = 'Segoe Fluent Icons'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object lblCode: TLabel
      Left = 98
      Top = 17
      Width = 191
      Height = 25
      AutoSize = False
    end
    object lblName: TLabel
      Left = 93
      Top = 48
      Width = 196
      Height = 93
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 594
    Width = 964
    Height = 47
    Align = alBottom
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 2
    ExplicitTop = 415
    ExplicitWidth = 904
    object btnCancel: TButton
      AlignWithMargins = True
      Left = 886
      Top = 8
      Width = 75
      Height = 32
      Margins.Top = 8
      Margins.Bottom = 7
      Align = alRight
      Caption = #52712#49548
      ModalResult = 2
      TabOrder = 0
      ExplicitLeft = 826
    end
    object btnOk: TButton
      AlignWithMargins = True
      Left = 805
      Top = 8
      Width = 75
      Height = 32
      Margins.Top = 8
      Margins.Bottom = 7
      Align = alRight
      Caption = #54869#51064
      ModalResult = 1
      TabOrder = 1
      ExplicitLeft = 745
    end
    object btnClear: TButton
      AlignWithMargins = True
      Left = 514
      Top = 8
      Width = 75
      Height = 32
      Margins.Top = 8
      Margins.Bottom = 7
      Align = alLeft
      Caption = #51648#50864#44592
      TabOrder = 2
      OnClick = btnClearClick
    end
    object eSymbols: TEdit
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 505
      Height = 41
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      ExplicitHeight = 40
    end
  end
  object mtFont: TFDMemTable
    Active = True
    FilterOptions = [foCaseInsensitive]
    FieldDefs = <
      item
        Name = 'IDFont'
        Attributes = [faRequired]
        DataType = ftByte
      end
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Char'
        Attributes = [faRequired]
        DataType = ftWideString
        Size = 1
      end
      item
        Name = 'Name'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <
      item
        Name = 'pkID'
        Fields = 'IDFont;ID'
        Options = [ixPrimary]
      end
      item
        Name = 'ixName'
        Fields = 'Name'
        Options = [ixCaseInsensitive, ixNonMaintained]
      end>
    Indexes = <
      item
        Active = True
        Name = 'pkID'
        Fields = 'IDFont;ID'
        Options = [soUnique, soPrimary]
      end
      item
        Name = 'ixName'
        Fields = 'Name'
        Options = [soNoCase]
      end>
    IndexesActive = False
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 344
    Top = 80
  end
  object bsFont: TBindSourceDB
    DataSet = mtFont
    ScopeMappings = <>
    Left = 392
    Top = 80
  end
  object blFont: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 438
    Top = 79
    object LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = bsFont
      GridControl = clSymbols
      Columns = <>
    end
    object LinkPropertyToFieldCaption: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bsFont
      FieldName = 'ID'
      Component = lblCode
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption2: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bsFont
      FieldName = 'Char'
      Component = lblSymbol
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption3: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bsFont
      FieldName = 'Name'
      Component = lblName
      ComponentProperty = 'Caption'
    end
  end
end
