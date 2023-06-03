#1. Crea una secuancia del 20 al 50, promedio y suma
numeros <- c(20:50)
promedio <- mean(numeros)
suma <- sum(numeros)
#2. Crea 3 vectores a,b,c con tres enteros
a <- c(1,2,3)
b <- c(4,5,6)
c <- c(7,8,9)

#Combinar vectores rbin, cbin
 matriz <- rbind(a,b,c)
 matriz
 
 #Hacer matriz
 matriz2 <- matrix(c(a,b,c),nrow = 3,ncol=3,byrow=TRUE,dimnames = list(c("row1","row2","row3"),c("C.1","C.2","C.3")))
 matriz2
 
#e byrow en true pondrá los números ordenados en filas, cuando es false los va poniendo en columna 
 
  
#3.Archivo
setwd("C:\\Users\\CC7\\Downloads")
pizzeria <- read.csv("pizzaplace.csv",
                   header = TRUE,
                   sep = ",",
                   dec =".")

View(pizzeria)


#a Indica cuantos tipos distintos de pizza se venden

pizzeria$type
#Solo trae los registros únicos
tipos <- factor(pizzeria$type)
#nlevels para contar vectores
nlevels(tipos)
categorias <- group_by(pizzeria, name)
View(categorias)


#b cuál es la pizza con el precio más caro
cara <- max(pizzeria$price)
which.max(pizzeria$price)
#Respuesta correcta:
pizzeria[which.max(pizzeria$price),5]
View(cara)


#c tamaño de la pizza que se vende menos
install.packages("dplyr")
library("dplyr")
#Contae cuantos hay en cada tipo de tamaño
pizzeria  %>%  count(size)
#El resultado de la cuenta lo ordenará por n =  total registro nde menor a mayor
                                        #Filas, columnas
(pizzeria %>% count(size) %>% arrange(n))[1, "size"]


#otra forma sin dplyr

vector <- c("S" = length(pizzeria[pizzeria$size == "S", 1]),
           "M" = length(pizzeria[pizzeria$size == "M", 1]),
           "L" = length(pizzeria[pizzeria$size == "L", 1]),
           "XL" = length(pizzeria[pizzeria$size == "XL", 1]),
           "XXL" = length(pizzeria[pizzeria$size == "XXL", 1]))

vector
which.min(vector)
vector[wich.min(vector)]

#d Mostrar las ventas de pizza de marzo a abril donde se hayn vendido pizzas grandes
 View(pizzeria  %>%  filter(size == "L" & as.Date(date) >= '2015-03-01' & as.Date(date) <= '2015-04-30'))

#sin dplyr
 View(pizzeria[pizzeria$size == "L" & substr(pizzeria$date,6,7) == "03" | substr(pizzeria$date,6,7) == "04",])
 
#e Muestra el nombre ytamaño de las ventas realizadas en agosto
 #arrange = order by, filter = where
 resultado <- pizzeria  %>% filter(as.Date(date) >= '2015-08-01' & as.Date(date) <= '2015-08-31' ) %>%  select(name,size)
 View(resultado)
 
 #sin dplyr
 
 pizzeria[pizzeria$date >= '2015-08-01' & pizzeria$date <= '2015-08-31', c(5,6)]
 
 pizzeria[substr(pizzeria$date,6,7) == "08", c(5,6)]

# f ¿Cuál es el horario de atención de la pizzaría?
 #minimo de time y maximo de time
minimo <- min(pizzeria$time)
maximo <- max(pizzeria$time)
print(paste(minimo, "-", maximo))