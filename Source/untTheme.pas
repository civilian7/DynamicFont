unit untTheme;

interface

uses
  Winapi.Windows,

  System.SysUtils,
  System.Win.Registry,

  Vcl.Graphics,
  Vcl.Themes,
  Vcl.Styles;

  function IsDarkColor: Boolean;
  procedure SetTheme(IsDark: Boolean);

implementation

{$R '.\Assets\theme.res'}

function GetSystemColor: Integer;
var
  r, g, b: Byte;
  ARGB: DWORD;
  Reg: TRegistry;
const
  Key = '\Software\Microsoft\Windows\DWM';
  Color = 'ColorizationColor';
begin
  Result := clActiveCaption;
  Reg := TRegistry.Create(HKEY_CURRENT_USER);
  try
    with Reg do
      if OpenKey(Key, False) then
        if ValueExists(Color) then
        begin
          ARGB := Cardinal(ReadInteger(Color));
          b := Byte(ARGB);
          g := Byte(ARGB shr 8);
          r := Byte(ARGB shr 16);
          Result := RGB(r, g, b);
        end;
  finally
    Reg.Free;
  end;
end;

function IsDarkColor: Boolean;
begin
  var LColor := ColorToRGB(GetSystemColor);
  Result := Round((GetRValue(LColor) + GetGValue(LColor) + GetBValue(LColor)) / 3) < 128;
end;

procedure SetTheme(IsDark: Boolean);
var
  StyleName: Byte;
begin
  if IsDark and (Length(TStyleManager.StyleNames) > 2) then
  begin
    if Pos('dark', TStyleManager.StyleNames[1].ToLower) > 0 then
      StyleName := 1
    else
      StyleName := 2;
  end
  else
  begin
    if Pos('light', TStyleManager.StyleNames[1].ToLower) > 0 then
      StyleName := 1
    else
      StyleName := 2;
  end;

  TStyleManager.TrySetStyle(TStyleManager.StyleNames[StyleName]);
end;

end.
