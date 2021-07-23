uses wincrt;

type info1=record
           chaine:string;
           equiv:integer;
 end;

 fiche= file of info1;
var
ft:text;
f:fiche;

function verif (ch:string):boolean;
var ok:boolean ;
    i:integer;
begin
i:=1; 
repeat
if ch[i] in ['I','V','X', 'L' ,'C', 'D' ,'M'] then
begin
ok:=true;
i:=i+1;
end
 else
ok:=false;
until (i>length(ch)) and (ok=false); 
verif:=ok;
end;

procedure remplir(var ft:text);
var ch:string;
    rep:char;
begin
rewrite(ft);

  repeat
  repeat
writeln('donner une chaine') ;
 readln(ch);
  until verif(ch) ;
  writeln(ft,ch);
   repeat
writeln('vouler vous saisir de noveaux')  ;
readln(rep) ;
until upcase (rep) in ['O','N'];

until upcase (rep) ='N' ;

close(ft);
end;

function equivalant(ch:string):integer;
var i,v,x,l,c,d,m:integer;
begin
i:=1;
v:=5;
x:=10;
l:=50;
c:=100;
d:=500;
m:=1000;
for i:=1 to length(ch) do
case ch[i] of 
 'i' 
 'v'
 'x' 
 'l' 
 'c' 
 'd' 
 'm'
 end;
end:
procedure former (var ft:text; var f:fiche ) ;
var ch:string;
    k:info1  ;
begin
reset (ft);rewrite(f);
while not eof(ft)do
begin 
readln(ft,ch);
k.chaine:=ch;
k.equiv:=equivalant(ch);
write(f,k);
end;
end;

procedure affiche (var f:fiche) ;
k:info1;
begin
reset(f);
while not eof(f) do
begin
read(f,k) ;
writekn (k.chaine , k.equiv) ;
end;
end;

begin
assign(ft,'romain.txt');
assign(f,'romain.dat');
remplir(ft) ;
former(ft,f);
affiche(f)   ;
close(f);
end.