## Cargar todas las palabras como un cell array 
O=textread("palabras5ascii.txt",'%s');

numPalabras=rows(O)

## La última palabra no tiene espacio
D=[toascii(strjoin(O)) 32];

## Convertir las palabras en una matriz.  La última columna es de
## espacios, por la conversión.
D=reshape(D,numPalabras,6)(:,1:5);


