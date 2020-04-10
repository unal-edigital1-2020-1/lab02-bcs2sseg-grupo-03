`timescale 1ns / 1ps

module selAn(
    divFre,
    an
    );              
    
input divFre;
output reg [3:0]an;    
    
reg [1:0]cont=2'b00; 
 
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


endmodule
