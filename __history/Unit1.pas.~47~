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
  FMX.TMSFNCCustomWEBComponent, FMX.TMSFNCWXSpeechToText, FMX.Edit, StrUtils;

type
  TForm1 = class(TForm)
    TMSFNCCloudTranslation1: TTMSFNCCloudTranslation;
    btnGetLanguages: TButton;
    lbxLanguages: TListBox;
    lblSelectedLanguage: TLabel;
    btnTranslate: TButton;
    memoSentences: TMemo;
    memoTranslatedSentences: TMemo;
    lblDetectedLanguage: TLabel;
    TMSFNCWXSpeechSynthesis1: TTMSFNCWXSpeechSynthesis;
    btnSpeak: TButton;
    btnConfigure: TButton;
    TMSFNCWXSpeechToText1: TTMSFNCWXSpeechToText;
    btnPause: TButton;
    btnResume: TButton;
    btnCancel: TButton;
    lblSpeech: TLabel;
    btnClear: TButton;
    procedure btnTranslateClick(Sender: TObject);
    procedure btnGetLanguagesClick(Sender: TObject);
    procedure TMSFNCCloudTranslation1GetSupportedLanguages(Sender: TObject;
      const ALanguages: TStringList;
      const ARequestResult: TTMSFNCCloudBaseRequestResult);
    procedure lbxLanguagesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSpeakClick(Sender: TObject);
    procedure btnConfigureClick(Sender: TObject);
    procedure Init(Sender:TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnResumeClick(Sender: TObject);
    procedure btnPauseClick(Sender: TObject);
    procedure TMSFNCWXSpeechSynthesis1End(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure Clear(Sender: TObject);
    procedure Translate(Sender: TObject);
    procedure Speak(Sender: TObject);
    procedure Pause(Sender: TObject);
    procedure Resume(Sender: TObject);
    procedure Cancel(Sender: TObject);
    procedure ShowLanguages(Sender: TObject);
    procedure TMSFNCWXSpeechToText1ResultNoMatch(Sender: TObject;
      Phrases: TStrings);
    procedure TMSFNCWXSpeechToText1ResultMatch(Sender: TObject;
      userSaid: string; Parameters: TStrings;
      Command: TTMSFNCWXSpeechToTextCommand; Phrases: TStrings);
    procedure PauseSpeechToText;
    procedure ResumeSpeechToText;
    procedure GetLanguagesSpeechToText;
    procedure SpeakSpeechToText;
    procedure CancelSpeechToText;
    procedure ClearSpeechToText;
    procedure TranslateSpeechToText;
  private
    { Private declarations }
    FTranslationLanguage: String;
    procedure DoTranslateMemo(const ARequest: TTMSFNCCloudTranslationRequest; const ARequestResult: TTMSFNCCloudBaseRequestResult);
    procedure DoDetectEdit(const ARequest: TTMSFNCCloudTranslationRequest; const ARequestResult: TTMSFNCCloudBaseRequestResult);
  public
    { Public declarations }
  end;

ShowDebug = class(TTMSFNCWXSpeechSynthesis);

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.FormCreate(Sender: TObject);
begin
  ShowDebug(TMSFNCWXSpeechSynthesis1).ShowDebugConsole;
  FTranslationLanguage := 'en';
  TMSFNCWXSpeechSynthesis1.Voice := '"Microsoft Sean - English (Ireland)"';
  TMSFNCWXSpeechToText1.OnInitialized := Init;
  TTMSFNCUtils.Log('Initialized');
end;

procedure TForm1.Init(Sender: TObject);
begin
 TMSFNCWXSpeechToText1.Start;
 TTMSFNCUtils.Log('started SpeechToText');
end;

procedure TFOrm1.GetLanguagesSpeechToText;
begin
  lblSelectedLanguage.Text := 'Selected Language: English';
  TMSFNCCloudTranslation1.GetSupportedLanguages;
end;

procedure TForm1.btnGetLanguagesClick(Sender: TObject);
begin
  GetLanguagesSpeechToText;
end;

procedure TForm1.ShowLanguages(Sender: TObject);
begin
  GetLanguagesSpeechToText;
end;

procedure TFOrm1.PauseSpeechToText;
begin
  TMSFNCWXSpeechSynthesis1.Pause;
  lblSpeech.Text := 'Paused';
end;

procedure TForm1.btnPauseClick(Sender: TObject);
begin
  TMSFNCWXSpeechSynthesis1.Pause;
  lblSpeech.Text := 'Paused';
end;

procedure TForm1.Pause(Sender: TObject);
begin
  PauseSpeechToText;
end;

procedure TFOrm1.ResumeSpeechToText;
begin
  TMSFNCWXSpeechSynthesis1.Resume;

  if (TMSFNCWXSpeechSynthesis1.IsSpeaking) then
    lblSpeech.Text :='Speaking...'
  else
    lblSpeech.Text := 'There''s nothing to resume';
end;

procedure TForm1.btnResumeClick(Sender: TObject);
begin
  TMSFNCWXSpeechSynthesis1.Resume;

  if (TMSFNCWXSpeechSynthesis1.IsSpeaking) then
    lblSpeech.Text :='Speaking...'
  else
    lblSpeech.Text := 'There''s nothing to resume';
end;

procedure TForm1.Resume(Sender: TObject);
begin
  ResumeSpeechToText;
end;

procedure TFOrm1.SpeakSpeechToText;
begin
  TMSFNCWXSpeechToText1.Abort;

  if FTranslationLanguage = 'nl' then
    begin
      TMSFNCWXSpeechSynthesis1.Voice := '"Microsoft Bart - Dutch (Belgium)"';
    end
  else if FTranslationLanguage = 'en' then
    begin
      TMSFNCWXSpeechSynthesis1.Voice := '"Microsoft Sean - English (Ireland)"';
    end
  else if FTranslationLanguage = 'de' then
    begin
      TMSFNCWXSpeechSynthesis1.Voice := '"Microsoft Stefan - German (Germany)"';
    end
  else if FTranslationLanguage = 'ru' then
    begin
      TMSFNCWXSpeechSynthesis1.Voice := '"Microsoft Pavel - Russian (Russia)"';
    end
  else if FTranslationLanguage = 'ja' then
    begin
      TMSFNCWXSpeechSynthesis1.Voice := '"Microsoft Ayumi - Japanese (Japan)"';
    end
  else if FTranslationLanguage = 'ro' then
    begin
      TMSFNCWXSpeechSynthesis1.Voice := '"Microsoft Andrei - Romanian (Romania)"';
    end;

  TMSFNCWXSpeechSynthesis1.Speak(memoTranslatedSentences.Lines.Text);

  if (TMSFNCWXSpeechSynthesis1.IsSpeaking) then
    lblSpeech.Text :='Please cancel and restart first'
  else
    lblSpeech.Text := 'Speaking...';
end;

procedure TForm1.btnSpeakClick(Sender: TObject);
begin
  TMSFNCWXSpeechToText1.Abort;

  if FTranslationLanguage = 'nl' then
    begin
      TMSFNCWXSpeechSynthesis1.Voice := '"Microsoft Bart - Dutch (Belgium)"';
    end
  else if FTranslationLanguage = 'en' then
    begin
      TMSFNCWXSpeechSynthesis1.Voice := '"Microsoft Sean - English (Ireland)"';
    end
  else if FTranslationLanguage = 'de' then
    begin
      TMSFNCWXSpeechSynthesis1.Voice := '"Microsoft Stefan - German (Germany)"';
    end
  else if FTranslationLanguage = 'ru' then
    begin
      TMSFNCWXSpeechSynthesis1.Voice := '"Microsoft Pavel - Russian (Russia)"';
    end
  else if FTranslationLanguage = 'ja' then
    begin
      TMSFNCWXSpeechSynthesis1.Voice := '"Microsoft Ayumi - Japanese (Japan)"';
    end
  else if FTranslationLanguage = 'ro' then
    begin
      TMSFNCWXSpeechSynthesis1.Voice := '"Microsoft Andrei - Romanian (Romania)"';
    end;

  TMSFNCWXSpeechSynthesis1.Speak(memoTranslatedSentences.Lines.Text);

  if (TMSFNCWXSpeechSynthesis1.IsSpeaking) then
    lblSpeech.Text :='Please cancel and restart first'
  else
    lblSpeech.Text := 'Speaking...';
end;

procedure TForm1.Speak(Sender: TObject);
begin
  SpeakSpeechToText;
end;

procedure TForm1.CancelSpeechToText;
begin
  TMSFNCWXSpeechSynthesis1.Cancel;
end;

procedure TForm1.btnCancelClick(Sender: TObject);
begin
  CancelSpeechToText;
end;

procedure TForm1.Cancel(Sender: TObject);
begin
  CancelSpeechToText;
end;

procedure TForm1.ClearSpeechToText;
begin
  memoSentences.Lines.Clear;
end;

procedure TForm1.btnClearClick(Sender: TObject);
begin
  ClearSpeechToText;
end;

procedure TForm1.Clear(Sender: TObject);
begin
  ClearSpeechToText;
end;

procedure TForm1.btnConfigureClick(Sender: TObject);
begin
  TMSFNCWXSpeechSynthesis1.ConfigureVoices;
end;

procedure TForm1.TranslateSpeechToText;
var
  sl: TStringList;
begin
  memoTranslatedSentences.Lines.Clear;
  sl := TStringList.Create;
  try
    if lbxLanguages.Count = 0 then
      begin
        lblSelectedLanguage.Text := 'Load languages first';
      end
    else
    sl.Assign(memoSentences.Lines);
    TMSFNCCloudTranslation1.Translate(sl, FTranslationLanguage, DoTranslateMemo);
    TMSFNCCloudTranslation1.Detect(memoSentences.Text, DoDetectEdit);
  finally
    sl.Free;
  end;
end;

procedure TForm1.btnTranslateClick(Sender: TObject);
begin
  TranslateSpeechToText;
end;

procedure TForm1.Translate(Sender: TObject);
begin
  TranslateSpeechToText;
end;

procedure TForm1.lbxLanguagesClick(Sender: TObject);
begin
  if (lbxLanguages.ItemIndex >= 0) and (lbxLanguages.ItemIndex <= lbxLanguages.Items.Count - 1) then
  begin
    lblSelectedLanguage.Text := 'Selected Language: ' + lbxLanguages.Items.Names[lbxLanguages.ItemIndex];
    FTranslationLanguage := lbxLanguages.Items.Values[lbxLanguages.Items.Names[lbxLanguages.ItemIndex]];
  end;
end;

procedure TForm1.TMSFNCCloudTranslation1GetSupportedLanguages(Sender: TObject; const ALanguages: TStringList; const ARequestResult: TTMSFNCCloudBaseRequestResult);
begin
  lbxLanguages.Items.Assign(ALanguages);
end;

procedure TForm1.TMSFNCWXSpeechSynthesis1End(Sender: TObject);
begin
  if (TMSFNCWXSpeechSynthesis1.IsSpeaking) then
    lblSpeech.Text :='Speaking...'
  else
    lblSpeech.Text := 'Ended';
    TMSFNCWXSpeechToText1.Start;
end;

procedure TForm1.TMSFNCWXSpeechToText1ResultMatch(Sender: TObject;
  userSaid: string; Parameters: TStrings; Command: TTMSFNCWXSpeechToTextCommand;
  Phrases: TStrings);
var
  I: Integer;
  P: String;
begin
   if Command.ID = 'Select' then
   begin
     if Parameters.Count > 0 then
     P := Trim(Parameters[0]);
     begin
     if lbxLanguages.Count = 0 then
     begin
       lblSelectedLanguage.Text := 'Show languages first';
     end
     else if (lbxLanguages.Items.IndexOfName(P) > -1) then
       begin
         lblSelectedLanguage.Text := 'Selected Language: ' + P;
         FTranslationLanguage := lbxLanguages.Items.Values[P];
       end
       else
       begin
         lblSelectedLanguage.Text := 'Language is not available';
       end;
     end;
   end;
end;

procedure TForm1.TMSFNCWXSpeechToText1ResultNoMatch(Sender: TObject;
  Phrases: TStrings);
begin
    memoSentences.Lines.AddStrings(Phrases);
end;

procedure TForm1.DoDetectEdit(const ARequest: TTMSFNCCloudTranslationRequest; const ARequestResult: TTMSFNCCloudBaseRequestResult);
begin
  if ARequest.Detections.Count > 0 then
    lblDetectedLanguage.Text := 'Detected Language: ' + ARequest.Detections[0].SourceLanguage;
end;

procedure TForm1.DoTranslateMemo(const ARequest: TTMSFNCCloudTranslationRequest;const ARequestResult: TTMSFNCCloudBaseRequestResult);
var
  I: Integer;
  s : string;
begin
  for I := 0 to ARequest.Translations.Count - 1 do
    memoTranslatedSentences.Lines.Add(ARequest.Translations[I].TranslatedText);
end;

end.





