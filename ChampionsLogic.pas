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


function DoesChampionExists(ChampionName : String) : boolean;

function CreateChampion(Name, Role : String; Health, HealthRegen, AbilityPower : Integer; ResourceType : String;
         ResourceRegen : Integer; AttackType : String; AttackDamage : Integer;
         AttackSpeed : Extended; AttackRange, Armor, MagicResist, MovementSpeed : Integer) : TChampion;

function GetAllChampions() : ChampionsArray;

function GetChampion(ChampionName : String) : TChampion;


implementation

function DoesChampionExists(ChampionName : String) : boolean;
var
  Arr : ChampionsArray;
  x : Integer;
begin
  Arr := GetAllChampions();
  for x := Low(Arr) to High(Arr) do
  begin
    if CompareText(Trim(ChampionName), Arr[x].Name) = 0 then
    begin
      Result := True;
      Exit;
    end
    else
      Result := False;
  end;
end;

function GetAllChampions() : ChampionsArray;
var
  Arr : ChampionsArray;
begin
  SetLength(Arr, 15);
  Arr[0] := CreateChampion('Aatrox', 'Warrior', 3881, 59, 0, 'None', 0, 'Melee', 558, 1.40, 325, 178, 141, 415);
  Arr[1] := CreateChampion('Ahri', 'Assassin', 2600, 37, 811, 'Mana', 21, 'Ranged', 100, 0.78, 400, 120, 103, 450);
  Arr[2] := CreateChampion('Akali', 'Assassin', 2301, 45, 336, 'Energy', 10, 'Melee', 211,  1.15, 350, 100, 100, 395);
  Arr[3] := CreateChampion('Alistar', 'Tank', 5353, 125, 0, 'Mana', 21, 'Melee', 107, 0.63, 325, 303, 286, 440);
  Arr[4] := CreateChampion('Amumu', 'Tank', 4333, 57, 0, 'Mana', 17, 'Melee', 99, 0.70, 325, 332, 301, 400);
  Arr[5] := CreateChampion('Anivia', 'Mage', 2250, 30, 591, 'Mana', 49, 'Ranged', 95, 0.61, 450, 105, 80, 430);
  Arr[6] := CreateChampion('Annie', 'Mage', 2666, 66, 666, 'Mana', 66, 'Ranged', 101, 0.88, 450, 120, 100, 399);
  Arr[7] := CreateChampion('Aphelios', 'Marksman', 1680, 13, 30, 'Mana', 11, 'Ranged', 711, 1.88, 475, 63, 39, 480);
  Arr[8] := CreateChampion('Ashe', 'Marksman', 1533, 12, 0, 'Mana', 8, 'Ranged', 491, 2.35, 500, 50, 45, 400);
  Arr[9] := CreateChampion('Aurelion Sol', 'Mage', 3696, 41, 806, 'Mana', 83, 'Ranged', 100, 0.70, 450, 130, 120, 444);
  Arr[10] := CreateChampion('Azir', 'Mage', 3111, 35, 500, 'Mana', 40, 'Ranged', 99, 1.40, 450, 150, 140, 448);
  Arr[11] := CreateChampion('Bard', 'Support', 4881, 85, 100, 'Mana', 50, 'Ranged', 86, 0.60, 400, 253, 191, 463);
  Arr[12] := CreateChampion('Blitzcrank', 'Tank', 5001, 54, 50, 'Mana', 41, 'Melee', 103, 1.00, 320, 291, 200, 450);
  Arr[13] := CreateChampion('Brand', 'Mage', 2310, 15, 758, 'Mana', 45, 'Ranged', 100, 0.88, 450, 133, 102, 441);
  Arr[14] := CreateChampion('Nasus', 'Warrior', 6356, 217, 30, 'Mana', 150, 'Melee', 1851, 1.15, 350, 586, 411, 555);
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
    if CompareText(Trim(ChampionName), Arr[x].Name) = 0 then Champion := Arr[x];
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
