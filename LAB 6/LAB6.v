`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2021 02:23:58 PM
// Design Name: 
// Module Name: LAB6
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


module LAB6(clk_100MHz,clk_everyminute);
    input clk_100MHz;
    output clk_everyminute;
    
    
    reg [60:0] count = 0;
    reg led0R = 0;
    
    assign clk_everyminute = led0R;
    
    always @ (posedge(clk_100MHz))
    begin
        if(count == 50000000*(120)) // 120 multiplies the 50MHz to make the led blink everyminute
         begin
         count <= 0;
         led0R <= ~led0R;
         end
         else
         begin
         count <= count + 1;
        end
    end
endmodule
 
module SevenSegmentFourDigitsDP(
    input clk,
    input [3:0] BCD0,
    input [3:0] BCD1,
    input [3:0] BCD2,
    input [3:0] BCD3,
    input [3:0] DPs,
    output [3:0] AN,
    output [7:0] segN);
   
    reg [3:0] BCD;
    reg [3:0] rDPS;
        
    BCDtoSevenSegment mybcd(BCD,rDPS,segN);
    DigitController myDG(clk,AN);
    

    always @(AN)
    begin
        if(AN == 4'b1110)
            BCD = BCD0;
        else if(AN == 4'b1101)
            BCD = BCD1;
        else if(AN == 4'b1011)
            BCD = BCD2;
        else if(AN == 4'b0111)
            BCD = BCD3;
    end    
endmodule
   