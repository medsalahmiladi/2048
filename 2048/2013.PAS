uses wincrt;
type
info=record
nl:integer;
icd:integer;
icf:integer;
end;
mat=array[1..24,1..24]of integer;
tab=array[1..1000]of info;
var
l,c,n,max:integer;
f:text;
m:mat;
t:tab;
procedure lecture (var l,c:integer);
begin
repeat
writeln('l=');
readln(l);
writeln('c=');
readln(c);
until (l in [2..24] ) and(c in [2..24]);
end;

procedure remplir(var m:mat;l,c:integer);
var
i,j:integer;
begin
for i:=1 to l do
for j:=1 to c do
begin
repeat
write('donner entier ',i,',',j,'= ');
readln(m[i,j]);
 until m[i,j]<>0;
 end;
 end;
 procedure  creer(var t:tab;m:mat;l,c:integer;var n:integer);
 var
 i,icd,icf,som:integer;
 k:info;
 begin
 n:=1;
  for i:=1 to l do
  for icd:=1 to c-1 do
  begin
  som:=0;
  for icf:=icd to c do
  begin
  som:=som+icf;
  if som =0 then
  begin
  k.nl:=i;
  k.icd:=icd;
  k.icf:=icf;
  t[n]:=k;
  n:=n+1;
  end;
  end;
  end;
  end;
function maximum(t:tab;n:integer):integer;
var
i,long,max:integer;
k:info;
begin
max:=0;
for i:=1 to n do
begin
k:=t[i];
long:=k.icf-k.icd+1;
if long>max then
max := long;
end;
maximum:=max;
end;
procedure creerfiche(var f:text;t:tab;max,n:integer);
var
long,i:integer;
k:info;
begin
rewrite(f);
for i := 1 to n do
begin
k:=t[i] ;
long:=k.icf-k.icd+1;
if long=max then
writeln(f,k.nl,'#',k.icd,'#',k.icf);
end;
close(f);
end;
   


begin
lecture(l,c);
remplir(m,l,c);
n:=0;
creer(t,m,l,c,n);
max:=maximum(t,n);
assign(f,'long_seq.txt');
creerfiche(f,t,max,n);
end .










