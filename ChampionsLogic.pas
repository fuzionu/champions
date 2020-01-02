unit ChampionsLogic;

interface

uses
  SysUtils;

type
  TChampion = record
      Name : String;
      ChampClass : String;
      Health : Integer;
      HealthRegen : Integer;
      ResourceType : String;
      ResourceRegen : String;
      DamageStyle : String;
      DamageType : String;
      AttackType : String;
      AttackDamage : Integer;
      AttackSpeed : Extended;
      AttackRange : Integer;
      Armor : Integer;
      MagicResist : Integer;
      MovementSpeed : Integer;
  end;


var
  ChampionArray : Array[1..15] of TChampion;


implementation

end.
