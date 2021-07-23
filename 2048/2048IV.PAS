uses wincrt;
type
matrice=array[1..4,1..4]of integer;

var
mat:matrice;
ok,verif,ful:boolean;
rep:char;

function exist(v:integer;mat:matrice):boolean;
var
ok:boolean;
l,c:integer;
begin
ok:=false;
for l:=1to 4do
 for c :=1 to 4 do
 begin
 if mat[l,c]=v then
 ok:=true;
 end;
 exist:=ok;
 end;

PROCEDURE rand(var mat:matrice);
var
l,c,v:integer;
ok:boolean;
begin
for l:=1to 4do
 for c :=1 to 4 do
  mat[l,c]:=0;

for l:=1to 4do
 for c :=1 to 4 do
 begin
 repeat
 ok:=false;
 randomize;
 v:=random(16)+1;
 if not( exist(v,mat) ) then
 ok:=true;
 until ok=true;
 mat[l,c]:=v;
 end;
 end;

 procedure applrand(var mat:matrice;tab:matrice;var verif:boolean);
 var
 i,l,c,p:integer;
 ok:boolean;
 begin
 i:=0;
 ok:=false;
  repeat
   i:=i+1;
  for l:=1to 4do
   for c :=1 to 4 do
   begin
    if tab[l,c]=i then
      if mat[l,c]=0 then
       begin
       randomize;
       p:=random(10);
       if p in[0..7] then
       mat[l,c]:=2
       else
       mat[l,c]:=4;                             
       ok:=true ;
       end;
    end;
   until (ok=true) or (i=16);
   verif:=ok;
  end;

procedure premier(var mat:matrice);
var
l,c:integer;
tab:matrice;
a:boolean;
begin
for l:=1to 4 do
 for c:=1 to 4 do
  mat[l,c]:=0;


rand(tab);
applrand(mat,tab,a);

end;

procedure affiche(mat:matrice);
var
l,c:integer;
begin
for l:=1 to 4 do
begin
writeln   ;                     {mise a jour}
for c:=1 to 4 do
 begin
 if mat[l,c]=0 then
 write(' . ')
 else
 write(' ',mat[l,c],' ');
 end;
 writeln;
 end;
 end;

 procedure decalage(var mat:matrice;rep:char;var verif:boolean);
 var
 l,c,i,nb:integer;

 begin
 verif:=false;
 if rep='z' then
  begin
   for c:=1 to 4 do
    begin
     for l:=1 to 3 do
      begin
       nb:=0;
      repeat
      if mat[l,c]=0 then
       begin
       nb:=nb+1;
       for i:=l to 3 do
        begin
        mat [i,c]:=mat[i+1,c];
         if mat[i+1,c]<>0 then
          verif :=true;
        end;
       mat[4,c]:=0;  
       end;
      until (mat[l,c]<>0) or (nb=3)
      end;

      for l:=1 to 3 do
      begin
       if (mat[l,c]=mat[l+1,c]) and (mat[l,c]<>0)then
        begin
         mat[l,c]:=(mat[l,c])*2 ;
         mat[l+1,c]:=0;
         verif:=true;
        end;
      end;

      for l:=1 to 3 do
      begin
      nb:=0;
      repeat
      if mat[l,c]=0 then
       begin
       nb:=nb+1;
       for i:=l to 3 do
        begin
        mat [i,c]:=mat[i+1,c];
        end;
       mat[4,c]:=0;  
       end;
      until (mat[l,c]<>0) or (nb=3)
      end;
     end;
    end;
  if rep='s' then
   begin
   for c:=1 to 4 do
    begin
     for l:=4 downto 2 do
      begin
       nb:=0;
      repeat
      if mat[l,c]=0 then
       begin
       nb:=nb+1;
       for i:=l downto 2 do
        begin
        mat [i,c]:=mat[i-1,c];
         if mat[i-1,c]<>0 then
          verif :=true;
        end;
       mat[1,c]:=0;  
       end;
      until (mat[l,c]<>0) or (nb=3)
      end;

      for l:=4 downto 2 do
      begin
       if (mat[l,c]=mat[l-1,c]) and (mat[l,c]<>0)then
        begin
         mat[l,c]:=(mat[l,c])*2 ;
         mat[l-1,c]:=0;
         verif:=true;
        end;
      end;

      for l:=4 downto 2 do
      begin
      nb:=0;
      repeat
      if mat[l,c]=0 then
       begin
       nb:=nb+1;
       for i:=l downto 2 do
        begin
        mat [i,c]:=mat[i-1,c];
        end;
       mat[1,c]:=0;
       end;
      until (mat[l,c]<>0) or (nb=3)
      end;
     end;
    end;
 if rep='q' then
  begin
   for l:=1 to 4 do
    begin
     for c:=1 to 3 do
      begin
       nb:=0;
      repeat
      if mat[l,c]=0 then
       begin
       nb:=nb+1;
       for i:=c to 3 do
        begin
        mat [l,i]:=mat[l,i+1];
         if mat[l,i+1]<>0 then
          verif :=true;
        end;
       mat[l,4]:=0;  
       end;
      until (mat[l,c]<>0) or (nb=3)
      end;

      for c:=1 to 3 do
      begin
       if (mat[l,c]=mat[l,c+1]) and (mat[l,c]<>0)then
        begin
         mat[l,c]:=(mat[l,c])*2 ;
         mat[l,c+1]:=0;
         verif:=true;
        end;
      end;

      for c:=1 to 3 do
      begin
      nb:=0;
      repeat
      if mat[l,c]=0 then
       begin
       nb:=nb+1;
       for i:=c to 3 do
        begin
        mat [l,i]:=mat[l,i+1];
        end;
       mat[l,4]:=0;
       end;
      until (mat[l,c]<>0) or (nb=3)
      end;
     end;
    end;
   if rep='d' then
   begin
   for l:=1 to 4 do
    begin
     for c:=4 downto 2 do
      begin
       nb:=0;
      repeat
      if mat[l,c]=0 then
       begin
       nb:=nb+1;
       for i:=c downto 2 do
        begin
        mat [l,i]:=mat[l,i-1];
         if mat[l,i-1]<>0 then
          verif :=true;
        end;
       mat[l,1]:=0;  
       end;
      until (mat[l,c]<>0) or (nb=3)
      end;

      for c:=4 downto 2 do
      begin
       if (mat[l,c]=mat[l,c-1]) and (mat[l,c]<>0)then
        begin
         mat[l,c]:=(mat[l,c])*2 ;
         mat[l,c-1]:=0;
         verif:=true;
        end;
      end;

      for c:=4 downto 2 do
      begin
      nb:=0;
      repeat
      if mat[l,c]=0 then
       begin
       nb:=nb+1;
       for i:=c downto 2 do
        begin
        mat [l,i]:=mat[l,i-1];
        end;
       mat[l,1]:=0;
       end;
      until (mat[l,c]<>0) or (nb=3)
      end;
     end;
    end;                                     

 end;

 procedure ajout(var mat:matrice;verif:boolean;var ok:boolean);
  var
  tab:matrice;
  begin
   if verif then
   begin
   rand(tab);
   applrand(mat,tab,ok);
   end;
  end;
 function full(mat:matrice):boolean;
 var
 l,c:integer;
 ok:boolean;
 begin
 ok:=true;
 for l:=1 to 4 do
 for c:=1 to 4 do
  begin
   if mat[l,c]=0 then
    ok:=false;
  end;
 full:=ok;
 end;

procedure affmenu(var rep1:string;);
begin
writeln('nouvelle partie  :n') ;
writeln('affiche meuiller score  :score') ;
writeln('quitter le jeux  :x') ;
 repeat
 readln(rep1);
 until (rep1='n') or (rep1='score') or( rep1='x');
 end;
 procedure affscore (var f :fiche);
 var
 i:integer;
 en:enreg;
 begin
 clrscr;
 for i:=1 to 5 do
 begin
  read(f,en);
  write(en.nom,' : ',en.score);
  end;
  readln;
 end;
 procedure ajscore


begin
assigner(f,'c:\tpw\medsalah\2048.')  {   extention  }
affmenu(rep1);
repeat
if rep1='n' then
begin
repeat
premier(mat);
affiche(mat);
repeat
ok:=false;
repeat
readln(rep);
until(rep in['q','s','d','z']);                                              {}
decalage(mat,rep,verif);
ajout(mat,verif,ok);
clrscr;
affiche(mat);
if (ok=false) and (full(mat)) then
writeln(' rod balek toghlot 5ater fama BUG ');
until (ok=false) and(full(mat));
writeln('game over');
ajscore();  {nom..}
readln;
end;
else if rep1='score' then
begin
affscore(f);
affmenu(rep1);
end;
else if rep1='menu' then
affmenu();
until(rep1='x');

end.