`timescale 1ns / 1ps

module BCDtoSeg(
    divFre,
    BCD,
    sevSeg
    );
    
input divFre;    
input [3:0] BCD;
output reg [6:0]sevSeg;    
    
 always @ (posedge divFre) begin
  case (BCD)
   4'b0000: sevSeg = 7'b0000001; // "0"  
	4'b0001: sevSeg = 7'b1001111; // "1" 
	4'b0010: sevSeg = 7'b0010010; // "2" 
	4'b0011: sevSeg = 7'b0000110; // "3" 
	4'b0100: sevSeg = 7'b1001100; // "4" 
	4'b0101: sevSeg = 7'b0100100; // "5" 
	4'b0110: sevSeg = 7'b0100000; // "6" 
	4'b0111: sevSeg = 7'b0001111; // "7" 
	4'b1000: sevSeg = 7'b0000000; // "8"  
	4'b1001: sevSeg = 7'b0000100; // "9" 
   4'ha: sevSeg = 7'b0001000;  
   4'hb: sevSeg = 7'b1100000;
   4'hc: sevSeg = 7'b0110001;
   4'hd: sevSeg = 7'b1000010;
   4'he: sevSeg = 7'b0110000;
   4'hf: sevSeg = 7'b0111000;
    default:
    sevSeg = 7'b1111111;
  endcase
end

    
endmodule
