#REGRESIÓN POLINOMIAL SIMPLE

#19b0+138b1+1335b2=649.5
#138b0+1335b1+14935.5b2=5306.6
#1335b0+14935.5b1+181427b2=51666.75


#a lado izquierdo, b los resultados (lado derecho del iggual)
#solve coeficientes a la izquierda del igual (antes del igual)
a <- matrix(c(19,138,1335,
              138,1335,14935.5,
              1335,14935.5,181427), nrow = 3)

#coeficientes a la derecha del = 
b <- matrix(c(649.5,5306.6,51666.75), nrow = 3)

solve(a,b)

#          [,1] 
#[1,] -6.6755591 b0
#[2,] 11.7644938 b1
#[3,] -0.6345802 b2

# y = -6.6755591 + 11.7644938*x - 0.6345802*x^2

#REGRESIÓN POLINOMIAL DE TERCER GRADO
#Linear model
#ocupa una formula y datos
#formula la variables dependientes a la izquierda y las dependientes a la derecha 
setwd("C:\\Users\\CC7\\Documents\\EjerciciosHugo-Nath")
datos <- read.csv("resistencia.csv")



#y = b0 + b1*x
#y = resistencia, x= concentracion

modelo <- lm(resistencia ~ concentracion, data = datos)
modelo

#Call:
#lm(formula = resistencia ~ concentracion, data = datos)

#Coefficients:
#  (Intercept)  concentracion  
#21.321          1.771  
#b0              b1

#Como en marketing las demás columnas están con NA, mejor solo se indican las que no tienen NA, en caso de tener
#los NA muy dispersos se recomienda llenarlos con moda o promedio
datosM <- read.csv("marketing.csv")
datosM <- datosM[1:12, 1:3]
modelo2M <- lm(Sales ~ Spend, data = datosM)
modelo2M


#Call:
#  lm(formula = Sales ~ Spend, data = datosM)

#Coefficients:
#  (Intercept)        Spend  
#1383.47        10.62  
# b0            b1


#REGRESIÓN MULTIPLE SOLO SE AGREGA UN + Y LA OTRA VARIABLE

modelo2M <- lm(Sales ~ Spend +Month, data = datosM)

#Call:
#  lm(formula = Sales ~ Spend + Month, data = datosM)

#Coefficients:
#  (Intercept)        Spend        Month  
#-567.61        10.38       541.37


#POLINOMIALES 
datosR <- read.csv("resistencia.csv")
modeloR <- lm(resistencia ~ concentracion + I(concentracion^2), data = datosR)
#b1 lleva concentracion

#Call:
#  lm(formula = resistencia ~ concentracion + I(concentracion^2), 
#     data = datosR)

#Coefficients:
#  (Intercept)       concentracion  I(concentracion^2)  
#-6.6742             11.7640             -0.6345
# b0                  b1                b2

datosR3 <- read.csv("resistencia.csv")
modeloR3 <- lm(resistencia ~ concentracion + I(concentracion^2) + I(concentracion^3), data = datosR)


#Call:
#  lm(formula = resistencia ~ concentracion + I(concentracion^3), 
#     data = datosR)

#Coefficients:
#(Intercept)       concentracion  I(concentracion^2)  I(concentracion^3)  
#5.64840             3.57849             0.65364            -0.05519


plot(x = datosR3$concentracion, y= datosR3$resistencia)


prediccion <- predict(modeloR3, data.frame(concentracion =  c(16,17)))
