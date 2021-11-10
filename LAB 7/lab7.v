`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2021 01:05:52 PM
// Design Name: 
// Module Name: lab7
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


module lab7(

    );
    
    integer file1;
    genvar i;
    reg r; 
    
    $fopen("auto_testbenches", file1)
    
    for (i=0; i<2^16; i=i+1) 
     begin
      r = $fcanf(file1, "%d, %d, %d, %d, t[i], s1[i], s2[i]);
    
     
      
endmodule                                                    
