# lab01- BCD2SSEG
laboratorio 02 implementación

En esta plantilla debe adicionar la documentación del laboratorio


* Humberto Sebastián Córrdoba Torres
* Nikolai Alexander Caceres Penagos
* Esteban Ladino Fajardo

En primer lugar se procede a diseñar un modulo que permita dado un numero en binario encender los respectivos leds correspondientes al display 7seg. Con este objetivo en mente, se declara un modulo "module BCDtoSeg" con las entradas BCD, numero en binario de 4 bits y por tal definido como [3:0], y divFre, el cual representa la frecuencia que permite desarrollar una visualizacion dinamica de 4 display; y con la salidas Sseg, numero de 7 bits que representa el estado de los leds en el display.
        
Se desarrolla un ciclo a traves de la funcion "always @ (*)" dentro del cual se lee cada uno de los casos posibles de entradas binarias y se asigna su correspondiente salida. Para el caso del numero 0 el caso generado seria el siguiente:
 4'b0000: sevSeg <= 7'b0000001; // "0";
Donde una vez se entre al caso BCD=0, es decir, el numero de 4 bits en base binaria 0000, se asignara a la variable de salida sevSeg el valor de 7 bits 0000001 que representa que todos los leds estaran encendidos (0, pues el display maneja logica inversa) a excepcion del led en la posicion G.	
    
Sucesivamente se desarrollo el modulo respectivo al divisor de frecuencia, que le permitira al programa principal alternar la visualizacion de cada uno de los 4 displays cada cierto tiempo, de manera que la percepcion humana vea todos los displays encendidos al mismo tiempo. Para tal fin, se procede a desarrollar el modulo "module mfreDiv" con la entrada del reloj y la salida del registro del divisor de frecuencia "freeDiv". En principio, se define un registro de 27 bits nombrado "conFre" y se inicializa con un uno. Este registro tiene tal cantidad de bits, pues solo en estos es posible albergar numeros de altas frecuencias que en decimal representan millones. Se continua haciendo un ciclo en el cual dada flanco de subida se verificara si conFree es igual a 2.


 
 


Este es la prueba de la tutoria del 14 de abril de 2020


insertar imagen 

![Logo de GitHub](https://unicrom.com/wp-content/uploads/85-a-codigo-bcd.png)

![fpga](figs/imageprueba1.jpg)
