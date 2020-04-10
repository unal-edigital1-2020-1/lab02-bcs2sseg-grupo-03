`timescale 1ns / 1ps


module mfreDiv(
clk,
freDiv 
    );
  
    input clk;
    output reg freDiv=0;    
 
 reg [26:0]conFre=1;
 
 always @(posedge clk)
 begin
 if(conFre==2)
 begin
  freDiv=~freDiv;
  conFre=0;
 end
    
 conFre=conFre+1;    
 end
 
endmodule
