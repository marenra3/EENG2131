`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2021 04:16:51 PM
// Design Name: 
// Module Name: LAB4-part1
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


module LAB4_part1(
  input D,
  input clk,
  input clrN,
  //input clrN,
  output reg Q);
  //output Q1);
  
  always @(posedge clk or negedge clrN)
    begin
    if (~clrN)
      Q<=0;
    else
      Q<=D;
    end 
 endmodule
 module LAB4_part1_tb;
  reg clk;
  reg D;
  reg clrN;
  wire Q;
  
    LAB4_part1 dut(D,clrN,clk,Q);
    initial begin
    clk = 0;
    forever #10 clk =~clk;
    end
    initial begin
    D <= 0;
    #18;
    D <= 1;
    #14;
    D <= 0;
    #10;
    D <= 1;
    #34;
    D <= 0;
    #20;
    D <= 1;
    #10;
    end
 endmodule