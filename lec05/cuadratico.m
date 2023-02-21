#!/usr/bin/octave-cli --persist

## (C) 2023 Pablo Alvarado
## EL5857 Aprendizaje Automático
## Escuela de Ingeniería Electrónica
## Tecnológico de Costa Rica

1;

## Crea datos de referencia ideales

x1=1:1000;
x2=1:800;

[xx1,xx2]=meshgrid(x1,x2);

## Matriz de datos de referencia (ground truth)
Xgt = [xx1(:),xx2(:)];

## Construcción de función cuadrática para el experimento (ajuste empírico)
A=[2 0.1;0.1 1]; B=-1000*[2; 1]; C=100;
f=1e-4;
A=f*A; B=f*B; 

## Evalúe eficientemente x' A x + B' x + C donde x es cada columna de D
ygt = dot(Xgt,Xgt*A',2) + Xgt*B + C;

## Seleccionemos ahora un subset de datos para el experimento
m=1000; # Número de datos de entrenamiento
idx=randperm(rows(ygt),m);
X=Xgt(idx,:);
y=ygt(idx) + randn(m,1)*2; ## Agregue ruido

figure(1,"name","Datos de entrenamiento");
plot3(X(:,1),X(:,2),y,'.');
xlabel("x_1");
ylabel("x_2");
zlabel("y");

## Utilice las ecuaciones normales para obtener una regresión
## cuadrática sobre una rejilla menos densa que la original

partition=25;
px1=linspace(min(x1),max(x1),partition);
px2=linspace(min(x2),max(x2),partition);

[pxx1,pxx2] = meshgrid(px1,px2);

figure(2,"name","Datos donde predecir");
plot3(pxx1(:),pxx2(:),0*pxx1(:),'.');


## Mida el error entre la aproximación obtenida y la referencia
## usando sub2idx como se indica en el enunciado de la tarea.




