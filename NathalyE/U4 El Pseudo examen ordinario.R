#--------EJERCICIO 1
set.seed(123)
data <- data.frame(
  x = c(runif(20, 0, 10), runif(20, 20, 30)),
  y = c(runif(20, 0, 10), runif(20, 20, 30))
)

#---a) Calcula el valor de k óptimo para los datos proporcionados.
data <- scale(data)
View(data)
library("factoextra")
fviz_nbclust(data, kmeans, method="wss")
library(NbClust)
clusters <- NbClust(data,distance = "euclidean",min.nc = 2,max.nc = 10,method = "kmeans",index = "alllong")
#RESPUESTA: K = 2

#---b) Agrega al dataset original los valores del grupo asignado por el algoritmo.
agrupamiento <- kmeans(data,2)
agrupamiento$cluster

set.seed(123)
data <- data.frame(
  x = c(runif(20, 0, 10), runif(20, 20, 30)),
  y = c(runif(20, 0, 10), runif(20, 20, 30))
)


data$cluster <- agrupamiento$cluster
View(data)

#---c) Gráfica los grupos generados por el algoritmo kmeans.
fviz_cluster(agrupamiento, data = data)

#---d) ¿Cuál es el propósito del algoritmo k-means?
# RESPUESTA: Su propósito es organizar los datos en grupos o clusters, tratando de agruparlos según la posible relación que tengan entre ellos.

#---e) ¿Qué significa el parámetro 'k' en el algoritmo k-means?
# RESPUESTA: "k" significa el número de grupos o clusters más óptimo para los datos proporcionados de un dataset


#------------EJERCICIO 2
set.seed(456)
data2 <- data.frame(
  x1 = c(rnorm(30, 0, 2), rnorm(30, 5, 2)),
  x2 = c(rnorm(30, 0, 1), rnorm(30, 5, 1)),
  x3 = c(rnorm(30, 0, 3), rnorm(30, 5, 3)),
  x4 = c(rnorm(60, 10, 2)),
  x5 = c(rnorm(60, -5, 1))
)

#---a) Realiza la reducción de dimensionalidad utilizando PCA.
pca <- prcomp(data2, center = TRUE, scale = TRUE)
pca
summary(pca)

PC1 <-apply(pca$rotation[,1]*data2, 1 , sum)
PC2 <-apply(pca$rotation[,2]*data2, 1 , sum)
PC3 <-apply(pca$rotation[,3]*data2, 1 , sum)
PC4 <-apply(pca$rotation[,4]*data2, 1 , sum)
PC5 <-apply(pca$rotation[,5]*data2, 1 , sum)

datospca <- data.frame(cbind(PC1,PC2,PC3,PC4, PC5))
View(datospca)

#b)--- ¿Cuál es la proporción de la varianza explicada por cada componente?
summary(pca)
#RESPUESTA: Proporción de la varianza para cada componente:
#PC1: 0.4271
#PC2: 0.2656 
#PC3: 0.1398 
#PC4: 0.1109 
#PC5: 0.05656

#c)--- ¿Cuántos componentes principales deberían seleccionarse si se desea explicar al menos el 95% de la varianza total de los
#datos?

# RESPUESTA: Todos los componentes deben de seleccionarse es decir 5 componentes,para explicar al menos el 95% de la varianza total de los 
#datos, de lo  contrario no dará el porcentaje deseado, si se llegase a dejar hasta la columna 4 entonces solo sería el 94%

#d)--- Añade los componentes seleccionados al dataset original.
data2 <- cbind(data2, PC1, PC2, PC3, PC4, PC5)
View(data2)