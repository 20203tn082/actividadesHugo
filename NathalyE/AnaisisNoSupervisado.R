# K-means  se debe normalizar o escalar
#Es un método de aprendizaje no supervisado que se basa en agrupación de custrs por partición (partitioning clustering)

#OBJETIVO Particionar n objetos en k clusters, donde cada objeto pertenece a un cluster con la media más cercana.

#NOTA: A diferencia de KNN, en K-means no se conoce la clasificación previamente. Por eso se llama no supervisado
#y se cambia el concepto de clasficación por AGRUPAMIENTO.

#Este método requiere que se determine previamente el número de clusters.

#Para el ejempo de clase, usaremos el dataset USArrests que contiene información de varios crímenes realizados
#en ciudades de Estados Unidos.

#Utilizaremos K-means para generar agrupamientos en los datos y encontrar la relación entre los
#elementos de cada clúster para nombrarlos.

#PASOOOOOS
#1. Cargar los datos del dataset
datos <- USArrests
View(datos)

#2. Escalar los datos
#Se requiere al igual que en KNN

datos <- scale(datos)

#Si quiero normalizar las primeras tres clumnas
# datos <- scale(datos[,1:3])
# datos2 <- scale(datos[,c(2,4)])

#Transformación de dats.
#Generalización
#Reescalamiento
#Normalización

#3. Determinar número de clústers
#Existen distintos métodos para calcular el número de clústers: Elbow(WSS, Within-clúster sum square),
#silhoutte, gap_stat, etc.

#En R, existen varias librerías con funciones para calcular este número de clústers.Usaremos factoextra

install.packages("factoextra")
library("factoextra")

#datos, algoritmo y metodo

#esta librería contiene la función fviz_nbclust que permite calcular la cantidad de clústers
#utiizando métodos distintos. Se requieren 3 parámetros:

#fviz_nbclust(dataframe, funcion para agrupamiento, metodo)
#weighted sum squares

fviz_nbclust(datos, kmeans, method="wss")
#en wss o Elbow, se elige el número de clústers por el vaor que se encuentra en el "codo de la gráfica"
#Aunque la imaginación no ayude, está en el 2 ;)
fviz_nbclust(datos, kmeans, method = "silhouette")
fviz_nbclust(datos, kmeans, method = "gap_stat")

#En silhouette y gap_stat, la cantidad de clusters se marca en la grafica

#Con este es más de un métdo

#OPCIONAL: En la librería NbClust existe una función con el mismo nombre, que permite calcular la cantidad 
#de clusters utilizando múltiples métodos.
#Esta función devuelve la cantidad de custers que hayan arrojado la mayor cantidad de métodos

install.packages("NbClust")
library(NbClust)

#min.nc es la cantidad minima de clusters
#max.nc es a cantidad maxima de clusters
#method es el algoritmo a utilizar
#index indica que métodos para el cálculo de cantidad de clusters se usarán. along es para TODOS
#los que conoce la función.

clusters <- NbClust(datos,distance = "euclidean",min.nc = 2,max.nc = 10,method = "kmeans",index = "alllong")

#4 realizar el agrupamiento 
#Una vez determinada la cantidad de clusters se utiliza la función kmeans. No se requiere cargar una ibrería, 
#pertenece al core de R.
#Requiere 2 parámetros: kmeans(dataframe, cantidad de clusters)

agrupamiento <- kmeans(datos,2)
agrupamiento$cluster

#Agrupamiento contiene, entre otras cosas, el cluster al que pertenece cada elemento(agrupamiento$custer)

#Para visualizar los clusters creados, podemos utilizar la función viz_cluster
#Requiere al menos dos parametros: el resultado de kmeans y e dataframe

fviz_cluster(agrupamiento, data = datos)

#Se pueden añadir opciones adicionales para modificar la visualización de la gráfica
fviz_cluster(agrupamiento, data = datos, ellipse.type = "euclid", start.plot = TRUE)

fviz_cluster(agrupamiento, data = datos, ellipse.type = "norm")

fviz_cluster(agrupamiento, data = datos, ellipse.type = "norm", palette = "Set2", ggtheme = theme_minimal())


#Asignar nombres a los clusters
#Si se analizan los datos de los estados y los niveles de crimen, podemos llegar
# a la conclusión de que a un cluster pertenecen los esados "más violentos" y al otro
# "los menos violentos"

#NOTA: si se requieren agregar los clusters a los datos originales, basta con realizar lo siguiente:

datos <- USArrests
datos$cluster <- agrupamiento$cluster
View(datos)

#1 = más violentos, 2 = menos violentos
datos$cluster <- ifelse(datos$cluster == 1, "más violentos", "menos violentos")
View(datos)
                        
#EJERCICIO 
#Carga los datos del archivo taipei_hotel1.csv
#que encontrarás en la carpeta Contenido en Drive.
#Este archivo contiene información de hoteles en 
#la ciudad de Taipei: dirección, coordenadas geográficas

# latitud y longitud para el agrupamiento
#cada hotel va a pertenecer a un grupo
#calcular valor de K entre 5 o algo así
#Mismo taipei pero con la columna de cluster

setwd("")
datos <- read.csv("taipei_hotel1.csv")

#el 2 al COLUMA DE DISTRITO

