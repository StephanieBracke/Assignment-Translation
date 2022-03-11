unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.TMSFNCCustomComponent, FMX.TMSFNCCloudBase, FMX.TMSFNCCloudTranslation,
  FMX.StdCtrls, FMX.ScrollBox, FMX.Memo, FMX.Layouts, FMX.ListBox,
  FMX.Controls.Presentation, FMX.TMSFNCTypes, FMX.TMSFNCUtils,
  FMX.TMSFNCGraphics, FMX.TMSFNCGraphicsTypes, FMX.TMSFNCWXSpeechSynthesis,
  FMX.TMSFNCCustomControl, FMX.TMSFNCWebBrowser, FMX.TMSFNCCustomWEBControl,
  FMX.TMSFNCCustomWEBComponent, FMX.TMSFNCWXSpeechToText;

type
  TForm1 = class(TForm)
    btnRetrieve: TButton;
    lbxSupportedLanguages: TListBox;
    memoToTranslate: TMemo;
    btnTranslate: TButton;
    lblSelectedLanguage: TLabel;
    TMSFNCCloudTranslation1: TTMSFNCCloudTranslation;
    memoTranslated: TMemo;
    lblTranslation: TLabel;
    TMSFNCWXSpeechToText1: TTMSFNCWXSpeechToText;
    TMSFNCWXSpeechSynthesis1: TTMSFNCWXSpeechSynthesis;
    btnStartMic: TButton;
    procedure btnStartMicClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.btnStartMicClick(Sender: TObject);
begin
  TMSFNCWXSpeechToText1.Start;
end;

end.
