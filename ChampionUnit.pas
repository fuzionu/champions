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
  private

  public

  end;

var
  ChampionForm: TChampionForm;

implementation

{$R *.dfm}

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

end.

