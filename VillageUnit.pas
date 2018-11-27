unit VillageUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
type Mois = (janvier,fevrier,mars,avril,mai,juin,juillet,aout,septembre,octobre,novembre,decembre);
type Metier = (bucheron,constucteur,pecheur,explorateur,fermier,aucun);
type personnage = record
    PV : Integer;
    travail : Metier;
    ID : Integer;
  end;
type Village = record
    bois,poisson,viande,pain,lait,legumes,composesScientifique,objetsPrecieux,tour,annee : Integer;
    m : Mois;

  end;
    {Début de la nouvelle partie}
procedure debutPartie(var town : Village);
    {Passe un tour}
procedure tourSuivant;
    {Créer un nouveau personnage}
function newPersonnage(ID : Integer; t : Metier):Personnage;
function writeMetier( t: Metier):String;

implementation
var
  bois,poisson,viande,pain,lait,legumes,composesScientifique,objetsPrecieux,annee,tour : Integer;
  m : Mois;
procedure debutPartie(var town : Village);
Begin
  town.bois := 0;
  town.poisson := 10;
  town.viande := 10;
  town.pain := 10;
  town.lait := 10;
  town.legumes := 10;
  town.composesScientifique := 10;
  town.objetsPrecieux := 10;
  town.annee := 2177;
  town.m := avril;
  town.tour := 0;
end;
procedure tourSuivant;
Begin
  tour := tour +1;
  if tour = 3 then
  begin
    tour := 0;
    if m = decembre then
    begin
      m := janvier;
      annee := annee +1;
    end
    else
      m := succ(m);
  end;
end;
function newPersonnage( ID : Integer; t: Metier):Personnage;
begin
  newPersonnage.travail := t;
  newPersonnage.ID := ID;
  newPersonnage.PV := 100;
end;
function writeMetier( t: Metier):String;
begin
  case t of
    bucheron : WriteLn(UnicodeCharToString('Bûcheron'));
    constucteur : WriteLn('Constructeur');
    pecheur : WriteLn(UnicodeCharToString('Pêcheur'));
    explorateur : WriteLn('Explorateur');
    fermier : WriteLn('Fermier');
    aucun : WriteLn('Aucun');
  end;
end;
end.