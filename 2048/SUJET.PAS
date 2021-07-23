uses wincrt;

type
info=record
num:byte;
sym:boolean;
voy:boolean;
end;

fiche=file of info;

var
n:integer;
f1:text;
f2:fiche;

procedure saisir(var n:integer);
begin
repeat
write('donner n= ');
readln(n);
until(n>2);
end;

procedure remplir(var f1:text;n:integer);
var
i:integer;
ch:string;
begin
rewrite(f1);
for i:=1 to n do
begin
readln(ch);
writeln(f1,ch);
end;
end;

function symetrie(ch:string):boolean;
var
res:boolean;
begin
res:=false;
if ch[1]=ch[length(ch)] then
res :=true;
symetrie:=res;
end;

function voyelle(ch:string):boolean;
var
res:boolean;
begin
res:= false;
if UPCASE(ch[1]) in ['A','E','I','O','U','Y']  then
res:=true;
voyelle:=res;
end;

procedure remplir2(var f1:text;var f2:fiche;n:integer);
var
i:integer;
ch:string;
k:info;
begin                                {-2}
reset(f1);
rewrite(f2);
for i:=1 to n do
begin
readln(f1,ch);
k.num:=n;
k.sym:=symetrie(ch);
k.voy:=voyelle(ch);
write(f2,k);
end;
end;

procedure affiche(var f2:fiche);
var
k:info;
begin
while not eof(f2) do
begin
read(f2,k);
writeln(k.num,k.sym,k.voy)
end;
end;




begin
assign(f1,'c:\tpw\medsalah\donnees.txt');
saisir(n);
remplir(f1,n);
assign(f2,'c:\tpw\medsalah\resultat.dat');
remplir2(f1,f2,n);
affiche(f2);
end.