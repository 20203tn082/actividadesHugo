#Clasificacion

Trabajo <- c(10,4,6,7,7,6,8,9,2,5,6,5,3,2,2,1,8,9,2,7)
Examen <- c(9,5,6,7,8,7,6,9,1,5,7,6,2,1,5,5,9,10,4,6) 
Interes <- c(1,2,1,1,1,2,2,1,3,3,3,2,3,3,2,2,1,1,3,3)
datos <- data.frame(Trabajo, Examen, Interes)
print(datos)
print("7 3")
print("4 7")
print("3 4")
t1 <- 7
e1 <- 5
t2 <- 4
e2 <- 7
t3 <- 3
e3 <- 4
datos$Distancia1 <- sqrt((t1-datos$Trabajo)^2+(e1-datos$Examen)^2)
print(datos)