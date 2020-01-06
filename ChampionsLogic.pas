unit ChampionsLogic;

interface

uses
  SysUtils, Dialogs;


type
  TChampion = record
      Name : String;
      Role : String;
      Health : Integer;
      HealthRegen : Integer;
      AbilityPower : Integer;
      ResourceType : String;
      ResourceRegen : Integer;
      AttackType : String;
      AttackDamage : Integer;
      AttackSpeed : Extended;
      AttackRange : Integer;
      Armor : Integer;
      MagicResist : Integer;
      MovementSpeed : Integer;
  end;


type
  ChampionsArray = Array of TChampion;


function CreateChampion(Name, Role : String; Health, HealthRegen, AbilityPower : Integer; ResourceType : String;
         ResourceRegen : Integer; AttackType : String; AttackDamage : Integer;
         AttackSpeed : Extended; AttackRange, Armor, MagicResist, MovementSpeed : Integer) : TChampion;

function GetAllChampions() : ChampionsArray;

function GetChampion(ChampionName : String) : TChampion;


implementation

function GetAllChampions() : ChampionsArray;
var
  Arr : ChampionsArray;
begin
  SetLength(Arr, 5);
  Arr[0] := CreateChampion('Aatrox', 'Warrior', 3881, 59, 0, 'None', 0, 'Melee', 558, 1.40, 325, 178, 141, 415);
  Arr[1] := CreateChampion('Ahri', 'Assassin', 2600, 37, 811, 'Mana', 21, 'Ranged', 100, 0.78, 400, 120, 103, 450);
  Arr[2] := CreateChampion('Akali', 'Assassin', 2301, 45, 336, 'Energy', 10, 'Melee', 211,  1.15, 350, 100, 100, 395);
  Result := Arr;
end;

function GetChampion(ChampionName : String) : TChampion;
var
  Arr : ChampionsArray;
  Champion : TChampion;
  x : Integer;
begin
  Arr := GetAllChampions();
  for x := Low(Arr) to High(Arr) do
  begin
    if CompareText(ChampionName, Arr[x].Name) = 0 then Champion := Arr[x];
  end;

  Result := Champion;
end;

function CreateChampion(Name, Role : String; Health, HealthRegen, AbilityPower : Integer; ResourceType : String;
         ResourceRegen : Integer; AttackType : String; AttackDamage : Integer;
         AttackSpeed : Extended; AttackRange, Armor, MagicResist, MovementSpeed : Integer) : TChampion;
var
  Champion : TChampion;
begin
  Champion.Name := Name;
  Champion.Role := Role;
  Champion.Health := Health;
  Champion.HealthRegen := HealthRegen;
  Champion.AbilityPower := AbilityPower;
  Champion.ResourceType := ResourceType;
  Champion.ResourceRegen := ResourceRegen;
  Champion.AttackType := AttackType;
  Champion.AttackDamage := AttackDamage;
  Champion.AttackSpeed := AttackSpeed;
  Champion.AttackRange := AttackRange;
  Champion.Armor := Armor;
  Champion.MagicResist := MagicResist;
  Champion.MovementSpeed := MovementSpeed;

  Result := Champion;
end;

end.
