## Cargar todas las palabras como un cell array
fid=fopen("palabras5ascii.txt");
O=textscan(fid,'%s');
fclose(fid);

## La última palabra no tiene espacio
S=[double(strjoin({O{1,1}{:}})) 32];

## Convertir las palabras en una matriz.  La última columna es de
## espacios, por la conversión, así que se elimina.
D=reshape(S,6,length(S)/6)'(:,1:5);


