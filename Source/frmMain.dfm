object MainForm: TMainForm
  AlignWithMargins = True
  Left = 0
  Top = 0
  ActiveControl = redLetter
  Caption = 'Mail'
  ClientHeight = 561
  ClientWidth = 1084
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  ShowHint = True
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  DesignSize = (
    1084
    561)
  TextHeight = 20
  object pnlLetter: TPanel
    AlignWithMargins = True
    Left = 36
    Top = 3
    Width = 1012
    Height = 522
    Margins.Left = 36
    Margins.Right = 36
    Margins.Bottom = 36
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnlLetterTop: TPanel
      Left = 0
      Top = 0
      Width = 1012
      Height = 46
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object tstLetterTop: TTabSet
        Left = 0
        Top = 0
        Width = 824
        Height = 46
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        Style = tsIDETabs
        TabHeight = 40
        Tabs.Strings = (
          '   Format   '
          '   Insert   '
          '   Options   ')
        TabIndex = 0
        TabPosition = tpTop
        StyleElements = [seFont, seBorder]
        OnChange = tstLetterTopChange
      end
      object tlbLetterTop: TToolBar
        Left = 824
        Top = 0
        Width = 188
        Height = 46
        Align = alRight
        ButtonHeight = 46
        ButtonWidth = 141
        Caption = 'tlbLetterTop'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Segoe Fluent Icons'
        Font.Style = []
        Images = imlToolBar40
        List = True
        ParentFont = False
        ShowCaptions = True
        AllowTextButtons = True
        TabOrder = 1
        object tbnDiscard: TToolButton
          Left = 0
          Top = 0
          Caption = ' '#59213' Discard '
          Style = tbsTextButton
          OnClick = tbnBoldClick
        end
        object tbnSend: TToolButton
          Left = 101
          Top = 0
          Caption = ' '#59172' Send '
          Style = tbsTextButton
          OnClick = tbnBoldClick
        end
      end
    end
    object cplLetter: TCardPanel
      Left = 0
      Top = 46
      Width = 1012
      Height = 40
      Align = alTop
      ActiveCard = crdFormat
      TabOrder = 1
      object crdFormat: TCard
        Left = 1
        Top = 1
        Width = 1010
        Height = 38
        Caption = 'crdFormat'
        CardIndex = 0
        TabOrder = 0
        object tlbFormat: TToolBar
          Left = 0
          Top = 0
          Width = 1010
          Height = 38
          Hint = 'Language'
          AutoSize = True
          ButtonHeight = 38
          ButtonWidth = 75
          Caption = 'tlbLetterTop'
          Color = clBtnFace
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe Fluent Icons'
          Font.Style = []
          Images = imlToolbar32
          List = True
          ParentColor = False
          ParentFont = False
          ShowCaptions = True
          AllowTextButtons = True
          TabOrder = 0
          Transparent = True
          object tbnDividerBegin: TToolButton
            Left = 0
            Top = 0
            Width = 8
            Caption = 'tbnDividerBegin'
            ImageIndex = 0
            Style = tbsDivider
          end
          object cmbFont: TComboBox
            Left = 8
            Top = 0
            Width = 249
            Height = 30
            Hint = 'Font'
            Style = csOwnerDrawVariable
            DropDownCount = 11
            ItemHeight = 24
            TabOrder = 0
            StyleElements = [seFont, seBorder]
            OnChange = cmbFontChange
          end
          object tbnDividerFont: TToolButton
            Left = 257
            Top = 0
            Width = 8
            Caption = 'tbnDividerFont'
            ImageIndex = 0
            Style = tbsDivider
          end
          object cmbSize: TComboBox
            Left = 265
            Top = 0
            Width = 63
            Height = 30
            Hint = 'Font Size'
            Style = csOwnerDrawVariable
            DropDownCount = 11
            ItemHeight = 24
            TabOrder = 1
            StyleElements = [seFont, seBorder]
          end
          object tbnDividerSize: TToolButton
            Left = 328
            Top = 0
            Width = 8
            Caption = 'tbnDividerSize'
            ImageIndex = 0
            Style = tbsDivider
          end
          object tbnBold: TToolButton
            Left = 336
            Top = 0
            Hint = 'Bold'
            Caption = ' '#59613' '
            Style = tbsTextButton
            OnClick = tbnBoldClick
          end
          object tbnItalic: TToolButton
            Left = 378
            Top = 0
            Hint = 'Italic'
            Caption = ' '#59611' '
            Style = tbsTextButton
            OnClick = tbnBoldClick
          end
          object tbnUnderline: TToolButton
            Left = 420
            Top = 0
            Hint = 'Underline'
            Caption = ' '#59612' '
            Style = tbsTextButton
            OnClick = tbnBoldClick
          end
          object tbnHighlight: TToolButton
            Left = 462
            Top = 0
            Hint = 'Highlight'
            Caption = ' '#59366' '
            Style = tbsTextButton
            OnClick = tbnBoldClick
          end
          object tbnFontColor: TToolButton
            Left = 504
            Top = 0
            Hint = 'Font Color'
            Caption = ' '#59603' '
            Style = tbsTextButton
            OnClick = tbnBoldClick
          end
          object bvlFont: TBevel
            Left = 546
            Top = 0
            Width = 1
            Height = 38
            Shape = bsLeftLine
          end
          object tbnBullets: TToolButton
            Left = 547
            Top = 0
            Hint = 'Bullets'
            Caption = ' '#59645' '
            Style = tbsTextButton
            OnClick = tbnBoldClick
          end
          object tbnAlign: TToolButton
            Left = 589
            Top = 0
            Hint = 'Align'
            Caption = ' '#59619' '
            Style = tbsTextButton
            OnClick = tbnAlignClick
          end
        end
      end
      object crdInsert: TCard
        Left = 1
        Top = 1
        Width = 1010
        Height = 38
        Caption = 'crdInsert'
        CardIndex = 1
        TabOrder = 1
        object tlbInsert: TToolBar
          Left = 0
          Top = 0
          Width = 1010
          Height = 38
          AutoSize = True
          ButtonHeight = 38
          ButtonWidth = 131
          Caption = 'tlbLetterTop'
          Color = clBtnHighlight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe Fluent Icons'
          Font.Style = []
          Images = imlToolbar32
          List = True
          ParentColor = False
          ParentFont = False
          ShowCaptions = True
          AllowTextButtons = True
          TabOrder = 0
          Transparent = True
          object tbnFiles: TToolButton
            Left = 0
            Top = 0
            Caption = ' '#59171' Files '
            Style = tbsTextButton
            OnClick = tbnBoldClick
          end
          object tbnTable: TToolButton
            Left = 77
            Top = 0
            Caption = ' '#62841' Table '
            Style = tbsTextButton
            OnClick = tbnBoldClick
          end
          object tbnPictures: TToolButton
            Left = 161
            Top = 0
            Caption = ' '#57620' Pictures '
            Style = tbsTextButton
            OnClick = tbnBoldClick
          end
          object tbnLink: TToolButton
            Left = 260
            Top = 0
            Caption = ' '#59163' Link '
            Style = tbsTextButton
            OnClick = tbnBoldClick
          end
          object tbnEmoji: TToolButton
            Left = 334
            Top = 0
            Caption = ' '#60756' Emoji '
            Style = tbsTextButton
            OnClick = tbnBoldClick
          end
        end
      end
      object crdOptions: TCard
        Left = 1
        Top = 1
        Width = 1010
        Height = 38
        Caption = 'crdOptions'
        CardIndex = 2
        TabOrder = 2
        object tlbOptions: TToolBar
          Left = 0
          Top = 0
          Width = 1010
          Height = 38
          AutoSize = True
          ButtonHeight = 38
          ButtonWidth = 130
          Caption = 'tlbLetterTop'
          Color = clBtnHighlight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe Fluent Icons'
          Font.Style = []
          Images = imlToolbar32
          List = True
          ParentColor = False
          ParentFont = False
          ShowCaptions = True
          AllowTextButtons = True
          TabOrder = 0
          Transparent = True
          object tbnHighImportance: TToolButton
            Left = 0
            Top = 0
            Hint = 'High Importance'
            Caption = ' '#59593' '
            Style = tbsTextButton
            OnClick = tbnBoldClick
          end
          object tbnLowImportance: TToolButton
            Left = 42
            Top = 0
            Hint = 'Low Importance'
            Caption = ' '#61614' '
            Style = tbsTextButton
            OnClick = tbnBoldClick
          end
          object bvlImportance: TBevel
            Left = 84
            Top = 0
            Width = 1
            Height = 38
            Shape = bsLeftLine
          end
          object tbnDividerLanguage: TToolButton
            Left = 85
            Top = 0
            Width = 8
            Caption = 'tbnDividerFont'
            ImageIndex = 0
            Style = tbsSeparator
          end
          object cmbLanguage: TComboBox
            Left = 93
            Top = 0
            Width = 165
            Height = 30
            Hint = 'Language'
            Style = csOwnerDrawVariable
            DropDownCount = 11
            ExtendedUI = True
            ItemHeight = 24
            TabOrder = 0
            StyleElements = [seFont, seBorder]
            OnChange = cmbFontChange
          end
          object tbnDividerSpelling: TToolButton
            Left = 258
            Top = 0
            Width = 8
            Caption = 'tbnDividerSpelling'
            ImageIndex = 0
            Style = tbsSeparator
          end
          object tbnSpelling: TToolButton
            Left = 266
            Top = 0
            Caption = ' '#63611' Spelling '
            Style = tbsTextButton
            OnClick = tbnBoldClick
          end
          object bvlLanguage: TBevel
            Left = 364
            Top = 0
            Width = 1
            Height = 38
            Shape = bsLeftLine
          end
          object tbnZoom: TToolButton
            Left = 365
            Top = 0
            Caption = ' '#57763' Zoom '
            Style = tbsTextButton
            OnClick = tbnBoldClick
          end
          object tbnSettings: TToolButton
            Left = 449
            Top = 0
            Caption = ' '#62292' Theme '
            Style = tbsTextButton
            OnClick = tbnSettingsClick
          end
        end
      end
    end
    object redLetter: TRichEdit
      AlignWithMargins = True
      Left = 0
      Top = 221
      Width = 1012
      Height = 301
      Margins.Left = 0
      Margins.Top = 12
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      BorderStyle = bsNone
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 2
      StyleElements = [seBorder]
    end
    object pnlFrom: TPanel
      Left = 0
      Top = 86
      Width = 1012
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      DesignSize = (
        1012
        41)
      object lblFrom: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 37
        Height = 34
        Align = alLeft
        Caption = 'From:'
        Layout = tlCenter
        ExplicitHeight = 20
      end
      object bvlFrom: TBevel
        Left = 0
        Top = 40
        Width = 1012
        Height = 1
        Align = alBottom
        Shape = bsBottomLine
        ExplicitTop = 39
        ExplicitWidth = 504
      end
      object spbNewWindow: TSpeedButton
        AlignWithMargins = True
        Left = 975
        Top = 3
        Width = 34
        Height = 34
        Hint = 'Open message in new window'
        Align = alRight
        Caption = #58036
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Segoe Fluent Icons'
        Font.Style = []
        ParentFont = False
        OnClick = tbnBoldClick
        ExplicitLeft = 478
      end
      object edtFrom: TEdit
        AlignWithMargins = True
        Left = 46
        Top = 10
        Width = 919
        Height = 30
        Anchors = [akLeft, akTop, akRight]
        BorderStyle = bsNone
        ParentColor = True
        ReadOnly = True
        TabOrder = 0
        Text = 'User.A@domain.com'
        StyleElements = [seBorder]
      end
    end
    object pnlTo: TPanel
      Left = 0
      Top = 127
      Width = 1012
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 4
      object lblTo: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 19
        Height = 34
        Align = alLeft
        Caption = 'To:'
        Layout = tlCenter
        ExplicitHeight = 20
      end
      object bvlTo: TBevel
        Left = 0
        Top = 40
        Width = 1012
        Height = 1
        Align = alBottom
        Shape = bsBottomLine
        ExplicitTop = 39
        ExplicitWidth = 504
      end
      object spbContact: TSpeedButton
        AlignWithMargins = True
        Left = 884
        Top = 3
        Width = 34
        Height = 34
        Hint = 'Choose contacts'
        Align = alRight
        Caption = #57661
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Segoe Fluent Icons'
        Font.Style = []
        ParentFont = False
        OnClick = tbnBoldClick
        ExplicitLeft = 478
      end
      object spbCopies: TSpeedButton
        AlignWithMargins = True
        Left = 924
        Top = 3
        Width = 85
        Height = 34
        Align = alRight
        Caption = 'Cc && Bcc'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 416
      end
      object edtTo: TEdit
        AlignWithMargins = True
        Left = 28
        Top = 10
        Width = 342
        Height = 30
        BorderStyle = bsNone
        ParentColor = True
        TabOrder = 0
        Text = 'User.B@domain.com'
        StyleElements = [seBorder]
      end
    end
    object pnlSubject: TPanel
      Left = 0
      Top = 168
      Width = 1012
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 5
      object bvlSubject: TBevel
        Left = 0
        Top = 40
        Width = 1012
        Height = 1
        Align = alBottom
        Shape = bsBottomLine
        ExplicitTop = 39
        ExplicitWidth = 504
      end
      object edtSubject: TEdit
        AlignWithMargins = True
        Left = 4
        Top = 10
        Width = 493
        Height = 30
        BorderStyle = bsNone
        ParentColor = True
        TabOrder = 0
        Text = 'RE: RichEdit'
        StyleElements = [seBorder]
      end
    end
  end
  object spvSettings: TSplitView
    Left = 1084
    Top = 0
    Width = 0
    Height = 561
    BevelInner = bvRaised
    DisplayMode = svmOverlay
    Opened = False
    OpenedWidth = 200
    ParentDoubleBuffered = True
    Placement = svpRight
    TabOrder = 1
    object rgrTheme: TRadioGroup
      Left = 1
      Top = 1
      Width = 198
      Height = 105
      Align = alTop
      Caption = ' Theme'
      DefaultHeaderFont = False
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -23
      HeaderFont.Name = 'Segoe UI'
      HeaderFont.Style = []
      ItemIndex = 2
      Items.Strings = (
        'Light mode'
        'Dark mode'
        'Use my Windows mode')
      ShowFrame = False
      TabOrder = 0
      OnClick = rgrThemeClick
    end
  end
  object imlToolBar40: TImageList
    Height = 40
    Width = 40
    Left = 740
    Top = 264
  end
  object imlToolbar32: TImageList
    Height = 32
    Width = 32
    Left = 820
    Top = 264
  end
  object pumAlign: TPopupMenu
    AutoHotkeys = maManual
    Images = imlToolbar32
    OwnerDraw = True
    Left = 892
    Top = 264
    object mniLeft: TMenuItem
      Caption = #59620' Left '
      OnAdvancedDrawItem = mniRightAdvancedDrawItem
    end
    object mniCenter: TMenuItem
      Caption = #59619' Center '
      OnAdvancedDrawItem = mniRightAdvancedDrawItem
    end
    object mniRight: TMenuItem
      Caption = #59618' Right '
      OnAdvancedDrawItem = mniRightAdvancedDrawItem
    end
  end
end
