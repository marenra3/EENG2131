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
    reg [24:0] count = 0;
    reg led0R = 0;
 
    assign led_0 = led0R;
    assign led_1 = count[14];
    assign led_2 = count[19];
    assign led_3 = count[24];
 
    always @ (posedge(clk))
    begin
        if(count == 500000000)
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
