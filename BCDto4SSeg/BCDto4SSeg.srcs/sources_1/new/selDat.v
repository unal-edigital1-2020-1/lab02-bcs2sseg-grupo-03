`timescale 1ns / 1ps

module selDat(
  clk,
  BCD4,
  BCDtoSevSeg,
  BCD,
  selAn,
  divFre
    );      
    input clk;
    input [15:0]BCD4;
    output [6:0]BCDtoSevSeg;
    output reg [3:0]BCD;
    output [3:0]selAn;
    output divFre; //ya
 
 wire divFre;
  // declarar
 

mfreDiv auxFreDiv(
    .clk(clk),
    .freDiv(divFre) 
    );    
 
BCDtoSeg auxBCDtoSeg(
    .divFre(divFre),
    .BCD(BCD),
    .sevSeg(BCDtoSevSeg)
    );
    
 selAn auxSelAn(
    .divFre(divFre),
    .an(selAn)
    );              

reg [1:0]con=2'b00; 
    
always @(posedge divFre)
begin

case(con)
2'b00: BCD<=BCD4[15:12];
2'b01: BCD<=BCD4[11:8];
2'b10: BCD<=BCD4[7:4];
2'b11: BCD<=BCD4[3:0];
default: BCD<=4'b1111;
endcase

con=con+1;

end
    

endmodule
