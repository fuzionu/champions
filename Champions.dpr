program Champions;

uses
  Forms,
  ChampionUnit in 'ChampionUnit.pas' {ChampionForm},
  ChampionsLogic in 'ChampionsLogic.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TChampionForm, ChampionForm);
  Application.Run;
end.
