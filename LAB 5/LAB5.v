`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2021 12:26:32 PM
// Design Name: 
// Module Name: LAB5
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module BCDtoSevenSegment(
    input [3:0] BCD,
    output [6:0] segN
    );
   reg [6:0] segN;
   
   always @(BCD) // checks with side to light up and show the number
   begin
    if(BCD == 0)
      segN = 7'b1000000;
    else if(BCD == 1)
      segN = 7'b1111001;
    else if(BCD == 2)
      segN = 7'b0100100;
    else if(BCD == 3)
      segN = 7'b0110000;
    else if(BCD == 4)
      segN = 7'b0011001;
    else if(BCD == 5)
      segN = 7'b0010010;
    else if(BCD == 6)
      segN = 7'b0000010;
    else if(BCD == 7)
      segN = 7'b1111000;
    else if(BCD == 8)
      segN = 7'b0000000;
    else if(BCD == 9)
      segN = 7'b0010000;
    else
      segN = 7'b0001001; // this 7 bits output and 'X' 
   end 
endmodule

module BCDtoSevenSegment_testbench;
    wire [6:0] segN;
    reg [3:0] BCD;
    BCDtoSevenSegment test(BCD,segN);
    initial begin
    BCD = 0;
    #10;
    BCD = 1;
    #10;
    BCD = 2;
    #10;
    BCD = 3;
    #10;
    BCD = 4;
    #10;
    BCD = 5;
    #10;
    BCD = 6;
    #10;
    BCD = 7;
    #10;
    BCD = 8;
    #10;
    BCD = 9;
    #10;
    BCD = 13;
    #10;
    
    end
endmodule

module DigitController(clk, AN);
    parameter numDigits = 4; // can be change to any number of digits also the refreshRate 
    parameter refreshRate_ms = 10;
    input clk;
    output [numDigits-1:0] AN;
    
    reg [26:0] count0 = 0;
    reg [1:0] activeDigit = 0;
    
    assign AN = (activeDigit == 0)?4'b1110: // check condition of the clock to see in which case the active digit is changing.
        (activeDigit == 1)?4'b1101:
        (activeDigit == 2)?4'b1011:
            4'b0111;
    
    always @(posedge(clk))
    begin
       if(count0 == (100000*refreshRate_ms)/numDigits)
        begin
         count0 <= 0;
         case(activeDigit)
          0:activeDigit <= 1;
          1:activeDigit <= 2;
          2:activeDigit <= 3;
          default:activeDigit <= 0;
         endcase
        end
       else
        begin
         count0 <= count0 + 1;
        end
    end
endmodule
module DigitController_testbench;
    reg clk = 0;
    wire [3:0] AN;
    
    integer i;
    
    DigitController test(clk,AN); // to see the output in a simulation ( check if the code DigitController is working
    initial begin
        for (i = 0; i <10000; i = i + 1)
        begin
        clk = ~clk;
        #10;
        end
    end
endmodule

module SevenSegmentFourDigits(
    input clk,
    input [3:0] BCD0,
    input [3:0] BCD1,
    input [3:0] BCD2,
    input [3:0] BCD3,
    output [3:0] AN,
    output [6:0] segN);
   
    reg [3:0] BCD;
        
    BCDtoSevenSegment mybcd(BCD,segN);
    DigitController myDG(clk,AN);
    

    always @(*)
    begin
        if(AN == 4'b1110)
            BCD = BCD0;
        else if(AN == 4'b1101)
            BCD = BCD1;
        else if(AN == 4'b1011)
            BCD = BCD2;
        else
            BCD = BCD3;
    end    
endmodule
module FPGAInterface(an,seg,clk,sw);
 
  output [3:0] an;
  output [6:0] seg;
  input clk;
  input [15:0] sw;
  
  SevenSegmentFourDigits test(clk,{sw[3],sw[2],sw[1],sw[0]},{sw[7],sw[6],sw[5],sw[4]},{sw[11],sw[10],sw[9],sw[8]},{sw[15],sw[14],sw[13],sw[12]},{an[3],an[2],an[1],an[0]},{seg[6],seg[5],seg[4],seg[3],seg[2],seg[1],seg[0]});
  
endmodule

