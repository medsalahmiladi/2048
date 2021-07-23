uses wincrt;
type
info = record
nb_dec:string;
mention:string;
end;
fiche=file of info;
var
n:integer;
f1:text;
f2:fiche;
procedure saisir(var n:integer);
begin
repeat
writeln('donner n ');
readln(n);
until n <50 ;
end;

function verif(ch:string):boolean;
var
test:boolean;
i:integer;
begin
i:=1 ;
repeat
test:=false;
if upcase(ch[i]) in ['A'..'Z','0'..'9'] then
begin
test:=true;
i:=i+1;
end;
until( i> length(ch) )or (test=false);
verif:=test;
end;

procedure remplir (var f1:text;n:integer);
var
i:integer;
ch:string;
begin
rewrite(f1);
for i:=1 to n do
begin
repeat
readln(ch);
until (length(ch)<10)and (verif (ch));
writeln('ch= ',i,ch);
writeln(f1,ch);
end;
close(f1);
end;  

function decim(ch:string):string;
var
i:integer;
ch2:string;
begin
ch2:='';
for i:=1 to length(ch) do
if ch[i] in ['0'..'9'] then
ch2:=ch2+ch[i];
if ch2='' then
ch2:='1999999999';
decim:=ch2;
end;

function divisib(ch:string):string;
var
i,k,spaire,simpaire,e,res:integer;
ch2,n:string  ;

begin
spaire :=0;
simpaire:=0;
for i:=1 to length(ch) do
begin
n:=ch[i];
val(n,k,e);
if i mod 2 =0 then
spaire:=spaire+k
else
simpaire:=simpaire+k;
end;
res:=spaire-simpaire;
if abs(res) mod 11 =0 then
ch2:='est devisible par 11'
else
ch2:='n''est pas devisible par 11';
if ch ='' then
ch2:= 'ce n''est pas un nombre decimale';
divisib:=ch2;
end;

procedure creer(var f2:fiche;var f1:text);
var
ch:string;
k:info;
begin
rewrite(f2);
reset(f1);
while not eof(f1) do
begin
readln(f1,ch);
k.nb_dec:=decim(ch);
k.mention:=divisib(k.nb_dec);
write(f2,k);
end;
end;

procedure affiche(var f2:fiche);
var
k:info;
begin
reset(f2);
while not eof(f2) do
begin
read(f2,k);
writeln(k.nb_dec,':',k.mention);
end;
end;

begin
{saisir(n);}
assign(f1,'chaine.txt');
assign(f2,'nombre.dat');
{remplir(f1,n);  }
creer(f2,f1);
affiche(f2);
close(f1);
close(f2);
end.