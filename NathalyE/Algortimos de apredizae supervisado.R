#Algortimos de apredizae supervisado
#Se dividen en 2 tareas: prediccion (regresion)

View(iris)
datos <- iris
View(datos)

#Verifica que el da set sea un data frame
class(datos)

#datos <- as.data.frame(datos) para convertirlo en data frame

#Un nuevo objeto sacar las caracteristicas asignarles una nueva clasificación de las que ya se encuentran en el data set
#etiquetas que ya tienes
#regresión valor que vas a calcular a partir de unos datos de entrada


#verificar que la columna de clasificación sea un factor si no es factor causa problema, siempre se debe poner en factor la columna de categoria
class(datos$Species)
#datos$Species <- as.factor(datos$Species) Convertirlo en factor

#reajustar el máximo y minimo de una columna 
#normalizar para la misma importancia

#los algoritmos de clasificación son sensibles a los cambios de magnitud de las variables
#es necesario escalar
#datos$Sepal.Length
#     <-scale(datos$Sepal.Length)
#reescalamiento de 0 a 1 pero con más de una columna = normalización va de una cantidad negativa a una positiva
datos[,1:4] <- scale(datos[,1:4])
View(datos)
  
#80/20, 70/30

#importante
#de mis observaciones se le debe de dar una cantida para que aprenda osea el 70 u 80%
#el resto es de prueba para verificar que aprendió bien

#Si tienes un data set de 150 observaciones
#120 son de entrenamiento
#30 son de prueba

#floor redonder hacia abajo

tam_train <- floor(0.8 * nrow(datos)) #120 redonde hacia abajo

#extraer a cantidad de elementos calculada (120) de conjunto de datos original
#funcion sample: obtiene una muestra (algunos elementos) aleatoria de un conjunto de datos
#funcion seq_len : generar enteros desde 1 hasta la cantidad que indiques
#generar una secuencia de enteros de 1 al 150
secuencia <- seq_len(nrow(datos))
class(secuencia)

#elige 120 números de la secuencia que son los datos de entrenamiento
indices_train <- sample(secuencia, size = tam_train)

#el data set de entrenamiento y prueba no deben contena columna de casficacón
#AHORA SÍ SACÓ LAS FLAS
datos_train <- datos[indices_train, 1:4] #PARA ENTRENAR el 120
datos_test <- datos[-indices_train, 1:4] #datos prueba
clase_train <- datos[indices_train, 5] #el otro 20 %
clase_test <- datos[-indices_train, 5]


dim(datos_train)
class(clase_train)

#Se crea el modelo de clasificación la función knn de la librería class
#


install.packages("class")
library("class")

#conjunto de entrenamiento
#Conjunto de prueba
#Clasificación del conjunto de entrenamient
#El valor de K (cuantos vecinos)
#k = cantidad de observaciones / 2 X
#k = sqrt(cantidad de observaciones) es decir, raíz cuadrada de las observaciones
# k se recomienda impar
# el resultado de ejecutar knn es a clasificación de los vaores de entrenamiento
clasificacion <- knn(datos_train, datos_test, clase_train, k = sqrt(nrow(datos))) #clasifici

#ahora se deen comparar con os datos de prueba
View(datos_test)
datos_test_clasificacion <- datos_test

#datos de prueba con la clasificación igual de prueba que realizo gracias knn, 
#el 20% de prueba sacar su clasificación con esos datos
datos_test_clasificacion$Clase <- clasificacion
View(datos_test_clasificacion)

install.packages("ggplot2")
library("ggplot2")


ggplot(datos_test_clasificacion,
       aes(x=Sepal.Length, y=Sepal.Width, 
           color=Clase,fill=Clase))+
  geom_point(size=7)+
  geom_text(aes(label=Clase)) + 
  theme(legend.position = "none")

#Verificar que tal hizo las casificaciones
#Matriz de confusión
#Tabla de tidis contra todos
tab <- table(clasificacion, clase_test)
diag(tab)
rowSums(tab)

#val.clasificados correctamente /total val.clasificados
#accuracy
#esto realmente te dice cuanto aprendió en número 
accuracy <- function(tabla){
  sum(diag(tabla) /sum(rowSums(tabla)))*100
}
accuracy(tab)
