unit frmMain;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms, Vcl.Graphics, Vcl.Menus, System.ImageList, Vcl.ImgList, Vcl.Controls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.WinXCtrls, Vcl.Buttons, Vcl.ComCtrls, Vcl.WinXPanels, Vcl.ToolWin, Vcl.Tabs;

type
  TMainForm = class(TForm)
    pnlLetter: TPanel;
    pnlLetterTop: TPanel;
    tstLetterTop: TTabSet;
    tlbLetterTop: TToolBar;
    imlToolBar40: TImageList;
    tbnDiscard: TToolButton;
    tbnSend: TToolButton;
    spvSettings: TSplitView;
    rgrTheme: TRadioGroup;
    cplLetter: TCardPanel;
    crdFormat: TCard;
    crdInsert: TCard;
    crdOptions: TCard;
    imlToolbar32: TImageList;
    tlbInsert: TToolBar;
    tbnFiles: TToolButton;
    tbnTable: TToolButton;
    tbnPictures: TToolButton;
    tbnLink: TToolButton;
    tbnEmoji: TToolButton;
    tlbFormat: TToolBar;
    tbnBold: TToolButton;
    tbnItalic: TToolButton;
    tbnUnderline: TToolButton;
    tbnHighlight: TToolButton;
    tbnFontColor: TToolButton;
    cmbFont: TComboBox;
    cmbSize: TComboBox;
    tbnDividerBegin: TToolButton;
    tbnDividerFont: TToolButton;
    tbnDividerSize: TToolButton;
    tbnBullets: TToolButton;
    tbnAlign: TToolButton;
    pumAlign: TPopupMenu;
    mniLeft: TMenuItem;
    mniCenter: TMenuItem;
    mniRight: TMenuItem;
    tlbOptions: TToolBar;
    cmbLanguage: TComboBox;
    tbnDividerLanguage: TToolButton;
    tbnHighImportance: TToolButton;
    tbnLowImportance: TToolButton;
    tbnSpelling: TToolButton;
    tbnZoom: TToolButton;
    redLetter: TRichEdit;
    bvlFont: TBevel;
    bvlImportance: TBevel;
    bvlLanguage: TBevel;
    tbnDividerSpelling: TToolButton;
    pnlFrom: TPanel;
    lblFrom: TLabel;
    bvlFrom: TBevel;
    edtFrom: TEdit;
    spbNewWindow: TSpeedButton;
    pnlTo: TPanel;
    lblTo: TLabel;
    bvlTo: TBevel;
    spbContact: TSpeedButton;
    edtTo: TEdit;
    spbCopies: TSpeedButton;
    pnlSubject: TPanel;
    bvlSubject: TBevel;
    edtSubject: TEdit;
    tbnSettings: TToolButton;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer; var Resize: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure rgrThemeClick(Sender: TObject);
    procedure cmbFontChange(Sender: TObject);
    procedure tbnAlignClick(Sender: TObject);
    procedure mniRightAdvancedDrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect; State: TOwnerDrawState);
    procedure tstLetterTopChange(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
    procedure tbnSettingsClick(Sender: TObject);
    procedure tbnBoldClick(Sender: TObject);
  private
    procedure SetStyle(IsDark: Boolean);
  end;

var
  MainForm: TMainForm;

implementation

uses
  System.SysUtils, System.Types,
  Vcl.Themes,
  frmFont, untTheme;

{$R *.dfm}

procedure TMainForm.SetStyle(IsDark: Boolean);
begin
  SetTheme(IsDark);

  if IsDark then
    Application.Icon.Handle := LoadIcon(HInstance, 'LightIcon')
  else
    Application.Icon.Handle := LoadIcon(HInstance, 'DarkIcon');

  for var i: Integer := 0 to ComponentCount - 1 do
    if Components[i] is TEdit then
    begin
      TEdit(Components[i]).Color := TStyleManager.ActiveStyle.GetStyleColor(scPanel);
      TEdit(Components[i]).Font.Color := TStyleManager.ActiveStyle.GetStyleFontColor(sfCaptionTextNormal);
    end
    else if Components[i] is TComboBox then
      TComboBox(Components[i]).Color := TStyleManager.ActiveStyle.GetStyleColor(scButtonNormal);

  redLetter.Color := TStyleManager.ActiveStyle.GetSystemColor(clBtnFace);
  redLetter.DefAttributes.Color := TStyleManager.ActiveStyle.GetSystemColor(clWindowText);
end;

procedure TMainForm.cmbFontChange(Sender: TObject);
begin
  cmbFont.Hint := cmbFont.Text;
end;

procedure TMainForm.FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer; var Resize: Boolean);
begin
  Resize := (NewWidth >= 500) and (NewHeight >= 400);
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  for i := 8 to 12 do
    cmbSize.Items.Add(i.ToString);
  for i := 14 to 28 do
    if not Odd(i) then
      cmbSize.Items.Add(i.ToString);
  for i := 0 to 3 do
    cmbSize.Items.Add(Integer(36 + 12 * i).ToString);
  cmbSize.ItemIndex := cmbSize.Items.IndexOf('11');

  cmbFont.Items := Screen.Fonts;
  cmbFont.DropDownWidth := tbnBold.Left + tbnBold.Width;
  cmbFont.ItemIndex := cmbFont.Items.IndexOf('Times New Roman');
  cmbFontChange(cmbFont);

  for i := 0 to Languages.Count - 1 do
    cmbLanguage.Items.Add(Languages.Name[i]);
  cmbLanguage.Sorted := True;
  cmbLanguage.DropDownWidth := tbnSpelling.Left + tbnSpelling.Width;
  cmbLanguage.ItemIndex := cmbLanguage.Items.IndexOf(Languages.NameFromLocaleID[Languages.UserDefaultLocale]);

  var rs: TResourceStream := nil;
  try
    rs := TResourceStream.Create(HInstance, 'SAMPLE', PChar('RTF'));
    redLetter.Lines.LoadFromStream(rs);
  finally
    if rs <> nil then
      rs.Free;
  end;

  rgrThemeClick(rgrTheme);
end;

procedure TMainForm.mniRightAdvancedDrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect; State: TOwnerDrawState);
begin

  if odSelected in State then
    ACanvas.Brush.Color := TStyleManager.ActiveStyle.GetSystemColor(clMenuHighlight)
  else
    ACanvas.Brush.Color := TStyleManager.ActiveStyle.GetSystemColor(clMenu);
  ACanvas.Font := tlbFormat.Font;
  ACanvas.Font.Color := TStyleManager.ActiveStyle.GetSystemColor(clMenuText);
  ACanvas.FillRect(ARect);
  ACanvas.TextOut(ARect.Left + 4, ARect.Top + 4, TMenuItem(Sender).Caption);
end;

procedure TMainForm.rgrThemeClick(Sender: TObject);
begin
  if rgrTheme.ItemIndex = 0 then
    SetStyle(false)
  else if rgrTheme.ItemIndex = 1 then
    SetStyle(True)
  else
    SetStyle(IsDarkColor);
end;

procedure TMainForm.tbnAlignClick(Sender: TObject);
var
  p: TPoint;
begin
  p := tlbFormat.ClientToScreen(Point(tbnAlign.Left, tbnAlign.Top + tbnAlign.Height));
  pumAlign.Popup(p.X, p.Y);
end;

procedure TMainForm.tbnBoldClick(Sender: TObject);
begin
  var c : Char := GetSymbol;
  if c <> #0 then
  begin
    if Sender is TToolButton then
      TToolButton(Sender).Caption := String(TToolButton(Sender).Caption).Remove(1, 1).Insert(1, c)
    else
      TSpeedButton(Sender).Caption := c;
  end;
end;

procedure TMainForm.tbnSettingsClick(Sender: TObject);
begin
  if spvSettings.Opened then
    spvSettings.Close
  else
    spvSettings.Open;
end;

procedure TMainForm.tstLetterTopChange(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
begin
  cplLetter.ActiveCard := cplLetter.Cards[NewTab];
  AllowChange := True;
end;

end.
