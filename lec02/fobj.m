#!/usr/bin/octave-cli --persist

## (C) 2020-2023 Pablo Alvarado
## EL5857 Aprendizaje Automático
## Escuela de Ingeniería Electrónica
## Tecnológico de Costa Rica

## --------------------------------------------------------------------
## Just show the objective function J(theta) in 3D and with 3D contours
## --------------------------------------------------------------------

## Data stored each sample in a row, where the last row is the label
D=load("escazu.dat");

## Rescue for now just the area and price columns
X = [ones(rows(D),1) D(:,1)]; ## Design matrix
Y = D(:,4);                   ## Ground-truth

## Objective function of the parameters theta, requires also the data X,Y.
## - theta holds one configuration set in each row.
## - we use here 'broadcasting' of Y
J=@(theta) 0.5*sum((Y-X*theta').^2,1);

th0=-300:10:300;
th1=0.0:0.05:3;

[tt0,tt1] = meshgrid(th0,th1);

theta=[tt0(:) tt1(:)];
jj=reshape(J(theta),size(tt0));

## Plot the error surface

figure(1,"name","Superficie de error");
hold off;
surf(tt0,tt1,jj);
xlabel('{\theta_0}');
ylabel('{\theta_1}');
zlabel('J({\bf \theta})');

## Plot the contours in 3D

figure(2,'name','Curvas de nivel');
levels= linspace(1.001*min(jj(:)),4e+6,20);
contour3(tt0,tt1,jj,levels,"linewidth",3);
xlabel('{\theta_0}');
ylabel('{\theta_1}');
zlabel('J({\bf \theta})');


view(0,90);

