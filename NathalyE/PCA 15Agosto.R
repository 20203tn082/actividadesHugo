#Supervisado: Predicción y clasificación KNN
# Agrupamiento K-MEANS
#PCA Analisis de componentes
#PCA es un método estadístico que permite simplificar la complejidad de espacios muestrales con muchas dimensiones, conservando la
#misma información
#combinación de columnas para crear columnas nuevas. Se pierde información pero ganas velocidad
# Censo de población

#PCA Principal Component Analysis
# Columnas nuevas que se denominan componentes
#N-1 Componentes
#Cada componente es una función
setwd("")
datos <- USArrests
View(datos)

install.packages("stats")
library("stats")

#PRCOMP - PRINCIPAL  COMPONENT
pca <- prcomp(datos, center = TRUE, scale = TRUE)
pca
summary(pca) # ESTE ES EL QUE DA LA PROPORCIÓN 

PC1 = -0.5358995*datos$Murder-0.5831836*datos$Assault-0.2781909*datos$UrbanPop-0.5434321*datos$Rape
PC2 = 0.4181809*datos$Murder+0.1879856*datos$Assault-0.8728062*datos$UrbanPop-0.1673186*datos$Rape
PC3 = -0.3412327*datos$Murder-0.2681484*datos$Assault-0.3780158*datos$UrbanPop+0.8177779*datos$Rape
PC4 = 0.64922780*datos$Murder-0.74340748*datos$Assault+0.13387773*datos$UrbanPop+0.08902432*datos$Rape
View(datos)

PC1 <-apply(pca$rotation[,1]*datos, 1 , sum)
PC2 <-apply(pca$rotation[,2]*datos, 1 , sum)
PC3 <-apply(pca$rotation[,3]*datos, 1 , sum)
PC4 <-apply(pca$rotation[,4]*datos, 1 , sum)

datospca <- data.frame(cbind(PC1,PC2,PC3,PC4))
View(datospca)

summary(pca) #importa la proporción de la varianza Aquí es cuando se decide cuantas columnas se ocupan La proporción siempre arriba de 80 lo mejor arriba de 90

View(datospca[,1:2]) # se dejan las columnas con mayor porcentaje
PC1
PC2
