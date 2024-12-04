unit frmFont;

interface

{$REGION 'USES'}
uses
  Winapi.Windows,
  Winapi.Messages,

  System.SysUtils,
  System.Classes,
  System.Win.Registry,
  System.Rtti,
  System.Bindings.Outputs,

  Data.DB,
  Data.Bind.EngExt,
  Data.Bind.Components,
  Data.Bind.Grid,
  Data.Bind.DBScope,

  Vcl.Forms,
  Vcl.Controls,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Graphics,
  Vcl.ClipBrd,
  Vcl.WinXCtrls,
  Vcl.ControlList,
  Vcl.Bind.DBEngExt,
  Vcl.Bind.ControlList,
  Vcl.Bind.Editors,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;
{$ENDREGION}

type
  TFontForm = class(TForm)
    pnlSearch: TPanel;
    lblUntitled: TLabel;
    lblFound: TLabel;
    cbxFont: TComboBox;
    mtFont: TFDMemTable;
    clSymbols: TControlList;
    lblSymbol: TLabel;
    lblCode: TLabel;
    lblName: TLabel;
    bsFont: TBindSourceDB;
    blFont: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    LinkPropertyToFieldCaption2: TLinkPropertyToField;
    LinkPropertyToFieldCaption3: TLinkPropertyToField;
    edtSearch: TEdit;
    Panel1: TPanel;
    btnCancel: TButton;
    btnOk: TButton;
    btnClear: TButton;
    eSymbols: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure CreateParams(Var params: TCreateParams); override;
    procedure cbxFontChange(Sender: TObject);
    procedure clSymbolsItemDblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnClearClick(Sender: TObject);
  strict private
    const
      FIDFont = 'IDFont';
      FName = 'Name';
    class var
      FFonts: array of Cardinal;
      FFontNames: array of String;

    class constructor Create;
    class destructor Destroy;

    class procedure LoadFonts; static;
    class procedure UnloadFonts; static;
  private
    FSymbol: Char;
    MinWidth: Integer;
    MinHeight: Integer;

    procedure FillFont(const FontIndex: Byte);
    procedure RefreshCount;
  end;

  function GetSymbol(IsStandaloneApp : Boolean = False; IsCopyToClipboard : Boolean = False): Char;

var
  FontForm: TFontForm;

implementation

{$R *.dfm}
{$R '.\Assets\font.res'}

uses
  untTheme;

{$REGION 'Supports'}

function GetSymbol(IsStandaloneApp : Boolean = False; IsCopyToClipboard : Boolean = False): Char;
begin
  FontForm := TFontForm.Create(Application);

  with FontForm do
  begin
    if IsStandaloneApp then
      SetTheme(IsDarkColor);

    if ShowModal = mrOk then
    begin
      Result := FSymbol;
      if IsCopyToClipboard then
        Clipboard.AsText := FSymbol;
    end
    else
      Result := Chr(0);
  end;
end;

function LoadResourceFont(const ResourceName, FontName: string): Cardinal;
var
  LFontsCount: Integer;
begin
  var LStream := tResourceStream.Create(hInstance, ResourceName, RT_RCDATA);
  try
    Result := AddFontMemResourceEx(LStream.Memory, LStream.Size, nil, @LFontsCount);
  finally
    LStream.Free();
  end;
end;

function LoadResString(ID: Integer): String;
var
  LBuffer: array[0..255] of Char;
begin
  Loadstring(hInstance, ID, @LBuffer, 255);
  Result := StrPas(LBuffer);
end;

{$ENDREGION}

class constructor TFontForm.Create;
begin
  LoadFonts;
end;

class destructor TFontForm.Destroy;
begin
  UnloadFonts;
end;

procedure TFontForm.FormCreate(Sender: TObject);
begin
  SendMessage(GetWindow(cbxFont.Handle, GW_CHILD), EM_SETREADONLY, 1, 0);

  for var I := Low(FFontNames) to High(FFontNames) do
  begin
    FillFont(I);
    cbxFont.Items.Add(FFontNames[I]);
  end;
  cbxFont.ItemIndex := High(FFontNames);
  cbxFontChange(cbxFont);
end;

procedure TFontForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
  #13:
    begin
      Key := #0;
      clSymbolsItemDblClick(clSymbols);
    end;
  #27:
    begin
      Key := #0;
      ModalResult := mrCancel;
    end;
  end;
end;

procedure TFontForm.CreateParams(var params: TCreateParams);
begin
  inherited;

  params.ExStyle := params.ExStyle or WS_EX_APPWINDOW;
  params.WndParent := 0;
end;

procedure TFontForm.btnClearClick(Sender: TObject);
begin
  eSymbols.Text := '';
end;

procedure TFontForm.cbxFontChange(Sender: TObject);
begin
  eSymbols.Text := '';
  eSymbols.Font.Name := cbxFont.Text;

  mtFont.Filter := FIDFont + '=' + cbxFont.ItemIndex.ToString;
  if Trim(edtSearch.Text) <> '' then
    mtFont.Filter := mtFont.Filter + ' AND ' + FName + ' LIKE ' + AnsiQuotedStr('%' + edtSearch.Text  + '%', '''');
  mtFont.Filtered := True;
  lblSymbol.Font.Name := cbxFont.Text;
  RefreshCount;
end;

procedure TFontForm.clSymbolsItemDblClick(Sender: TObject);
begin
  if clSymbols.SelectedCount > 0 then
  begin
    eSymbols.Text := eSymbols.Text +  mtFont.Fields[2].AsString[1];
  end;
end;

class procedure TFontForm.LoadFonts;
const
  SplitChar = ';';
begin
  var s := LoadResString(0);
  if s <> '' then
    for var I := Low(s.Split([SplitChar])) to High(s.Split([SplitChar])) do
    begin
      SetLength(FFontNames, I + 1);
      FFontNames[I] := s.Split([SplitChar])[I];
    end;

  SetLength(FFonts, High(FFontNames) + 1);
  for var I := Low(FFonts) to High(FFonts) do
    FFonts[I] := LoadResourceFont(FFontNames[I].Replace(' ', ''), FFontNames[I]);
end;

class procedure TFontForm.UnloadFonts;
begin
  for var I := High(FFonts) downto Low(FFonts) do
    RemoveFontMemResourceEx(FFonts[I]);

  SetLength(FFonts, 0);
  SetLength(FFontNames, 0);
end;

procedure TFontForm.RefreshCount;
begin
  lblFound.Caption := mtFont.RecordCount.ToString;
end;

procedure TFontForm.FillFont(const FontIndex: Byte);
  function SplitWords(SymbolName: String): String;
  begin
    if SymbolName = '' then
      SymbolName := '*'
    else
      for var i : Integer := Length(SymbolName) downto 2 do
        if (Ord(SymbolName[i]) in [$61..$7A]) and      // a - z
          (Ord(SymbolName[i - 1]) in [$41..$5A]) then  // A - Z
          SymbolName.Insert(i - 2, ' ')
        else
        if ((Ord(SymbolName[i]) in [$30..$39]) and     // 0 - 9
          (Ord(SymbolName[i - 1]) in [$41..$7A])) or   // A - z
          ((Ord(SymbolName[i]) in [$41..$5A]) and      // A - Z
          (Ord(SymbolName[i - 1]) in [$61..$7A])) then // a - z
          SymbolName.Insert(i - 1, ' ');

    Result := Trim(SymbolName);
  end;
var
  buff: Word;
  c : Char;
begin
  Canvas.Font.Name := FFontNames[FontIndex];
  bsFont.DataSet := nil;
  mtFont.Open;
  for var I := $E000 to $F8FF do
  begin
    c := Char(I);
    if (GetGlyphIndicesW(Canvas.Handle, Addr(c), 1, @buff, GGI_MARK_NONEXISTING_GLYPHS) > 0) and (buff <> $FFFF) then
      mtFont.InsertRecord([FontIndex, I, Char(I), SplitWords(LoadResString(I))]);
  end;

  mtFont.IndexesActive := True;
  if mtFont.Indexes.Count > 1 then
    mtFont.Indexes[1].Selected := True;

  mtFont.First;
  bsFont.DataSet := mtFont;
end;

end.
