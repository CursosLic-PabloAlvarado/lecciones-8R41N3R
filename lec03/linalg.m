#!/usr/bin/octave-cli

## Cargue los datos en el archivo 'escazu'.dat
D=load("escazu.dat");

## Extraiga la columna de áreas y precios
x=D(:,1);
y=D(:,4);
## Extraiga min-max de áreas y precios
minArea = min(x);
minPrecio = min(y);
maxArea = max(x);
maxPrecio = max(y);

## Use las ecuaciones normales para calcular los parámetros de
## regresión lineal
X = [ones(rows(x),1),x];
theta = pinv(X'*X)*X'*y;
disp(theta);

## Grafique los puntos originales y la recta de regresión lineal con
## al menos 100 puntos


## ¿Cómo podemos modificar lo anterior para hacer una regresión
## polinomial?


