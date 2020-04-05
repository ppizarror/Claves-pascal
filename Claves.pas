program Start;
uses crt,graph;
var
 opc:byte;
 ok:boolean;
 idiom:string[3];
 progm,crp:string[20];
 Starting:text;

{recuadro principal}
procedure recuadro;
 var
  x,r,y:integer;
 begin
  x:=21;
  textcolor(blue);
  gotoxy(20,4);write(chr(218));
  gotoxy(60,4);write(chr(191));
  gotoxy(20,21);write(chr(192));
  gotoxy(60,21);write(chr(217));
  for r:=1 to 39 do
   begin
    gotoxy(x,4);write(chr(196));
    gotoxy(x,21);write(chr(196));
    inc(x);
  end;
  y:=5;
  for r:=1 to 16 do
   begin
    gotoxy(20,y);write(chr(179));
    inc(y);
  end;
  y:=5;
  for r:=1 to 16 do
   begin
    gotoxy(60,y);write(chr(179));
    inc(y);
  end;
  textcolor(white);
end;

begin
assign(Starting,'C:\Claves\start.bat');
rewrite(Starting);
repeat
clrscr;
recuadro;
ok:=false;
gotoxy(25,12);write('1. Espanol');
gotoxy(25,13);write('2. English');
gotoxy(25,6);textcolor(blue);write('Bienvenido');textcolor(white);
gotoxy(22,8);write('Bienvenido a claves 1.0, porfavor');
gotoxy(22,9);write('seleccione el idioma que desee  ');readln(opc);
 case opc of
  1:begin
    idiom:='esp';
    ok:=true;
    end;
  2:begin
    idiom:='eng';
    ok:=true;
    end;
  else
   begin
    gotoxy(22,15);write('Opcion incorrecta, intente nuevamente');
    delay(1000);
    gotoxy(22,16);write('Pulse cualquier tecla');
    readkey;
    ok:=false;
    end;
  end;
until(ok=true);
progm:='start'+' Cl'+idiom+'.exe';
crp:='start ccp_001.exe';
writeln(Starting,crp);
writeln(Starting,progm);
close(Starting);
end.
