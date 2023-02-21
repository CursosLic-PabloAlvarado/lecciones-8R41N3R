## EL5857 Aprendizaje Automático
## (C) 2022 Pablo Alvarado
## Material para la Lección 04

## En esta práctica se deberán calcular y graficar algunas
## probabilidades de letras en palabras de 5 letras en español.

## Cargar todas las palabras de 5 letras como un cell array.
## Ese archivo ha sido limpiado de caracteres extraños como espacios,
## paréntesis, o la letra O.
fid=fopen("palabras5ascii.txt");
O=textscan(fid,'%s');
fclose(fid);

## Por algún motivo, a todas las palabras excepto la última se les
## pone un espacio al final.  La siguiente línea pega todas las
## palabras en una sola línea, donde cada palabra ocupa 6 caracteres,
## siendo el último un espacio.
S=[double(strjoin({O{1,1}{:}})) 32];
## La ñ está codificada como N que no calza en la secuencia.  La vamos
## a pasar al 123 que es '}' después de z
S(S==78)=123;
S=S-double('a');

## Esto transforma las palabras cada una en una fila de D.  Se recorta
## la última columna de espacios.
D=reshape(S,6,length(S)/6)'(:,1:5);

pkg load statistics;


##probabilidad de cada letra
equal=@(x,y) x==y;
p=D(:);
freq=sum(bsxfun(equal,p,0:26),1);
Prob=freq/sum(freq);
##
##probbabilidad de cada letra  en la posicion 1
p1=D(:,1);
freq1=sum(bsxfun(equal,p1,0:26),1);
Prob1=freq1/sum(freq1)
##
##probbabilidad de cada letra  en la posicion 2
p2=D(:,2);
freq2=sum(bsxfun(equal,p2,0:26),1);
Prob2=freq2/sum(freq2)
##
##probbabilidad de cada letra  en la posicion 3
p3=D(:,3);
freq3=sum(bsxfun(equal,p3,0:26),1);
Prob3=freq3/sum(freq3)
##
##probbabilidad de cada letra  en la posicion 4
p4=D(:,4);
freq4=sum(bsxfun(equal,p4,0:26),1);
Prob4=freq4/sum(freq4)
##
##probbabilidad de cada letra  en la posicion 5
p5=D(:,5);
freq5=sum(bsxfun(equal,p5,0:26),1);
Prob5=freq5/sum(freq5)

##probabilidad condicional general de cada letra dado que la anterior es otra letra
prev = permute(D(:,1:4), [1 3 2]); # transponer para que prev tenga tamaño 9528x1x4
curr = permute(D(:,2:5), [1 3 2]); # transponer para que curr tenga tamaño 9528x1x4

numerator = bsxfun(@and, prev == permute(0:25, [1 3 2])+1, curr == permute(0:25, [1 3 2])+1);
denominator = sum(bsxfun(@and, prev == permute(0:25, [1 3 2])+1, ones(9528,1,4)), 1);

condprob = squeeze(sum(numerator, 1)./denominator);
