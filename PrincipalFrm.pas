unit PrincipalFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, dbiprocs, ShellApi,StdCtrls, ComCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Affiche: TRichEdit;
    Button1: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
const
   Bases: array [1..24] of integer=(
     0,$2100,$2200,$2300,$2400,$2500,$2600,$2700,$2800,
     $2900,$2A00,$2B00,$2C00,$2D00,$2E00,$2F00,$3000,
     $3100,$3200,$3300,$3400,$3500,$3E00,$3F00);
var
 i,n,ErrorCod: integer;
 ErrorTexto: array [0..DBIMAXMSGLEN+1] of char;
begin
 Affiche.Clear;
 for i:=1 to 24 do
  for n:=0 to 255 do
   begin
    ErrorCod:=Bases[i]+n;
    DbiGetErrorString(ErrorCod,ErrorTexto);
    if ErrorTexto<>''
    then Affiche.Lines.Add('$'+IntToHex(ErrorCod,4)+' ('+IntToStr(ErrorCod)+') = '+ErrorTexto);
    Application.ProcessMessages;
   end;
end;

procedure TForm1.Label2Click(Sender: TObject);
begin
 ShellexEcute(0,'open',PChar('http://membres.lycos.fr/delphics/'),'','', SW_SHOW);
end;

end.
