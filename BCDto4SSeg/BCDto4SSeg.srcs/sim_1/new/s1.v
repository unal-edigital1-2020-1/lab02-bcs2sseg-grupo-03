`timescale 1ns / 1ps

module testbench();

//reg [3:0]BCD;
//wire [6:0]sevSeg;

//BCDtoSeg uut(
//.sevSeg(sevSeg),
//.BCD(BCD)
//); 
 
//initial begin

//for (BCD=0;BCD<=15;BCD=BCD+1)
//    begin
//    #30;
//    $display("El valor de BCD es: %d \n",BCD);
//    end
//end

//initial begin:TEST_CASE
//$dumpfile("s1.v" );
//#500;
//$finish;
//end


//   reg [3:0]auxBCD; 
    
//    BCDtoSeg auxBCDtoSeg(
//    .BCD(auxBCD),
//    .sevSeg(BCDtoSevSeg)
//    );
  
//    mfreDiv auxFreDiv(
//    .clk(clk),
//    .freDiv(divFre) 
//    );
    
//    selAn auxSelAn(
//    .divFre(divFre),
//    .an(selAn)
//    );
reg [15:0]BCD4;
reg [1:0]auxClk;
reg clk;
wire [6:0]BCDtoSevSeg;
wire [3:0]BCD;
wire [3:0]selAn;
wire divFre;

selDat auxSelDat(
  .clk(clk),
  .BCD4(BCD4),
  .BCDtoSevSeg(BCDtoSevSeg),
  .BCD(BCD),
  .selAn(selAn),
  .divFre(divFre)
    );
          
          
initial 

begin
    BCD4=16'h1234;
    for(auxClk=0;auxClk<4;auxClk=auxClk+1)begin
    #1;
    clk=auxClk[0];
    $display("El contador: %b",clk);
    end
end

initial
begin: TEST_CASE
$dumpfile("s1.v");
#(60);
$finish;
end

endmodule
