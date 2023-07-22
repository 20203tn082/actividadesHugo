#EXAMEN DEL MARTES
#Carga, limpieza y transformación
#Transformación: Escalamiento, Normalización, Generealización

#Regresión: lineal (simple, múltiple), polinomial
#Resolverlo con lm y a mano (Excel)

setwd("C:\\Users\\CC7\\Documents\\EjerciciosHugo-Nath")
datos <- read.csv("coeficientes.csv")

#iq es la dependiente
#Regresión lineal múltiple
#modelo2M <- lm(Sales ~ Spend, data = datosM)
modelo <- lm(IQ ~ Cerebro + Altura, data = datos)
iq <- 203.066 + 1.251 * cerebro -2.935 * altura

