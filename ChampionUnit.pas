unit ChampionUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ChampionsLogic;

type
  TChampionForm = class(TForm)
    LolLogo: TImage;
    ChampionImage: TImage;
    InputField: TEdit;
    SearchButton: TButton;
    ClearButton: TButton;
    ExitButton: TButton;
    ChampionStats: TLabel;
    ChampNotFound: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure InputFieldClick(Sender: TObject);
    procedure SearchButtonClick(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
  private
    function ShowChampion(Champion : TChampion) : String;
    function CheckResourceType(Champion : TChampion) : String;
    function ShowInputDlg() : String;
    
    procedure SetChampionImage(ChampionName : String);
    procedure ClearChampionInfo();
    procedure ChampionNotFound();
  public

  end;

var
  ChampionForm: TChampionForm;

implementation

{$R *.dfm}

function TChampionForm.ShowInputDlg() : String;
var
  ChampName : String;
  DoContinue : boolean;
begin
  repeat
    DoContinue := InputQuery('Welcome...', 'Input champion''s name:', ChampName);

    if DoContinue then
    begin
      if DoesChampionExists(ChampName) then
      begin
        Result := ChampName;
        Break;
      end
      else
        MessageDlg('Champion not found. Try again!', mtInformation,[mbOk],0);
    end
    else
      Application.Terminate;
  until (DoContinue = False) or (DoContinue and DoesChampionExists(ChampName));
end;

function TChampionForm.CheckResourceType(Champion : TChampion) : String;
begin
  if Champion.ResourceType = 'Mana' then
    Result := 'Resource type: Mana' + sLineBreak +
              'Resource regen: ' + IntToStr(Champion.ResourceRegen) + ' / second'
  else if Champion.ResourceType = 'Energy' then
    Result := 'Resource type: Energy' + sLineBreak +
              'Resource regen: ' + IntToStr(Champion.ResourceRegen) + ' / second'
  else if Champion.ResourceType = 'Rage' then
    Result := 'Resource type: Rage' + sLineBreak +
              'Resource gain: ' + IntToStr(Champion.ResourceRegen) + ' / attack or damage'
  else if Champion.ResourceType = 'Ferocity' then
    Result := 'Resource type: Ferocity' + sLineBreak +
              'Resource gain: ' + IntToStr(Champion.ResourceRegen) + ' / ability'
  else if Champion.ResourceType = 'Courage' then
    Result := 'Resource type: Courage' + sLineBreak +
              'Resource gain: ' + IntToStr(Champion.ResourceRegen) + ' / attack'
  else if Champion.ResourceType = 'Health' then
    Result := 'Resource type: Health'
  else if Champion.ResourceType = 'None' then
    Result := 'Resource type: None';
end;

procedure TChampionForm.ChampionNotFound();
begin
  ChampionStats.Caption := '';
  ChampionImage.Picture := nil;
  ChampNotFound.Caption := 'Champion not found.';
end;

procedure TChampionForm.ClearChampionInfo();
begin
  InputField.Clear;
  ChampionImage.Picture := nil;
  ChampionStats.Caption := '';
  ChampNotFound.Caption := '';
end;

procedure TChampionForm.SetChampionImage(ChampionName : String);
var
  FixedChampionName : String;
begin
  FixedChampionName := StringReplace(ChampionName, ' ', '', [rfReplaceAll, rfIgnoreCase]);

  try
    ChampionImage.Picture.LoadFromFile('images\' + FixedChampionName + '.bmp');
  except
    on EFOpenError do
    begin
      ChampionImage.Picture := nil;
      ShowMessage('Champion''s image not found.');
    end;
  end;
end;

function TChampionForm.ShowChampion(Champion : TChampion) : String;
begin
  ChampionStats.Caption :=
              'Name: ' + Champion.Name + sLineBreak +
              'Role: ' + Champion.Role + sLineBreak +
              'Health: ' + IntToStr(Champion.Health) + sLineBreak +
              'Health regen: ' + IntToStr(Champion.HealthRegen) + ' / second' + sLineBreak +
              CheckResourceType(Champion) + sLineBreak +
              'Ability power: ' + IntToStr(Champion.AbilityPower) + sLineBreak +
              'Attack type: ' + Champion.AttackType + sLineBreak +
              'Attack damage: ' + IntToStr(Champion.AttackDamage) + sLineBreak +
              'Attack speed: ' + FloatToStr(Champion.AttackSpeed) + sLineBreak +
              'Attack range: ' + IntToStr(Champion.AttackRange) + sLineBreak +
              'Armor: ' + IntToStr(Champion.Armor) + sLineBreak +
              'Magic resist: ' + IntToStr(Champion.MagicResist) + sLineBreak +
              'Movement speed: ' + IntToStr(Champion.MovementSpeed);

  SetChampionImage(Champion.Name);
end;

procedure TChampionForm.FormCreate(Sender: TObject);
var
  UserInput : String;
begin
  UserInput := ShowInputDlg();

  if UserInput = '' then
    Application.Terminate
  else
  begin
    ShowChampion(GetChampion(UserInput));
    LolLogo.Picture.LoadFromFile('images\leagueoflegends.bmp');
  end;
end;

procedure TChampionForm.ExitButtonClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TChampionForm.InputFieldClick(Sender: TObject);
begin
  InputField.Clear;
end;

procedure TChampionForm.SearchButtonClick(Sender: TObject);
begin
    if DoesChampionExists(InputField.Text) then
    begin
      ShowChampion(GetChampion(InputField.Text));
      ChampNotFound.Caption := '';
    end
    else
      ChampionNotFound();
end;

procedure TChampionForm.ClearButtonClick(Sender: TObject);
begin
  ClearChampionInfo();
end;

end.

