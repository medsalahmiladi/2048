uses wincrt;
type
matrice=array[1..4,1..4]of integer;
tb=array[1..16]of integer;

var
mat:matrice;
ok:boolean;
rep:char;

function exist (v:integer;t:tb;nb:integer):boolean;
var
i:integer;
ok:boolean;
begin
 ok:=false;
  repeat
   begin
    if v=t[i] then
     ok:=true;
    i:=i+1
    end;
  until (ok=true) or (i=nb);
exist:=ok;
end;

procedure rand(var tab:matrice);
var
nb,l,c,v:integer;
ok:boolean;
t:tb;
begin
nb:=1;
for l:=1to 4 do
 for c:=1 to 4 do
  begin
   repeat
   randomize;
    v:=random(16)+1;
    write(v,'  ');
    if not(exist(v,t,nb)) then
    begin
    ok:=true;
    end;
    
   until (ok=true) or (nb=16)  ;
  tab[l,c]:=v;
  t[nb]:=v;
  nb:=nb+1;
  end;
  end;
 
  
   

{procedure premier(var mat:matrice);
begin
for l:=1to 4 do
 for c:=1 to 4 do
  mat[l,c]:=0;


rand(tab);
applrand(mat,tab);

}

procedure affiche(mat:matrice);
var
l,c:integer;
begin
for l:=1 to 4 do
begin
writeln   ;
for c:=1 to 4 do
 write(mat[l,c],'  ');
 end;
 end;

begin
rand(mat);
affiche(mat);


{premier(mat);
affiche(mat);

repeat
ok:=false;

repeat
readln(rep);
until(rep in['q','s','d','z']);

decalage(mat,rep)
ajout(mat);
control(mat,ok);
clrscr;
affiche(mat);
until ok=false;

writeln('game over');
 }
end.