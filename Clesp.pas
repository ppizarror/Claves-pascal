program Claves;
uses crt,graph,dos;

 {PROGRAMA CREADO PARA USO PROPIO}
 {POR PABLO PIZARRO}
{-------------------------------------------------------------------------------------------}

//colores        {para no darme la LATAAA de escribir todo de nuevo}
procedure blanco;
 begin
  textcolor(white);
end;

procedure azul;
 begin
  textcolor(blue);
end;

procedure rojo;
 begin
  textcolor(red);
end;

procedure verde;
 begin
  textcolor(green);
end;
//

procedure cur;  {para establecer el cursor}
 begin
  gotoxy(1,20);
end;

{Menu inicial}
procedure menuini;
 begin
  gotoxy(36,6);verde;write('Claves v1.0');blanco;
  gotoxy(38,11);azul;write('I');blanco;write('nicio');
  gotoxy(37,13);azul;write('A');blanco;write('cerca de ');
  gotoxy(38,15);azul;write('C');blanco;write('errar');
  gotoxy(26,22);write('Pulse la tecla correspondiente');
  gotoxy(26,23);write('a la tarea que quiere realizar');
end;

{Menu iniciar}        {donde sale las opc de crear, abrir, editar o eliminar}
procedure menupart;
 begin
  gotoxy(31,6);verde;write('Inicio - Claves v1.0');blanco;
  gotoxy(38,9);azul;write('C');blanco;write('rear');
  gotoxy(38,11);azul;write('A');blanco;write('brir ');
  gotoxy(38,13);azul;write('E');blanco;write('ditar');
  gotoxy(38,15);azul;write('B');blanco;write('orrar');
  gotoxy(38,17);azul;write('V');blanco;write('olver');
  gotoxy(26,22);write('Pulse la tecla correspondiente');
  gotoxy(26,23);write('a la tarea que quiere realizar');
  cur;
end;

procedure instedic; {muestra las instrucciones}
 begin
  gotoxy(20,22);azul;write('N');blanco;write(' nuevo   ');azul;write('R');blanco;write(' repetir   ');;azul;write('T');blanco;write(' terminar la lista');
end;

procedure inicio;           {Proc que muestra el titulo inicial}
 var
  n:char;
 begin
  gotoxy(35,11);blanco;write('Claves v1.0');cur;
  delay(1230);
  gotoxy(28,13);write('Pulse ');azul;write('enter');blanco;write(' para continuar');
  repeat
   cur;n:=ReadKey;
  until(n=chr(13));
  sound(2);
  clrscr;
end;

{recuadro principal}
procedure recuadro;
 var
  x,r,y:integer;
 begin
  x:=21;
  azul;
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

procedure recuadropass;
 begin
  gotoxy(29,11);write(chr(218));
  gotoxy(34,11);write(chr(191));
  gotoxy(29,13);write(chr(192));
  gotoxy(34,13);write(chr(217));
  gotoxy(29,12);write(chr(179));
  gotoxy(34,12);write(chr(179));
  gotoxy(30,11);write(chr(196));
  gotoxy(31,11);write(chr(196));
  gotoxy(32,11);write(chr(196));
  gotoxy(33,11);write(chr(196));
  gotoxy(30,13);write(chr(196));
  gotoxy(31,13);write(chr(196));
  gotoxy(32,13);write(chr(196));
  gotoxy(33,13);write(chr(196));
end;

procedure recuadropass2;
 begin
  gotoxy(39,11);write(chr(218));
  gotoxy(44,11);write(chr(191));
  gotoxy(39,13);write(chr(192));
  gotoxy(44,13);write(chr(217));
  gotoxy(39,12);write(chr(179));
  gotoxy(44,12);write(chr(179));
  gotoxy(40,11);write(chr(196));
  gotoxy(41,11);write(chr(196));
  gotoxy(42,11);write(chr(196));
  gotoxy(43,11);write(chr(196));
  gotoxy(40,13);write(chr(196));
  gotoxy(41,13);write(chr(196));
  gotoxy(42,13);write(chr(196));
  gotoxy(43,13);write(chr(196));
end;

procedure recuadronom;
 var
  x,gox:integer;
 begin
  gotoxy(30,11);write(chr(218));
  gotoxy(50,11);write(chr(191));
  gotoxy(30,13);write(chr(192));
  gotoxy(50,13);write(chr(217));
  gotoxy(30,12);write(chr(179));
  gotoxy(50,12);write(chr(179));
  gox:=31;
  for x:=1 to 19 do
   begin
    gotoxy(gox,11);write(chr(196));
    gotoxy(gox,13);write(chr(196));
    inc(gox);
  end;
end;


{Procedimiento mas importante}
procedure principal;
 const
  max=200;                       {max es el 'maximo' de claves posibles}
 var
  archivo:text;                  {es el archivo creado}
  dat:string;                    {nombre del archivo}
  dato,acft,opt,carp:string;
  optarch:text;                  {archivo de opciones}
  acf:text;                      {archivo de uso externo}
  texto:array[1..max] of string[30]; {es el nombre de usuario como array definido por max}
  cont:array[1..max] of string[30];  {es la contraseña propiamente tal}
  sit:array[1..max] of string[30];   {es el nombre del sitio del usuario}
  buscar:array[1..max] of string[30];
  resultados:array[1..max] of string[30];      {es el resultado del nombre del sitio}
  resultadon:array[1..max] of string[30];      {es el resultado del nombre de usuario}
  resultadoc:array[1..max] of string[30];      {es el resultado del clave de usuario}
  busca:string[20];
  b:byte;
  n,t,x:integer;                 {es es la cantidad de veces para array y t para clave (los 4 para array)}
  y:byte;                        {y posc gotoxy}
  opc,g,o,v:char;                      {opc inicial, g es la opcion de estar seguro S/N en clave, o es la opcion de digitalizacion de usuarios para t y n}
  contin,contin2,contin3,univ,acceder,ok:boolean;  {continuacion si falso o verdadero (los 3 primeros) y univ es para el repeat de o, acceder es cuando usuario ingresa pass para accecer a archivo}
  cla:array[1..4] of string;                 {clave de acceso}
  clac:array[1..4] of string;                {clave de reingreso}
  accs:array[1..4] of string;                {clave para acceder}
  accsn,nc,goy,acp,cnt:integer;                             {numero para acceder}//{nc numero de comprobacion}//{goy es la posc del cursor en modo abrir}{acp es la cantidad de veces que se lee un readkey para hacer tareas en modo abrir}
  lim:integer;                             {limite de usuarios en un fichero archivo[n]}
  pasodecontrasena:boolean;                {si el reingreso de contraseña es correcto, se muestran los datos S/N}
  gotx,goty,c,cant,yl,m,porc:integer;             {gotx es una posc gotoxy para escribir el recuadro, gotoy lo mismo, c es la cantidad de veces que se hace una tarea, cant es la cantidad de chr(179) que tiene un texto, esto varia (puede ser 10 o 100) yl es la posc yl del gotoxy que escribe el 179 hacia abajo (no sirve el goty ya que este es ocupado y no puede ser modificado}
                                                  {m es para contador de borrar y el porc el porcentaje que lleva}
  gy,gx,ym,ct,cy,gry,cry:integer;                          {son para visualizar los resultados de la busqueda}
 begin
  {leer la opcion}
  repeat
   clrscr;
   recuadro;
   menupart;
   opc:=ReadKey;
  case upcase(opc) of
  {.......................................................................}
  {Creacion}
  'C':begin
      delay(200);
      repeat
       clrscr;
       recuadro;
       recuadronom;
       gotoxy(25,7);verde;write('A');blanco;write('signe un nombre al archivo');
       gotoxy(25,9);verde;write('I');blanco;write('ngrese el nombre: ');
       {lectura del nombre del arhivo y posterior asignacion de archivos}
       gotoxy(31,12);readln(dat);
       gotoxy(25,15);write('Estas seguro ');write('S/N');blanco;
       repeat
        cur;g:=Readkey;
        if g='n' then
         begin
          g:='N';
        end;
        if g='s' then
         begin
          g:='S';
        end;
        case g of
         'S':begin
             contin3:=true;
             contin2:=true;
             end;
         'N':begin
             contin3:=true;
             contin2:=false;
             end;
         else
          begin
          contin3:=false;
         end;
        end;
        until(contin3=true);
       until(contin2=true);
      contin3:=false;
      contin2:=false;
      {creacion}
      carp:='C:\Claves\Data\'+dat+'_dat';
      mkdir(carp);
      dato:=carp+'\'+dat+'.'+'dat';
      opt:=carp+'\'+dat+'opt'+'.'+'opt';
      acft:=carp+'\'+dat+'acf'+'.'+'acfr';
      {..............................................................}
      assign(archivo,dato);
      rewrite(archivo);
      assign(optarch,opt);
      assign(acf,acft);
      rewrite(acf);

      lim:=1;
      {clave de acceso}
      repeat
       rewrite(optarch);
       nc:=0;
       clrscr;
       recuadro;
       y:=30;
       gotoxy(25,6);verde;write('Proteja su archivo');blanco;
       gotoxy(25,10);write('Ingrese clave de proteccion');
       recuadropass;
       recuadropass2;
       for t:=1 to 4 do
        begin
         gotoxy(y,12);cla[t]:=Readkey;
         writeln(optarch,cla[t]);
         gotoxy(y,12);write('*');
         inc(y);
       end;
       gotoxy(25,10);write('Ahora reingrese la contraseña');   {tiene que reingresar la contraseña}
       y:=40;
       for t:=1 to 4 do
        begin
         gotoxy(y,12);clac[t]:=Readkey;
         gotoxy(y,12);write('*');
         if (clac[t])=(cla[t]) then
          begin
           nc:=nc+1;
         end;
         inc(y);
       end;
       if (nc=4) then
        begin
         pasodecontrasena:=true;
       end;
       if (nc<>4) then
        begin
         gotoxy(25,15);write('Contrasenas no coinciden');   {muestra esto si las contraseñas ingresadas no son iguales}
         gotoxy(25,16);write('pulse cualquier tecla');
         readkey;
       end;
       while (pasodecontrasena=true) do
       begin
       gotoxy(25,15);write('Estas seguro ');write('S/N');blanco;
       repeat
        cur;g:=Readkey;
        if g='n' then
         begin
          g:='N';
        end;
        if g='s' then
         begin
          g:='S';
        end;
        case g of                                     {si es s entonces usuario esta listo}
         'S':begin
             contin3:=true;
             contin2:=true;
             close(optarch);
             pasodecontrasena:=false;
             end;
         'N':begin
             contin3:=true;
             contin2:=false;
             rewrite(optarch);
             pasodecontrasena:=false;
             end;
         else
          begin
          contin3:=false;
         end;
        end;
       until(contin3=true);
       end;
      until(contin2=true);
     {fin clave de acceso}

      clrscr;
      recuadro;
      for n:=1 to max do
       begin
        recuadro;
        gotoxy(25,10);write('Sitio  : ');
        gotoxy(25,12);write('Usuario: ');
        gotoxy(25,14);write('Clave  : ');
        gotoxy(35,10);readln(sit[n]);
        gotoxy(35,12);readln(texto[n]);
        gotoxy(35,14);readln(cont[n]);
        writeln(archivo,sit[n]);
        writeln(archivo,texto[n]);
        writeln(archivo,cont[n]);
        delay(200);
        instedic;
        repeat
         cur;o:=Readkey;
         if o='n' then
          begin
           o:='N';
         end;
         if o='t' then
          begin
           o:='T';
         end;
         if o='r' then
          begin
           o:='R';
         end;
         case o of
          'N':begin
              univ:=true;
              lim:=lim+1;
              clrscr;
              end;
          'T':begin
                n:=max;
                univ:=true;
              end;
          'R':begin
              univ:=true;
              n:=n-1;
              clrscr;
              end;
          else
           begin
            univ:=false;
          end;
         end;
        until(univ=true);
      end;
      writeln(acf,lim);
      close(acf);
      close(archivo);
      delay(100);
      clrscr;
     end;
 {-------------------------------------------------------------------------------------------}

 {Apertura}
  'A':begin
     delay(200);
     clrscr;
     recuadro;
     recuadronom;
     gotoxy(25,7);verde;write('E');blanco;write('sciba el nombre de su archvo');
     gotoxy(25,9);verde;write('I');blanco;write('ngrese el nombre: ');
     {lectura del nombre del arhivo y posterior asignacion de archivos, o sea la creacion de carpetas y todo lo demas}
     gotoxy(31,12);readln(dat);
     {creacion}
      carp:='C:\Claves\Data\'+dat+'_dat';
      dato:=carp+'\'+dat+'.'+'dat';
      opt:=carp+'\'+dat+'opt'+'.'+'opt';
      acft:=carp+'\'+dat+'acf'+'.'+'acfr';
      {..............................................................}
     {lectura de contraseña}
     for x:=1 to 3 do
      begin
      assign(optarch,opt);{carga las opciones}
      reset(optarch);
      accsn:=0;
      y:=30;
      clrscr;
      recuadro;
      gotoxy(25,6);verde;write('Abrir archivo');blanco;
      gotoxy(25,10);write('Ingrese clave para ingresar');
      recuadropass;
      for t:=1 to 4 do
       begin
        readln(optarch,cla[t]);
        gotoxy(y,12);accs[t]:=Readkey;
        gotoxy(y,12);write('*');
        inc(y);
        if (accs[t])=(cla[t]) then
         begin
          inc(accsn);
        end;
      end;

      {clave correcta}
      if (accsn=4) then
       begin
        gotoxy(25,14);rojo;write('C');blanco;write('lave ');verde;write('correcta');blanco;write(', pulse cualquier');
        gotoxy(25,15);write('tecla para continuar');
        cur;
        readkey;
        delay(100);
        x:=3;
        acceder:=true;
      end;
      //////////////////////////////

      if (accsn<>4) and (x<>3) then
       begin
        gotoxy(25,14);rojo;write('C');blanco;write('lave incorrecta, pulse cualqu-');
        gotoxy(25,15);write('ier tecla para continuar');
        cur;
        readkey;
        delay(100);
      end;
      if (accsn<>4) and (x=3) then
       begin
        gotoxy(25,14);rojo;write('U');blanco;write('sted se ha equivocado tres veces');
        gotoxy(25,15);                       write('presione una tecla para volver  ');
        gotoxy(25,16);                       write('al menu');
        cur;
        readkey;
        clrscr;
      end;
     close(optarch);
    end;

    {fin de la lectura, solo se avanza si contraseña es correcta}
    {comienzo de la tarea principal}
    while (acceder=true) do
    begin
     clrscr;
     {empieza}
     assign(archivo,dato);{carga los datos}
     reset(archivo);
     assign(acf,acft);   {carga las conf}
     reset(acf);
     y:=6;
     readln(acf,lim);
     for n:=1 to lim do
      begin
       readln(archivo,sit[n]);
       gotoxy(22,y);write(n,'.');
       gotoxy(25,y);write('Sitio:   ',sit[n]);
       inc(y);
       readln(archivo,texto[n]);
       gotoxy(25,y);write('Usuario: ',texto[n]);
       inc(y);
       readln(archivo,cont[n]);
       gotoxy(25,y);write('Clave:   ',cont[n]);
       y:=y+2;
     end;
     close(archivo);
     close(acf);
     goty:=y+1;
     goy:=1;
     gotx:=21;
     yl:=5;
     azul;
     gotoxy(20,4);write(chr(218));
     gotoxy(60,4);write(chr(191));
     gotoxy(20,goty);write(chr(192));
     gotoxy(60,goty);write(chr(217));
     for c:=1 to 39 do
      begin
       gotoxy(gotx,4);write(chr(196));
       gotoxy(gotx,goty);write(chr(196));
       inc(gotx);
     end;
     cant:=y-4;
     for c:=1 to cant do
      begin
       gotoxy(20,yl);write(chr(179));
       gotoxy(60,yl);write(chr(179));
       inc(yl);
     end;
     blanco;
     gotoxy(17,2);azul;write(#24#25);blanco;write(' Mover la hoja  ');azul;write('B');blanco;write(' para buscar  ');
     azul;write('ESC');blanco;write(' para salir');
     gotoxy(20,(goty+1));verde;write('              Codigos v1.0');blanco;
     for acp:=1 to 99999999 do
      begin
       gotoxy(80,goy);v:=Readkey;
       if (v='b') then
        begin
         v:='B';
       end;
       case v of
        #72:begin                               {arriba}
            if (goy=1) then
              begin
               acp:=acp-1;
            end;
            if (goy>1) then
             begin
              goy:=goy-1;
            end;
            end;
        #80:begin                               {abajo}
            if (goy=goty+3) then
             begin
              acp:=acp-1;
            end;
            if (goy>0) and (goy<goty+3) then
             begin
              inc(goy);
            end;
            end;
        #27:begin                               {esc}
            acp:=99999999;
            delay(200);
            clrscr;
            acceder:=False;
            end;

        'B':begin
            {buscar una clave}
            acp:=99999999;
            repeat
             clrscr;
             assign(archivo,dato);{carga los datos}
             reset(archivo);
             assign(acf,acft);   {carga las conf}
             reset(acf);
             univ:=false;
             contin2:=false;
             clrscr;
             recuadro;
             gotoxy(25,6);verde;write('Buscar - Claves v1.0');blanco;
             gotoxy(25,9);write('Ingrese el termino a buscar, este');
             gotoxy(25,10);write('no puede comenzar con www ni http');
             recuadronom;
             gotoxy(31,12);readln(busca);
             gotoxy(25,14);write('Buscando');
             for b:=1 to 3 do
              begin
               case b of
                1:begin
                  gotoxy(33,14);write('.');
                  delay(200);
                  end;
                2:begin
                  gotoxy(34,14);write('.');
                  delay(100);
                  end;
                3:begin
                  gotoxy(35,14);write('.');
                  delay(300);
                  end;
                end;
             end;
             cnt:=0;                                 {cantidad de terminos encontrados}
             readln(acf,lim);                        {leer el lim}
             for n:=1 to lim do
              begin
               buscar[n]:=busca;                {asignacion a buscador}
               readln(archivo,sit[n]);
               readln(archivo,texto[n]);
               readln(archivo,cont[n]);
               if (buscar[n]=sit[n]) then
                begin
                 inc(cnt);
                 resultados[cnt]:=sit[n];
                 resultadon[cnt]:=texto[n];
                 resultadoc[cnt]:=cont[n];
               end;
             end;
             close(archivo);
             close(acf);
             gotoxy(25,14);write('Se han encontrado ',cnt,' coincidencias');
             delay(1000);
             if (cnt=0) then
              begin
               gotoxy(23,22);write('Pulse ');azul;write('N');blanco;write(' para nuevo o ');azul;write('Esc');blanco;write(' para volver');
               univ:=false;
               repeat
               cur;g:=Readkey;
               case upcase(g) of
                #27:begin
                    univ:=true;
                    contin2:=true;
                    acceder:=true;
                    delay(100);
                    end;
                'N':begin
                    univ:=true;
                    contin2:=false;
                   end;
               end;
               until(univ=true);
             end;
             if (cnt>0) then
              begin
               gotoxy(25,15);write('Pulse cualquier tecla para');
               gotoxy(25,16);write('continuar');
               cur;readkey;
               delay(1000);
               clrscr;
               gotoxy(25,6);verde;write('Buscar - Claves v1.0');blanco;
               gy:=8;
               for cnt:=1 to cnt do
                begin
                  gotoxy(25,gy);write('Sitio:   ',resultados[cnt]);
                  inc(gy);
                  gotoxy(25,gy);write('Usuario: ',resultadon[cnt]);
                  inc(gy);
                  gotoxy(25,gy);write('Clave:   ',resultadoc[cnt]);
                  gy:=gy+2;
               end;
               ym:=gy+1;
               gx:=21;
               azul;
               gotoxy(20,4);write(chr(218));
               gotoxy(60,4);write(chr(191));
               gotoxy(20,ym);write(chr(192));
               gotoxy(60,ym);write(chr(217));
               for ct:=1 to 39 do
                begin
                 gotoxy(gx,4);write(chr(196));
                 gotoxy(gx,ym);write(chr(196));
                 inc(gx);
               end;
               cy:=gy-4;
               gry:=5;
               for cy:=1 to cy do
                begin
                 gotoxy(20,gry);write(chr(179));
                 gotoxy(60,gry);write(chr(179));
                 inc(gry);
               end;
               blanco;
               univ:=false;
               contin2:=false;
               gotoxy(17,2);azul;write(#24#25);blanco;write(' Mover la hoja  ');azul;write('N');blanco;write(' para nuevo  ');
               azul;write('ESC');blanco;write(' para volver');
               gotoxy(20,(ym+1));verde;write('              Codigos v1.0');blanco;
               cry:=1;
               repeat
                gotoxy(80,cry);g:=Readkey;
                case upcase(g) of
                 #27:begin
                    univ:=true;
                    contin2:=true;
                    acceder:=true;
                    delay(100);
                    end;
                'N':begin
                    univ:=true;
                    contin2:=false;
                    end;
                 #72:begin                               {arriba}
                     if (cry=1) then
                      begin
                      end;
                     if (cry>1) then
                      begin
                       cry:=cry-1;
                     end;
                     end;
                 #80:begin                               {abajo}
                     if (cry=ym+3) then
                      begin
                     end;
                     if (cry>0) and (cry<ym+3) then
                      begin
                       inc(cry);
                     end;
                     end;
                end;
               until(univ=true);
            end;
           until(contin2=true);
          end;
       {----------------------------------------}
       end;
     end;
    end;
    end;
 {-------------------------------------------------------------------------------------------}

 {Edicion}
 'E':begin
     delay(200);
     clrscr;
     recuadro;
     recuadronom;
     gotoxy(25,7);verde;write('E');blanco;write('sciba el nombre de su archvo');
     gotoxy(25,9);verde;write('I');blanco;write('ngrese el nombre: ');
     {lectura del nombre del arhivo y posterior asignacion de archivos}
     gotoxy(31,12);readln(dat);
     {creacion}
      carp:='C:\Claves\Data\'+dat+'_dat';
      opt:=carp+'\'+dat+'opt'+'.'+'opt';
      dato:=carp+'\'+dat+'.'+'dat';
      acft:=carp+'\'+dat+'acf'+'.'+'acfr';
      {..............................................................}
     {lectura de contraseña}
     for x:=1 to 3 do
      begin
      assign(optarch,opt);{carga las opciones}
      reset(optarch);
      accsn:=0;
      y:=30;
      clrscr;
      recuadro;
      gotoxy(25,6);verde;write('Editar Archivo');blanco;
      gotoxy(25,10);write('Ingrese clave para acceder');
      recuadropass;
      for t:=1 to 4 do
       begin
        readln(optarch,cla[t]);
        gotoxy(y,12);accs[t]:=Readkey;
        gotoxy(y,12);write('*');
        inc(y);
        if (accs[t])=(cla[t]) then
         begin
          inc(accsn);
        end;
      end;
      if (accsn=4) then
       begin
        gotoxy(25,14);rojo;write('C');blanco;write('lave ');verde;write('correcta');blanco;write(', pulse');
        gotoxy(25,15);write('cualquier tecla para continuar');
        readkey;
        delay(100);
        clrscr;
        x:=3;
        acceder:=true
      end;
      if (accsn<>4) and (x<>3) then
       begin
        gotoxy(25,14);rojo;write('C');blanco;write('lave incorrecta, pulse cualqu-');
        gotoxy(25,15);write('ier tecla para continuar');
        cur;
        readkey;
        delay(100);
      end;
      if (accsn<>4) and (x=3) then
       begin
        gotoxy(25,14);rojo;write('U');blanco;write('sted se ha equivocado tres veces');
        gotoxy(25,15);                       write('presione una tecla para volver  ');
        gotoxy(25,16);                       write('al menu');
        cur;
        readkey;
        clrscr;
      end;
     close(optarch);
     end;
     {-------------------------------------------------------------------------------}
     while(acceder=true) do
      begin
       clrscr;
       {empieza}
       assign(archivo,dato);{carga los datos}
       reset(archivo);
       assign(acf,acft);   {carga las conf}
       reset(acf);
       y:=6;
       readln(acf,lim);
       for n:=1 to lim do
        begin
         readln(archivo,sit[n]);
         gotoxy(22,y);write(n,'.');

         gotoxy(25,y);write('Sitio:   ',sit[n]);
         inc(y);
         readln(archivo,texto[n]);
         gotoxy(25,y);write('Usuario: ',texto[n]);
         inc(y);
         readln(archivo,cont[n]);
         gotoxy(25,y);write('Clave:   ',cont[n]);
         y:=y+2;
       end;
       close(archivo);
       close(acf);
       goty:=y+1;
       goy:=1;
       gotx:=21;
       yl:=5;
       azul;
       gotoxy(20,4);write(chr(218));
       gotoxy(60,4);write(chr(191));
       gotoxy(20,goty);write(chr(192));
       gotoxy(60,goty);write(chr(217));
       for c:=1 to 39 do
        begin
         gotoxy(gotx,4);write(chr(196));
         gotoxy(gotx,goty);write(chr(196));
         inc(gotx);
       end;
       cant:=y-4;
       for c:=1 to cant do
        begin
         gotoxy(20,yl);write(chr(179));
         gotoxy(60,yl);write(chr(179));
         inc(yl);
       end;
       blanco;
     gotoxy(9,2);azul;write(#24#25);blanco;write(' Mover la hoja  ');azul;write('N');blanco;write(' para nueva entrada  ');azul;write('C');blanco;write(' para cambiar contrasena  ');
     gotoxy(35,3);azul;write('ESC');blanco;write(' para salir');
     gotoxy(20,(goty+1));verde;write('              Codigos v1.0');blanco;
     for acp:=1 to 99999999 do
      begin
       gotoxy(80,goy);v:=Readkey;
       case upcase(v) of

         {para agregar nuevo dato AL FINAL del archivo}
        'N':begin
            repeat
             contin:=false;
             contin2:=false;
             clrscr;
             recuadro;
             gotoxy(25,6);verde;write('Nueva entrada');blanco;
             gotoxy(21,8);write('Ingrese una nueva entrada al fichero de');
             gotoxy(21,9);write('claves, esta tomara el ultimo lugar en ');
             gotoxy(21,10);write('la lista.');
             gotoxy(25,13);write('Sitio:   ');
             gotoxy(25,14);write('Usuario: ');
             gotoxy(25,15);write('Clave:   ');
             gotoxy(35,13);readln(sit[n]);
             gotoxy(35,14);readln(texto[n]);
             gotoxy(35,15);readln(cont[n]);
             delay(800);
             gotoxy(25,18);write('Estas seguro S/N');
             repeat
              cur;opc:=readkey;
              if opc='s' then
               begin
                opc:='S';
              end;
              if opc='n' then
               begin
                opc:='N';
              end;
              if (opc='S') or (opc='N') then
               begin
                contin:=true;
              end;
             until(contin=true);
              if opc='S' then              {como ya se eligio, se asignan pasos a teclas}
               begin
                ok:=true;
              end;
              if opc='N' then
               begin
                contin:=false;
                ok:=false;
                gotoxy(25,18);write('                       ');
                gotoxy(29,22);azul;write('V');blanco;write('  volver  ');azul;write('R');blanco;write('  repetir');
                repeat
                 cur;opc:=readkey;
                 case upcase(opc) of
                  'V':begin
                      contin:=true;
                      ok:=false;
                      contin2:=true;
                      acp:=99999999;
                      end;
                  'R':begin
                      contin:=true;
                      contin2:=false;
                      end;
                  end;
                until(contin=true);
              end;
            while (ok=true) do
             begin
              {parte automatica}
              assign(archivo,dato);{carga los datos}
              append(archivo);
              writeln(archivo,sit[n]);
              writeln(archivo,texto[n]);
              writeln(archivo,cont[n]);
              close(archivo);
              assign(acf,acft);   {carga las conf}
              reset(acf);
              readln(acf,lim);
              lim:=lim+1;
              close(acf);
              rewrite(acf);
              writeln(acf,lim);
              close(acf);
              gotoxy(25,18);write('                       ');
              gotoxy(30,22);azul;write('V');blanco;write('  volver  ');azul;write('N');blanco;write('  nuevo');
                repeat
                 contin:=false;
                 cur;opc:=readkey;
                 case upcase(opc) of
                  'V':begin
                      contin:=true;
                      ok:=false;
                      contin2:=true;
                      acp:=99999999;
                      end;
                  'N':begin
                      contin:=true;
                      contin2:=false;
                      ok:=false;
                      end;
                  end;
                until(contin=true);
            end;
            until(contin2=true);
            end;
            {ya termino}
            ////////////////////////////////////////////////////////

        'C':begin
            acp:=99999999;
            clrscr;
            recuadro;
            assign(optarch,opt);{carga las opciones}
            reset(optarch);
            accsn:=0;
            y:=30;
            gotoxy(25,6);verde;write('Cambiar contrasena');blanco;
            gotoxy(22,9);write('Ingrese clave original');
            recuadropass;
            for t:=1 to 4 do
             begin
              readln(optarch,cla[t]);
              gotoxy(y,12);accs[t]:=Readkey;
              gotoxy(y,12);write('*');
              inc(y);
              if (accs[t])=(cla[t]) then
               begin
                inc(accsn);
              end;
            end;
            delay(500);

            {si contraseña es correcta}
            close(optarch);
            if (accsn=4) then
             begin
              repeat
              gotoxy(22,9);write('Ingrese nueva clave      ');
              recuadropass2;
              contin:=false;
              y:=40;
              for t:=1 to 4 do
               begin
                gotoxy(y,12);clac[t]:=Readkey;
                gotoxy(y,12);write('*');
                inc(y);
              end;
              gotoxy(22,15);write('Estas seguro de la nueva clave S/N');
              repeat
               cur;v:=readkey;
               if v='s' then
                begin
                 v:='S';
                 contin:=true;
                 contin2:=true;
               end;
               if v='n' then
                begin
                 v:='N';
                 contin:=true;
                 gotoxy(40,12);write('    ');
                 gotoxy(22,15);write('                                   ');
               end;
              until(contin=true);
             until(contin2=true);
             assign(optarch,opt);{carga las opciones}
             rewrite(optarch);
             for t:=1 to 4 do
              begin
               (cla[t]):=(clac[t]);
               writeln(optarch,cla[t]);
             end;
             close(optarch);
             delay(1000);
             gotoxy(22,18);write('Proceso completo!');
             gotoxy(22,19);write('Pulse cualquier tecla para continuar');
             cur;readkey;
             delay(200);
             acceder:=false;
             clrscr;
            end;
            {si clave es falsa}
            if (accsn<>4) then
             begin
              clrscr;
              recuadro;
              gotoxy(25,6);verde;write('Cambiar contrasena');blanco;
              gotoxy(22,8);write('Clave incorrecta');cur;
              delay(2000);
              gotoxy(22,10);write('Pulse cualquier tecla para continuar');cur;
              readkey;
              delay(200);
              acceder:=false;
              clrscr;
            end;
            end;
        #72:begin                               {arriba}
            if (goy=1) then
              begin
               acp:=acp-1;
            end;
            if (goy>1) then
             begin
              goy:=goy-1;
            end;
            end;
        #80:begin                               {abajo}
            if (goy=goty+3) then
             begin
              acp:=acp-1;
            end;
            if (goy>0) and (goy<goty+3) then
             begin
              inc(goy);
            end;
            end;


          ////////////////////////////////////////////////////OCULTO///////////////////////////////////////////////////
            {editar entrada}
        '¬':begin
            gotoxy(1,2);write('                                                                            ');
            gotoxy(20,2);write('Ingrese el numero que desea');
            gotoxy(20,3);write('editar, ingrese 0 para volver');
            gotoxy(55,2);textcolor(red);readln(n);textcolor(white);
            if (n=0) then
             begin
              o:='n';
              acp:=99999999;
            end;
            if (n>0) then
             begin
              o:='y';
            end;

            while (o='y') do
             begin
              clrscr;
              recuadro;
              t:=n;
              gotoxy(25,6);verde;write('Editando entrada ',n);blanco;
              assign(archivo,dato);{carga los datos}
              reset(archivo);
              for n:=1 to n-1 do
               begin
                readln(archivo,sit[n]);
                readln(archivo,texto[n]);
                readln(archivo,cont[n]);
              end;
              n:=t;
              readln(archivo,sit[n]);
              readln(archivo,texto[n]);
              readln(archivo,cont[n]);
              gotoxy(22,8);write('Original :');
              gotoxy(25,9);write('Sitio:   ',sit[n]);
              gotoxy(25,10);write('Usuario: ',texto[n]);
              gotoxy(25,11);write('Clave:   ',cont[n]);
              gotoxy(22,13);write('Original :');
              n:=t;
              close(archivo);
              contin:=false;
              contin2:=false;
              repeat
                rewrite(archivo);
                gotoxy(25,14);write('Sitio:   ');readln(sit[n]);
                gotoxy(25,15);write('Usuario: ');readln(texto[n]);
                gotoxy(25,16);write('Clave:   ');readln(cont[n]);
                writeln(archivo,sit[n]);
                writeln(archivo,texto[n]);
                writeln(archivo,cont[n]);
                close(archivo);
                delay(2000);
                gotoxy(25,18);write('Estas Seguro S/N');
                repeat
                o:=ReadKey;
                case upcase(o) of
                 'S':begin
                     contin:=true;
                     contin2:=true;
                     o:='N';
                     end;
                 'N':begin
                     gotoxy(34,14);write('                             ');
                     gotoxy(34,14);write('                             ');
                     gotoxy(34,14);write('                             ');
                     contin:=false;contin2:=true;
                     end;
                  else
                   begin
                    contin2:=false;
                  end;
                 end;
               until(contin2=true);
              until(contin=true);
              readkey;
            end;
            end;
           //////////////////////////////////////////////////////////////////////////////////////

            {terminar entrada}
        #27:begin                               {esc}
            acp:=99999999;
            delay(200);
            clrscr;
            acceder:=false;
            end;
         end;
     end;
     end;
     {---------------------------termina el while}
     end;
 {-------------------------------TERMINA EDITAR-------------------------------------------------}

 {borrar}
 'B':begin
     delay(200);
     clrscr;
     recuadro;
     recuadronom;
     gotoxy(25,7);verde;write('E');blanco;write('sciba el nombre de su archvo');
     gotoxy(25,9);verde;write('I');blanco;write('ngrese el nombre: ');
     {lectura del nombre del arhivo y posterior asignacion de archivos}
     gotoxy(31,12);readln(dat);
     {creacion}
      carp:='C:\Claves\Data\'+dat+'_dat';
      opt:=carp+'\'+dat+'opt'+'.'+'opt';
      dato:=carp+'\'+dat+'.'+'dat';
      acft:=carp+'\'+dat+'acf'+'.'+'acfr';
      {..............................................................}
     {lectura de contraseña}
     assign(archivo,dato);
     assign(acf,acft);
     for x:=1 to 3 do
      begin
      assign(optarch,opt);
      reset(optarch);
      accsn:=0;
      y:=30;
      clrscr;
      recuadro;
      gotoxy(25,6);verde;write('Borrar archivo');blanco;
      gotoxy(25,10);write('Ingrese clave para borrar');
      recuadropass;
      for t:=1 to 4 do
       begin
        readln(optarch,cla[t]);
        gotoxy(y,12);accs[t]:=Readkey;
        gotoxy(y,12);write('*');
        inc(y);
        if (accs[t])=(cla[t]) then
         begin
          inc(accsn);
        end;
      end;
      if (accsn=4) then
       begin
        gotoxy(25,14);rojo;write('C');blanco;write('lave ');verde;write('correcta');blanco;write(', este proceso');
        gotoxy(25,15);write('es irremediable, esta seguro ');write('S/N');blanco;
        repeat
        cur;g:=Readkey;
        if g='n' then
         begin
          g:='N';
        end;
        if g='s' then
         begin
          g:='S';
        end;
        case g of
         'S':begin
             contin3:=true;
             acceder:=true;
             x:=3;
             delay(100);
             clrscr;
             end;
         'N':begin
             contin3:=true;
             acceder:=false;
             x:=3;
             delay(100);
             clrscr;
             end;
         else
          begin
          contin3:=false;
         end;
        end;
        until(contin3=true);
      end;
      if (accsn<>4) and (x<>3) then
       begin
        gotoxy(25,14);rojo;write('C');blanco;write('lave incorrecta, pulse cualqu-');
        gotoxy(25,15);write('ier tecla para continuar');
        cur;
        readkey;
        delay(100);
      end;
      if (accsn<>4) and (x=3) then
       begin
        gotoxy(25,14);rojo;write('U');blanco;write('sted se ha equivocado tres veces');
        gotoxy(25,15);                       write('presione una tecla para volver  ');
        gotoxy(25,16);                       write('al menu');
        cur;
        readkey;
        contin:=true;
        clrscr;
      end;
      close(optarch);
     end;
     while (acceder=true) do
      begin
       porc:=0;
       recuadro;
       gotoxy(25,6);verde;write('Borrar archivo');blanco;
       gotoxy(25,8);write('Borrando, porfavor espere...');
       delay(130);
       gotoxy(27,10);write('Cerrando archivos            ');
       {proceso de borrado}
       for m:=1 to 10 do
        begin
          inc(porc);
          gotoxy(54,8);write(porc,' %');
          delay(13);
       end;
         {cierra el ultimo archivo}
       gotoxy(27,11);write('Borrando caracteristicas     ');
       for m:=1 to 30 do
        begin
          inc(porc);
          gotoxy(54,8);write(porc,' %');
          delay(50);
       end;
       erase(optarch);     {borra el archivo de las claves}
       gotoxy(27,12);write('Borrando configuraciones     ');
       for m:=1 to 40 do
        begin
          inc(porc);
          gotoxy(54,8);write(porc,' %');
          delay(80);
       end;
       gotoxy(27,13);write('Codificando campos binarios  ');
       erase(acf);          {borra las conf y las claves en si}
       erase(archivo);
       for m:=1 to 10 do
        begin
          inc(porc);
          gotoxy(54,8);write(porc,' %');
          delay(20);
       end;
       gotoxy(27,14);write('Borrando carpeta del usuario');
       for m:=1 to 10 do
        begin
          inc(porc);
          gotoxy(54,8);write(porc,' %');
          delay(50);
       end;
       rmdir(carp);
       gotoxy(25,16);write('Por favor espere un momento');
       delay(3000);
       {.........................}
       clrscr;
       recuadro;
       gotoxy(25,6);verde;write('Borrar archivo');blanco;
       gotoxy(25,8);write('Borrado exitoso');
       delay(300);
       gotoxy(25,16);write('Pulse cualquier tecla');
       readkey;
       clrscr;
       acceder:=false;
     end;
     end;
 {-------------------------------------------------------------------------------------------}

 {salir}
 'V':begin
     delay(200);
     contin:=true;
     clrscr;
     end;
 {-------------------------------------------------------------------------------------------}
 else
  begin
   contin:=false;
 end;
 end;
until(contin=true);
end;
{------------------------------O------------------------------}

procedure acercade;
 var
  n:char;
 begin
 clrscr;
 recuadro;
  gotoxy(29,6);verde;write('Acerca de - Claves v1.0');blanco;
  gotoxy(21,7);write('                                       ');
  gotoxy(21,8);write('Programa creado por Pablo Pizarro en D-');
  gotoxy(21,9);write('ev ascal 1.9.2 en Noviembre del 2010.  ');
 gotoxy(21,10);write('Creado por motivos de uso propio (para ');
 gotoxy(21,11);write('almacenar de forma segura todas mis ci-');
 gotoxy(21,12);write('entos de claves de cientos de paginas) ');
 gotoxy(21,13);write('en las que estoy registrado, si quiere-');
 gotoxy(21,14);write('s el codigo fuente manda un correo a:  ');
 gotoxy(21,15);rojo;
               write('pablopizarro9@gmail.com');blanco;
                                       write(' con el tema de');
 gotoxy(21,16);write('programa, espero que te haya gustado y ');
 gotoxy(21,17);write('recuerda descargar las actualizaciones ');
 gotoxy(21,18);write('que voy subiendo a menudo, hasta luego!');
 gotoxy(23,22);  write('Pulsa ');azul;write('Esc');blanco;write(' para volver al menu inicio');
 repeat
  cur;n:=readkey;
 until(n=#27);
 delay(200);
 clrscr;
end;

{Inicio del programa}
var
 opc:char;
 salir:boolean;
begin
inicio;
clrscr;
repeat
 recuadro;
 menuini;
  cur;opc:=Readkey;
  delay(200);
  case upcase(opc) of
   'I':begin
       principal;
       end;
   'A':begin
       acercade;
       end;
   'C':begin
       salir:=true;
       sound(2);
       end;
   else
    begin
     salir:=false;
   end;
  end;
 until(salir=true);
end.
