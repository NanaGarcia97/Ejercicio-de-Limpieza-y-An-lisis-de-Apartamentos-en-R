
R version 4.6.1 (2026-06-24 ucrt) -- "Happy Hop"
Copyright (C) 2026 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> #Subir la bd o el archivo
> df <- read.csv("C:\\Users\\emi_b\\Downloads\\Apartamentos 1.csv", header=TRUE)
> 
> #Ver las primeras filas del archivo
> head(df)
     fecha precio.millones.de.pesos. area.mt2.  zona estrato habitaciones baños
1 13/02/23                        79     43.16 norte       3            3     1
2  2/05/23                        93     56.92 norte       2            2     1
3 17/01/23                       100     66.40 norte       3            2     2
4 15/08/23                       123     61.85 norte       2            3     2
5 11/08/23                       135     89.80 norte       4            3     2
6 19/09/23                       140     71.00 norte       3            3     2
  balcon parqueadero administracion..millones.de.pesos.
1     si          si                              0.050
2     si          si                              0.069
3     no          no                              0.000
4     si          si                              0.130
5     si          no                              0.000
6     no          si                              0.120
  avaluo..millones.de.pesos. remodelado
1                   14.92300         no
2                   27.00000         si
3                   15.73843         no
4                   27.00000         no
5                   39.56700         si
6                   31.14551         si
> #Tipos de Datos
> str(df)
'data.frame':   694 obs. of  12 variables:
 $ fecha                             : chr  "13/02/23" "2/05/23" "17/01/23" "15/08/23" ...
 $ precio.millones.de.pesos.         : num  79 93 100 123 135 140 145 160 160 175 ...
 $ area.mt2.                         : num  43.2 56.9 66.4 61.9 89.8 ...
 $ zona                              : chr  "norte" "norte" "norte" "norte" ...
 $ estrato                           : int  3 2 3 2 4 3 3 3 4 4 ...
 $ habitaciones                      : int  3 2 2 3 3 3 2 3 4 3 ...
 $ baños                             : int  1 1 2 2 2 2 2 2 2 2 ...
 $ balcon                            : chr  "si" "si" "no" "si" ...
 $ parqueadero                       : chr  "si" "si" "no" "si" ...
 $ administracion..millones.de.pesos.: num  0.05 0.069 0 0.13 0 0.12 0.14 0.127 0 0.123 ...
 $ avaluo..millones.de.pesos.        : num  14.9 27 15.7 27 39.6 ...
 $ remodelado                        : chr  "no" "si" "no" "no" ...
> #Datos Faltantes por filas
> sum(is.na(df)) 
[1] 3
> #Datos faltantes por variables
> colSums(is.na(df))
                             fecha          precio.millones.de.pesos. 
                                 0                                  2 
                         area.mt2.                               zona 
                                 0                                  0 
                           estrato                       habitaciones 
                                 0                                  0 
                             baños                             balcon 
                                 0                                  0 
                       parqueadero administracion..millones.de.pesos. 
                                 0                                  1 
        avaluo..millones.de.pesos.                         remodelado 
                                 0                                  0 
> #Filas con NA o faltantes en Precio millones de pesos PMP
>  df[is.na(df$precio.millones.de.pesos.), ]
      fecha precio.millones.de.pesos. area.mt2.     zona estrato habitaciones
595 4/11/23                        NA        40   centro       4            2
690 1/01/23                        NA       180 laureles       5            4
    baños balcon parqueadero administracion..millones.de.pesos.
595     1     si          no                               0.07
690     3     si          si                               0.57
    avaluo..millones.de.pesos. remodelado
595                     41.000         no
690                    233.784         si
> #Filas con NA o faltantes en Administración Admin
>  df[is.na(df$administracion..millones.de.pesos.), ]
       fecha precio.millones.de.pesos. area.mt2.    zona estrato habitaciones
216 30/08/23                       420       100 poblado       6            2
    baños balcon parqueadero administracion..millones.de.pesos.
216     2     no          si                                 NA
    avaluo..millones.de.pesos. remodelado
216                    418.238         si
> #Promedio por zona y estrato para PMP
> aggregate(
+ precio.millones.de.pesos. ~ zona + estrato,
+ data = df,
+ FUN = mean,
+ na.rm = TRUE
+ )
              zona estrato precio.millones.de.pesos.
1       aburra sur       2                  115.3333
2   belen guayabal       2                   75.0000
3            norte       2                  108.0000
4        occidente       2                   68.5000
5        occidente       3                   80.0000
6       aburra sur       3                  145.5164
7   belen guayabal       3                  135.8667
8           centro       3                  100.8125
9            norte       3                  124.8000
10       occidente       3                  154.2727
11       Occidente       3                   90.0000
12       OCCIDENTE       3                   96.0000
13          centro       4                  210.0000
14        aburra s       4                  250.0000
15      aburra sur       4                  211.8036
16 belen  guayabal       4                  180.0000
17  belen guayabal       4                  192.0000
18          centro       4                  149.8947
19        laureles       4                  228.2143
20           norte       4                  156.6667
21       occidente       4                  176.7500
22       Occidente       4                  145.0000
23       OCCIDENTE       4                  143.0000
24         poblado       4                  327.5000
25         POBLADO       4                  240.0000
26        aburra s       5                  275.0000
27      aburra sur       5                  267.9706
28 belen  guayabal       5                  200.0000
29  belen guayabal       5                  210.2143
30          centro       5                  200.0000
31        laureles       5                  329.2745
32        Laureles       5                  326.5000
33        LAURELES       5                  315.0000
34       laureles        5                  410.0000
35       occidente       5                  212.8667
36         poblado       5                  342.7826
37      aburra sur       6                  265.0000
38        laureles       6                  440.0000
39       laureles        6                  508.0000
40         poblado       6                  528.6837
41         Poblado       6                  617.2500
42         POBLADO       6                  337.5000
43        poblado        6                  685.0000
> 
> #Promedio por zona y estrato para Admin
> aggregate(
+ administracion..millones.de.pesos. ~ zona + estrato,
+ data = df,
+ FUN = mean,
+ na.rm = TRUE
+ )
              zona estrato administracion..millones.de.pesos.
1       aburra sur       2                        0.003333333
2   belen guayabal       2                        0.000000000
3            norte       2                        0.099500000
4        occidente       2                        0.000000000
5        occidente       3                        0.088000000
6       aburra sur       3                        0.090440205
7   belen guayabal       3                        0.039580000
8           centro       3                        0.050231250
9            norte       3                        0.087400000
10       occidente       3                        0.092996970
11       Occidente       3                        0.062500000
12       OCCIDENTE       3                        0.035000000
13          centro       4                        0.759100000
14        aburra s       4                        0.170000000
15      aburra sur       4                        0.158473214
16 belen  guayabal       4                        0.000000000
17  belen guayabal       4                        0.125515000
18          centro       4                        0.102335000
19        laureles       4                        0.120142857
20           norte       4                        0.041000000
21       occidente       4                        0.138000000
22       Occidente       4                        0.176500000
23       OCCIDENTE       4                        0.117000000
24         poblado       4                        0.291400000
25         POBLADO       4                        0.440321000
26        aburra s       5                        0.219000000
27      aburra sur       5                        0.207293147
28 belen  guayabal       5                        0.140000000
29  belen guayabal       5                        0.150428571
30          centro       5                        0.503000000
31        laureles       5                        0.231671154
32        Laureles       5                        0.200500000
33        LAURELES       5                        0.230000000
34       laureles        5                        0.530000000
35       occidente       5                        0.195800000
36         poblado       5                        0.330979783
37      aburra sur       6                        0.266200000
38        laureles       6                        0.578500000
39       laureles        6                        0.450000000
40         poblado       6                        0.485693152
41         Poblado       6                        0.464833333
42         POBLADO       6                        0.275500000
43        poblado        6                        0.523300000
> # Promedio especifico de precio en la zona "centro" y estrato 4
> mean(df$precio.millones.de.pesos.[df$zona == "centro" & df$estrato == 4], na.rm = TRUE)
[1] 149.8947
> # Promedio de precio en la zona "laureles" y estrato 5
>  mean(df$precio.millones.de.pesos.[df$zona == "laureles" & df$estrato == 5], na.rm = TRUE)
[1] 329.2745
> 
> # Promedio de específico administración en la zona "poblado" y estrato 6
> mean(df$administracion..millones.de.pesos.[df$zona == "poblado" & df$estrato == 6], na.rm = TRUE)
[1] 0.4856932
> 
> df$precio.millones.de.pesos.[595] <- mean(df$precio.millones.de.pesos.[df$zona == "centro" & df$estrato == 4], na.rm = TRUE)
> 
> df$precio.millones.de.pesos.[690] <- mean(df$precio.millones.de.pesos.[df$zona == "laureles" & df$estrato == 5], na.rm = TRUE)
> 
> df$administracion..millones.de.pesos.[216] <- mean(df$administracion..millones.de.pesos.[df$zona == "poblado" & df$estrato == 6], na.rm = TRUE)
> df[c(595, 690, 216), ]
       fecha precio.millones.de.pesos. area.mt2.     zona estrato habitaciones
595  4/11/23                  149.8947        40   centro       4            2
690  1/01/23                  329.2745       180 laureles       5            4
216 30/08/23                  420.0000       100  poblado       6            2
    baños balcon parqueadero administracion..millones.de.pesos.
595     1     si          no                          0.0700000
690     3     si          si                          0.5700000
216     2     no          si                          0.4856932
    avaluo..millones.de.pesos. remodelado
595                     41.000         no
690                    233.784         si
216                    418.238         si
> sum(duplicated(df))
[1] 0
> boxplot(df$precio.millones.de.pesos.)
> boxplot(df$area.mt2.)
> # Contar número de apartamentos por zona
> table(df$zona)

         centro       occidente        aburra s      aburra sur belen  guayabal 
              1               1               2             167               2 
 belen guayabal          centro        laureles        Laureles        LAURELES 
             65              37              68               2               1 
      laureles            norte       occidente       Occidente       OCCIDENTE 
              2              10              62               3               3 
        poblado         Poblado         POBLADO        poblado  
            253               6               7               2 
> # Visualización básica
> barplot(table(df$zona),
+         main = "Oferta de apartamentos por zona",
+         xlab = "Zona",
+         ylab = "Número de apartamentos",
+         col = "skyblue")
> # Calcular precio promedio por m² en cada zona
> precio_m2 <- tapply(df$precio.millones.de.pesos. / df$area.mt2., df$zona, mean, na.rm = TRUE)
> precio_m2
         centro       occidente        aburra s      aburra sur belen  guayabal 
       1.000000        1.764057        2.664141        2.477916        2.023001 
 belen guayabal          centro        laureles        Laureles        LAURELES 
       2.090690        1.842525        2.374544        2.647069        1.852941 
      laureles            norte       occidente       Occidente       OCCIDENTE 
       2.669212        1.999246        2.124132        2.075096        2.017161 
        poblado         Poblado         POBLADO        poblado  
       3.006569        3.262613        3.028454        3.794506 
> 
> # Visualización
> barplot(precio_m2,
+         main = "Precio promedio por m² según zona",
+         xlab = "Zona",
+         ylab = "Precio promedio (millones)",
+         col = "lightgreen")
> # Gráfico de dispersión área vs precio
> plot(df$area.mt2., df$precio.millones.de.pesos.,
+      main = "Relación entre área y precio",
+      xlab = "Área (m²)",
+      ylab = "Precio (millones)",
+      col = "blue", pch = 19)
> # Calcular porcentaje del avalúo sobre el precio
> df$porc_avaluo <- (df$avaluo..millones.de.pesos. / df$precio.millones.de.pesos.) * 100
> 
> # Promedio por estrato
> porc_avaluo_estrato <- tapply(df$porc_avaluo, df$estrato, mean, na.rm = TRUE)
> porc_avaluo_estrato
       2        3        4        5        6 
26.69146 46.33308 57.05057 63.17589 61.49947 
> 
> # Visualización
> barplot(porc_avaluo_estrato,
+         main = "Porcentaje del avalúo sobre el precio por estrato",
+         xlab = "Estrato",
+         ylab = "Porcentaje (%)",
+         col = "orange")
> q()
> 
