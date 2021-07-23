uses wincrt;

type mat=array[5..5,5..5] of char;
var f:text;
    ch2,ch:string;
    clee:string;
    m:mat;



function verif(ch:string):boolean;
var i:integer;
ok:boolean;
begin
i:=1;
repeat
if ch[i] in ['A'..'V','X'..'Z']and (i=pos(ch[i],ch)) then
i:=i+1
ok:=true else
ok:=false ;
until (i>length(ch)) or ok=false ;
verif:=ok;
end;

procedure saisie (var clee:string);
ch:string;
begin
repeat
write('donner une chaine');
readln(ch);
until length(ch) in [3..10] and verif(ch);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
end;

procedure lecture(var ch :string);

begin
repeat
writeln('donner un message');
readln(ch);
until ch in ['A'..'Z',' '];                                                                                                 
end;

procedure remplir(var m:mat;clee,ch:string);
 var
 i,l,c;integer;
 car:char;
begin
l:=1;
c:=1;
for i:=1 to length(clee) do
begin
m[l,c]:=clee[i]
c:=c+1;
if c>5 then
begin
l:=l+1;
c:=1;
end;
end;
for car:='A' to 'Z' do
begin
if( pos(car,clee)=0 )and (car<>'W' )then
begin
m[l,c]:=car;
c:=c+1;
if c>5 then
begin
c:=1;
l:=l+1;
end;
end;
end;
end;






begin
assign(f,'Mess_crypt.txt');                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
saisie(clee);
lecture(ch);
remplir(m,clee,ch);
cryptage(ch,ch2,f,m);

end;





















