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
datos_train <- datos[indices_train, 1:4] #PARA ENTRENAR
datos_test <- datos[-indices_train, 1:4] #datos prueba
clase_train <- datos[indices_train, 5]
clase_test <- datos[-indices_train, 5]


dim(datos_train)
class(clase_train)

#Se crea el modelo de clasificación la función knn de la librería class
#