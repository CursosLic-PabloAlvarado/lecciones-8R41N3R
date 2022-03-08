## Lección 08: Aprendizaje Automático

En esta clase se tratará el tema de aprendizaje generativo, tema de la
lección 8, mientras que en la tarea 3 y en el proyecto 1, disponibles
a finales de la semana, se tratará el aprendizaje discriminativo.  Aun
así, algunos principios que usaremos aquí se aplican en la tarea y en
el proyecto.

Usaremos el conjunto de datos de Allison Horst de pingüinos en la
Antártica.

1. En en el archivo gda.m deberá implementar el algoritmo de análisis
   gaussiano discriminador, revisado en la lección 8, para clasificar
   si un determinado dato corresponde a un pingüino hembra o macho.

2. En el archivo gaussnb.m deberá implementar el algoritmo de naïve Bayes
   gaussiano, para hacer la misma clasificación que en el caso anterior.
   
   No hemos visto en la teoría el algoritmo de naïve Bayes gaussiano, pero
   la diferencia es sencilla de comprender: en vez de usar como probabilidad
   p(x|y) la razón de cuántas veces ocurre x cuando el dato es de la clase y, 
   usamos una estimación de esa probabilidad asumiendo que p(x|y) sigue una
   distribución gaussiana, por lo que símplemente tenemos que calcular la
   varianza y la media de esas distribuciones.
   
