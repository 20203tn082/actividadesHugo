install.packages("DMwR2")
library("DMwR2")

setwd("C:\\Users\\CC7\\Downloads")
contaminacion <- read.csv("contaminacion.csv",
                     header = TRUE,
                     sep = ",",
                     dec =".")

View(contaminacion)

#Agrupo e registro en categorías y sacó el promedio de esas categorías
kcontaminacion <- knnImputation(contaminacion)
kcontaminacion
rivers
plot(rivers)

boxplot(rivers, horizontal = TRUE)

variable <- boxplot.stats(rivers)
minimo <- min(variable$stats)
maximo <- max(variable$stats)

inferior <- variable$stats[1]
superior <- variable$stats[5] 

nuevo <- rivers[rivers < superior & rivers > inferior]
#Minimo de los out
minimo1 <- min(boxplot.stats(rivers)$out)

variable2 <- boxplot.stats(nuevo)



#Crea un script en R que permita eliminar los outiers del arrego rivers de manera automática
#Prueba el script con aguna columna de maraton o contaminacióm, para verificar que funciona correcamente


variable <- boxplot.stats(rivers)
nuevo <- rivers
while(length(variable$out) > 0){
  inferior <- variable$stats[1]
  superior <- variable$stats[5] 
  
  nuevo <- rivers[rivers < superior & rivers > inferior]
  variable <- boxplot.stats(nuevo)
  
}

boxplot(nuevo)


#

setwd("C:\\Users\\CC7\\Downloads")
maraton <- read.csv("maraton_ny.csv")

#siempre el orden es de menor a mayor cut siempre ordena ascendente 
maraton$nivel <- cut(maraton$time, breaks = 3, labels = c("alto","medio","bajo"))
View(maraton)

#Reescalamiento
install.packages("scales")
library("scales")

data_conv <- read.csv("data-conversion.csv")
# Primera forma
(data_conv$Age-min(data_conv$Age))/(max(data_conv$Age)-min(data_conv$Age))
#Segunda forma
rescale(data_conv$Age)

#Normalización
#Scale para normalización

salary <- read.csv("salary.csv")
escalado <- scale(salary[,c(1,2)])

plot(escalado)
plot(escalado[,1])
plot(escalado[,2])


View(salary)

#Smoothing
install.packages("modelbased")
library("modelbased")

#secuecnia de números empieza en 0 y termina en pi, saca el seno, rnorm da los valores de la distribución normal

x <- sin(seq(0,4 * pi, length.out = 100)) + rnorm(100, 0, 0.2) #Generar una onda
plot(x, type = "l")
#agrega ineas y ese color
lines(smoothing(x, method = "smooth"), type="l", col="blue")
lines(smoothing(x, method = "loess"), type="l", col="red")

plot(salary$salary, type="l")
lines(smoothing(salary$salary, method = "smooth"), type="l", col="blue")
lines(smoothing(salary$salary, method = "loess"), type="l", col="red")