program DynamicFont;

uses
  Vcl.Forms,
  untTheme in 'untTheme.pas',
  frmFont in 'frmFont.pas' {FontForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  GetSymbol(True, True);
  Application.Run;
end.
