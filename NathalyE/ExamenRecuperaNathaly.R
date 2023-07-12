#ESCALONA RUIZ NATHALY
# Carga los datos del archivo AB_NYC_2019.csv.

setwd("C:\\Users\\CC7\\Downloads")
datos_nyc <- read.csv("AB_NYC_2019.csv")
View(datos_nyc)

datos_nyc$last_review <- ifelse(datos_nyc$last_review == "", NA, datos_nyc$last_review) 

View(datos_nyc)

# ¿Cuántas observaciones cuentan con valores vacíos?
library("mice")
md.pattern(datos_nyc)
str(md.pattern(datos_nyc))

numObservacionesVacios <- md.pattern(datos_nyc)[3,17]
numObservacionesVacios

  
#Elimina las observaciones que cuenten con valores vacíos.

datos_nyc <- na.omit(datos_nyc)
View(datos_nyc)
  
# Con el data set original, llena los valores vacíos de las columnas last_review con moda y review_per_month con promedio.
datos_nyc <- read.csv("AB_NYC_2019.csv")
View(datos_nyc)

datos_nyc$last_review <- ifelse(datos_nyc$last_review == "", NA, datos_nyc$last_review) 

View(datos_nyc)

library("modeest")
datos_nyc$last_review <- ifelse(is.na(datos_nyc$last_review), mfv(datos_nyc$last_review, na_rm = TRUE), datos_nyc$last_review) 
View(datos_nyc)
datos_nyc$reviews_per_month <- ifelse(is.na(datos_nyc$reviews_per_month), mfv(datos_nyc$reviews_per_month, na_rm = TRUE), datos_nyc$reviews_per_month) 
View(datos_nyc)
  

# ¿Cuántos valores atípicos tiene la columna number_of_reviews?

length(boxplot.stats(datos_nyc$number_of_reviews)$out)
  
#   ¿Cuántas propiedades existen por cada neighbourhood?
#propiedad es cada registro
library("dplyr")
#agrupar por columna y cuantos hay

propiedades <- datos_nyc %>% count(neighbourhood)
View(propiedades)

# ¿Cuántos y cuáles room_types existen?

tipos <-factor(datos_nyc$room_type)
nlevels(tipos)

#¿Cuántas propiedades existen con precios de renta entre 5000 y 7500?
nrow(datos_nyc[datos_nyc$price >= 5000 & datos_nyc$price <= 7500,])

#   EXTRA: Con base en el precio de renta, crea una columna nueva llamada precio que asigne una categoria (caro, medio, económico) 
#a cada propiedad.

datos_nyc$precio <- cut(datos_nyc$price, breaks = 3, labels = c("económico", "medio", "caro"))

View(datos_nyc)




