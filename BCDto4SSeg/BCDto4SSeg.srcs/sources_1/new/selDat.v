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
    
always @(posedge divFre)
begin

case(selAn)
4'b0111: BCD<=BCD4[15:12];
4'b1011: BCD<=BCD4[11:8];
4'b1101: BCD<=BCD4[7:4];
4'b1110: BCD<=BCD4[3:0];
default: BCD=4'b1111;


endcase

end
    

endmodule
