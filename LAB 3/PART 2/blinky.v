`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2021 12:15:14 PM
// Design Name: 
// Module Name: blinky
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


module blinky(
    input clk,
    output led_0,
    output led_1,
    output led_2,
    output led_3    
    );
    reg [26:0] count0 = 0;
    reg [26:0] count1 = 0;
    reg [26:0] count2 = 0;
    reg [26:0] count3 = 0;
    
    reg led0R = 0;
    reg led1R = 0;
    reg led2R = 0;
    reg led3R = 0;
    
    assign led_0 = led0R;
    assign led_1 = led1R;
    assign led_2 = led2R;
    assign led_3 = led3R;
 
    always @ (posedge(clk))
    begin
        if(count0 == 50000000)
         begin
         count0 <= 0;
         led0R <= ~led0R;
         end
        else
         begin
         count0 <= count0 + 1;
         end
        if(count1 == 25000000)
         begin
         count1 <= 0;
         led1R <= ~led1R;
         end
        else
         begin
         count1 <= count1 + 1;
         end
        if (count2 == 20000000)
         begin
         count2 <= 0;
         led2R <= ~led2R;
         end
        else
         begin
         count2 <= count2 + 1;
         end
        if (count3 == 3700000)
         begin
         count3 <= 0;
         led3R <= ~led3R;
         end
        else
         begin
         count3<= count3 + 1;
         end
    end
endmodule
