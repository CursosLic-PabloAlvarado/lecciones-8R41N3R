## EL5857 Aprendizaje Automático
## (C) 2022 Pablo Alvarado
## Material para la Lección 04

## En esta práctica se deberán calcular y graficar algunas
## probabilidades de letras en palabras de 5 letras en español.

## Cargar todas las palabras de 5 letras como un cell array
fid=fopen("palabras5ascii.txt");
O=textscan(fid,'%s');
fclose(fid);

## Por algún motivo, a todas las palabras excepto la última se les
## pone un espacio al final.  La siguiente línea pega todas las
## palabras en una sola línea, donde cada palabra ocupa 6 caracteres,
## siendo el último un espacio.
S=[double(strjoin({O{1,1}{:}})) 32];

## Esto transforma las palabras cada una en una fila de D.  Se recorta
## la última columna de espacios.
D=reshape(S,6,length(S)/6)'(:,1:5);


