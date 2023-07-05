setwd('C:\\Users\\CC7\\Downloads')
movies <- read.csv('movies.csv')

install.packages('mice')
library('mice')
str(md.pattern(movies))

#cuantos valos 
md.pattern(movies)[6,7]

#Guardar en un nuevo 
moviesSinFtantes <- na.omit(movies)

#Sustituir os faltantes raiting promedio, votes, moda

#------PROMEDIOOO--------
movies$RATING <-ifelse(is.na(movies$RATING), mean(movies$RATING, na.rm=TRUE),movies$RATING)
movies$RATING

install.packages('modeest')
library('modeest')

#------MODAAAA-------- NO ESTOY SEGURA
movies$VOTES <-ifelse(is.na(movies$VOTES), mfv(movies$VOTES, na_rm = TRUE), movies$VOTES)
movies$VOTES


#vecinos cercanos

install.packages('DMwR2')
library('DMwR2')

movies$RunTime <- knnImputation(movies$RunTime)


#pregunta extra
gsub #apicar una expresión sobre una 
#grepl buscar el caracterer que se le diga en un conjunto de valores
#sapply a un conjunto de datos le va a aplicar a función qe esté a la derecha
#nchar cantidad de caracteres



boxplot(data$views)
boxplot(data$comments)

#cuantos valores
length(boxplot.stats(data$views)$out)
length(boxplot.stats(data$comments)$out)

#Elimina los valores atípicos de views y comments.


#

resultado <- (data %>% filter(data$category == 'Visualization') %>% summarise(mean(data$views)))


              
              
