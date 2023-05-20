setwd("C:\\Users\\CC7\\Downloads")
maraton <- read.csv("maraton_ny.csv",
                    header = TRUE,
                    row.names = 1,
                    sep = ",",
                    dec =".")

#Variables 
#Ctrl + L Limpiar consola
assign("z", 4)
z <- "h"

#Asignación a un tipo de dato
e <-- numeric(10) #Asigno 10 valores numéricos
c <- character(10)


#operadores aritméticos
#+ * / -

#Módulo
#En Java 5%2=1
#En R %%
5%%2

#SQL es como dplyr. Select, Group

#División
#/ división decimal
# %/% división entera
10/7
10%/%7

#Operadores logicos
#< > != == >= <=

#Comparaciones
#En Java && ||
#En R & |
x == 3 & x < 6

#Tipos de dato
#Caracter, número (double, integer)
#Lógico (boolean), complejos, raw como audio video

nombre <- 'Hugo'
edad <- 36L #Entero largo 4 8 en int el doble en
cantidad <- 4
bandera <- TRUE #T o F, 1 o 0, Se puede escribir cualquiera de estas
#Raíz de -1 se representa con i
raiz <- 3 + 5i
#Tipos como audio y video, almacena como bytes
binario <- raw(4)

#Parecido a class, devuelve el tipo 
typeof(nombre)
typeof(edad)
typeof(cantidad)
typeof(bandera)
typeof(raiz)
typeof(binario)

#Busca un concepto con la palabras escrita
?class
#Busca todos los conceptos donde encuentres esta palabra
??graph

#const 


func1 <- function(x,arithmetic=TRUE){
  resultado <- 0
  if(is.character(x) | is.logical(x)){
    print("el argumento no es numérico")
  }else{
    if(arithmetic==TRUE){
      resultado <- sum(x) / length(x)
    }else{
      resultado <- prod(x) ^ (1/length(x))
    }
  }
  return(resultado)
}

resultado <- func1(c(1,2,3),TRUE)

VECTOR <- C(1,2,3,4,5)

#FUNCIÓN ASSIGN
assign("b", c)

c <- c("UNO", 2, T, "CUATRO")
C

#utilizando el operador : es un rango, valor menor y mayor
d <- 1:5
d

#Utilizando la función seq, con dos números. Secuencia de rangos si no quiero que incremente en 1
#valor mínimo máxico y de cuanto va a incrementar
e <- seq(1,5, by=1.5)
e

#Replicando elementos. Va a repetir 4 veces ese tango 2 3 4
f <- rep(2:4, times=4)
f

#usando la función scan. Leer desde teclado
g <- scan()
g


#Asignaer encabezado / key a un vestor
vector <- c(1,2,3,4)
names(vector) <- c ("posicion1", "posicion2", "posicion3", "posicion4")
vector
names(c) <- c("Col1","Col2", "Col3", "Col4")
c

#Crear vector con nombre
inventario <- c('manzana'=30, 'platano' =8,'sandia'=6)
inventario

#Añadir más elementos
inventario2 <- c(inventario, 'pera'=10)
inventario2

#Añadir más elementos 
inventario3 <- union(inventario,c('pera'=10))
inventario


#Selección de elementos de un vector
inventario[2]