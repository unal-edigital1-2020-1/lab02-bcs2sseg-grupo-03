# lab01- BCD2SSEG
laboratorio 02 implementación

* Humberto Sebastián Córrdoba Torres
* Nikolai Alexander Caceres Penagos
* Esteban Ladino Fajardo

Los módulos fueron realizados según las especificaciones que dió el profesosr según se puede observar en el diagrama estructural.  
![fpga](figs/fig1.png)

## Modulo DivFreq

El código implementado se encuentra en el archivo freDiv.v las partes a resaltar son:

reg [26:0]conFre=1;

Con esto se asegura que se pueda guardar un número del orden de 134.2xE6 base 10.

 always @(posedge clk)

En cada flanco de subida se me va a ejecutar la acción que este dentro el always.

if(conFre==2) 

En este caso se hace una emulación de que solo se necesita 4 veces menos la frecuencia del reloj. Sin embargo, la FPGA del laboratorio tiene un reloj (clk) de 100MHz y si se necesita un divisor de frecuencia de 1Hz se hace necesario que **conFre** llegue hasta 50E6 base 10 por eso se garantiza que llegue hasta ese valor con un registro de 27 bits.

freDiv=~freDiv

Permanece conmutando freDiv entre 0 y 1 cada vez que se cumpla la condición, esto se hace para generar los flancos de subida y bajada del divisor de frecuencia, muy intesante.

##Módulo selAn

Se ubica en el archivo selAn.v y se resalta:

 always@(posedge divFre)
  
 begin
 
  case(cont)
  
  2'b00: an=4'b0111;
  
  2'b01: an=4'b1011;
  
  2'b10: an=4'b1101;
  
  2'b11: an=4'b1110;
  
  default:
  
      begin
      
      an=4'b1111;
      
      end    
      
  endcase
  
  cont=cont+1;
  
 end

El registro **cont** es de dos bits lo que permite ahorrarse el condicional que lo reinicializa. Así, cada **an** se asigna según el segmento que se quiera mostrar y que va sincronizado con el franco de subida que tenga el divisor de frecuencia.

##Módulo BCD to 7 Seg

Está en el archivo BCDtoSeg.V se comenta: 

always @ (*) begin 

Al inicio se colocó en lugar del **always @(*)** el  **always @(posedge clk)** y aunque los resultados eran correctos, la asignación de los valores aparecía desfasada.

## Módulo selec. dat

Se localiza en selDat.v y es donde se instancian todos los otros módulos. Se resalta que:

2'b00: BCD<=BCD4[15:12];

2'b01: BCD<=BCD4[11:8];

2'b10: BCD<=BCD4[7:4];

2'b11: BCD<=BCD4[3:0];

Los números hexadecimales se asignan según las posiciones más significativas (para que no se visualicen de derecha a izquierda) y van sincronizados con el divisor de frecuencia mediante un contador similiar al que se implementa en el módulo **selAn **.

Por último los resultados obtenidos se visualizan en la siguiente Figura

![fpga2](figs/fig2.png)


 



  
 


Este es la prueba de la tutoria del 14 de abril de 2020


insertar imagen 

![Logo de GitHub](https://unicrom.com/wp-content/uploads/85-a-codigo-bcd.png)

![fpga](figs/imageprueba1.jpg)
