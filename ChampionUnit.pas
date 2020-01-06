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
    procedure FormCreate(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure InputFieldClick(Sender: TObject);
    procedure SearchButtonClick(Sender: TObject);
  private
    function ShowChampion(Champion : TChampion) : String;
  public

  end;

var
  ChampionForm: TChampionForm;

implementation

{$R *.dfm}

function TChampionForm.ShowChampion(Champion : TChampion) : String;
begin
  ChampionStats.Caption :=
              'Name: ' + Champion.Name + sLineBreak +
              'Role: ' + Champion.Role + sLineBreak +
              'Health: ' + IntToStr(Champion.Health) + sLineBreak +
              'Health regen: ' + IntToStr(Champion.HealthRegen) + '/s' + sLineBreak +
              'Ability power: ' + IntToStr(Champion.AbilityPower) + sLineBreak +
              'Resource type: ' + Champion.ResourceType + sLineBreak +
              'Resource regen: ' + IntToStr(Champion.ResourceRegen) + '/s' + sLineBreak +
              'Attack type: ' + Champion.AttackType + sLineBreak +
              'Attack damage: ' + IntToStr(Champion.AttackDamage) + sLineBreak +
              'Attack speed: ' + FloatToStr(Champion.AttackSpeed) + sLineBreak +
              'Attack range: ' + IntToStr(Champion.AttackRange) + sLineBreak +
              'Armor: ' + IntToStr(Champion.Armor) + sLineBreak +
              'Magic resist: ' + IntToStr(Champion.MagicResist) + sLineBreak +
              'Movement speed: ' + IntToStr(Champion.MovementSpeed);
end;

procedure TChampionForm.FormCreate(Sender: TObject);
begin
  LolLogo.Picture.LoadFromFile('images\leagueoflegends.bmp');
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
  ShowChampion(GetChampion(InputField.Text));
  
end;

end.

