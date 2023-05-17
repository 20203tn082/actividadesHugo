price <- 100
price <- "Hola"
precio = 100

if(price < 100){
  print("<100")
}else{
  print(">100")
}

#tipos de datos que son diferentes
#declaro una variable y tiene 5 valores

#c es igual a combine, para poner múltiples valores juntos
quantity <- c(1,1,2,1,2)
quantity
ifelse(quantity == 1, 'Yes', 'No')

#La condición tiene longitud > 1 y solo el primer elemento será usado
price <- c(58,100,110)
#este if así normal n puede leer listas
if(price < 100){
  print("<100")
}else if(price == 100){
  print("=100")
}else{
  print(">100")
}

price <- c(58,100,110)
if(all(price>100)){
  print("<100")
}
if(any(price<100)){
  print("Alguno <100")
}

#Asignar indice por número o por nombre, pero por defecto asigna los indices numéricos
days <- function(x){
  switch(x,
         Mon = "Monday",
         Tue = "Tuesday",
         Wed = "Wednesday",
         Thu = "Thursday",
         Fri = "Friday",
         "Weekend"
  )
}

days("Mon")
days(6)
days("Hola")

quantity <- c(1,2,3,4,5)
#Media aritmetica  = promedio
#media geometrica =
avg_qty <- function(qty,type){
  switch(type,
         arithmetic = mean(quantity),
         geometric = prod(quantity)^(1/length(quantity)))
}

avg_qty(quantity,"arithmetic")
avg_qty(quantity,"geometric")



cart <- c("apple", "cookie", "lemon")
for(product in cart){
  print(product)
}

cart <- c("apple","cookie","lemon")
for(product in cart){
  print(product)
}

price_discounted <- c(1)
price <- c(30,120,50,70,150,100,50,25,110)
for(i in 1:length(price)){
  price_discounted[i] <- price[i] - price[i] * 0.1
  print(price_discounted[i])
}

print(price_discounted)

index <- 1
while(index <3){
  #paste es para concatenar
  print(paste("Index is", index))
  index <- index + 1
}

#Lo más cercano a un DoWhile
x <- 1 
repeat{
  print(x)
  x <- x + 1
  if( x == 3){
    #rompe el ciclo infinito
    break
  }
}

#set working directory cambia la carpeta donde trabajamos y apunta a la carpeta que indiquemos, esto lo hace lógicamente
setwd("C:\\Users\\CC7\\Downloads")

maraton <- read.csv("maraton_ny.csv",
                    header=TRUE,
                    #si tiene un identificador mi excel
                    row.names = 1,
                    sep=",",
                    dec = "."
)
View(maraton)

#tipo de variable
class(maraton)
#el dim devuelve filas y columnas
dim(maraton)
#devolver los encabezados de las columnas
names(maraton)
#Estructura.
str(maraton)
#número de filas y observaciones
nrow(maraton)
#instalar un paquete, en caso de querer instalar más, se separan por comas
install.packages("dplyr")
#indico que uso este paquete
library("dplyr")

#ESTE HACE LO MISMO QUE EL DE str
glimpse(maraton)
#resumen de las columnas del archivo
summary(maraton)

#Dataframe conjunto de vectores 

class(TRUE)
class("Hola")
class(9)
class(9.0)
class(c(1,2,3,4,5))
class(c("1","3",12))

install.packages("RWeka")
library("RWeka")

datos <- read.arff("CEE_DATA.arff")
View(datos)