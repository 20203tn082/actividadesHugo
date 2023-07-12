## K-MEANS ##
#Es un método de aprendizaje no supervisado que se basa en agrupación de clusters por partición
#(partitioning clustering)

#OBJETIVO: Particionar n objetos en k clusters, donde cada objeto pertenece a un cluster con la media más cercana

#NOTA: A diferencia de KNN, en K-MEANS no se conoce la clasificación previamente. Por eso, se llama no supervisado
#y se cambia el concepto de clasificación por AGRUPAMIENTO

#Este método requiere que se determine previamente el número de clusters

#Usar el dataset USArrests
#contiene info de varios crímenes realizados
USArrests
View(USArrests)

#Utilizar k-means para generar agrupamientos 
#en los datos y encontrar la relación entre los elementos de cada clúster

datos <- USArrests

#Generalización
#Ej: ordenar datos de menor a mayor y particionar por alto, medio, bajo

#Re escalamiento
#Consiste en cambiar la escala de los datos de un dataset
#se trata de una sola columna
#Ej: edad 0 - 100
#ingreso 0 - 56x10^10, se trata de hacer los datos más pequeños en cuestión de escala como 0-10

#Normalización
#Se trata de re-escalar más de una columna, deja los valores entre un valor negativo y un positivo
#se realiza de acuerdo a todas las columnas, para que todos los valores tengan un estándar

#2. Escalar los datos
#Se requiere al igual que en KNN. Debemos aplicar normalización, le envíamos el dataset completo
datos <- scale(datos)

#ej: dato <- scale(datos[,1:3])
#ej: dato <- scale(datos[,c(2,4)])
View(datos)

#3. Determinar el número de clústers
#Existen distintos métodos para calcularr el número 
#de clústers: Elbow (WSS, Within-cluster sum square)
#silhouette, gap_stat, etc

#En R, existen varias librerías con funciones para calcular este número de clústers
#usaremos factoextra
install.packages("factoextra")
library("factoextra")

#"Esta librería contiene la función fviz_nbclust que permite calcular la cantidad
#de clústers utilizando métodos distintos. Se requieren 3 parámetros:

#fviz_nbclust(dataframe, función para agrupamiento, método)
fviz_nbclust(datos, kmeans, method="wss")

#En WSS o Elbow, se elige el número de clústers por el valor que se encuentra
#en el "codo" de la gráfica. Aunque la imaginación no ayude, está en el #2 
fviz_nbclust(datos, kmeans, method="silhouette")
fviz_nbclust(datos, kmeans, method="gap_stat")
#En silhouette y gap_stat, la cantidad de clústers se marca en la gráfica

#OPCIONAL: en la librería Nbclust existe una función con el mismo nombre, que permite
#calcular la cantidad de clusters utilizando múltiples métodos
#Esta función devuelve la cantidad de clusters que hayan arrojado la mayor cantidad 
#de métodos
install.packages("NbClust")
library("NbClust")

# min.nc es la cantidad mínima de clusters
# max.nc es la cantidad máxima de clusters
# method es el algoritmo a utilizar
#index indica qué métodos para el cálculo de cantidad de clusters se usaron,
# alllong es para TODOS los que conoce la función
#lo de distance se refiere a la forma en que calcula la distancia
clusters <- NbClust(datos, distance="euclidean", min.nc = 2, max.nc = 10, method ="kmeans",
                    index = "alllong")

#4. Realizar agrupamiento
#Una vez determinada la cantidad de clusters, se utiliza la función kmeans
#No se requiere cargar una librería, pertenece a R
#kmeans(dataframe, cantidad de clusters)
agrupamiento <- kmeans(datos,2)

#agrupamiento contiene, entre otras cosas, el cluster al que pertenece cada elemento
#(agrupamiento$cluster)

#Para visualizar los clusters creados, podemos utilizar la función fviz_cluster
#Requiere al menos dos parámetros: el resultado de kmeans y el dataframe
fviz_cluster(agrupamiento, data = datos)

#Se pueden añadir opciones adicionales para modificar la visualización de la gráfica
#norm es una forma ovalada
#euclid muestra las líneas de las distancias
fviz_cluster(agrupamiento, data = datos, ellipse.type = "euclid", star.plot = TRUE)
fviz_cluster(agrupamiento, data = datos, ellipse.type = "norm")
fviz_cluster(agrupamiento, data = datos, ellipse.type = "norm", palette = "Set2",
             ggtheme = theme_minimal())

#5. Asignar nombres a los clusters
#Si se analizan los datos de los estados y los niveles de crimen, podemos llegar a la
#conclusión de que a un cluster pertenecen los estados "más violentos" y el otro los 
#"menos violentos"


#NOTA: Si se quieren agregar los clusters a los datos originales, basta con realizar
#lo siguiente

#la interpretación se realiza sobre los datos reales
#y se agrega la columna del cluster
datos <- USArrests
datos$cluster <- agrupamiento$cluster

datos$cluster <- ifelse(datos$cluster == 1, "Más violento", "Menos violento")



