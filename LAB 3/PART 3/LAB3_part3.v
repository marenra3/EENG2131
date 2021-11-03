`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2021 02:17:10 PM
// Design Name: 
// Module Name: LAB3_part3
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

module fa(S,Co,A,B,Ci);
    output S;
    output Co;
    input A,B;
    input Ci;
    
    wire X;
    wire Y;
    wire Z;
    xor(X,A,B);
    xor(S,X,Ci);
    and(Y,X,Ci);
    and(Z,A,B);
    or(Co,Y,Z);
    
endmodule
module FA_4bit(
    input carry,
    input [3:0] A,
    input [3:0] B,
    output Co,
    output [3:0] S
    );
    
    wire w1, w2, w3;
    //(S,Co,A,B,Ci)
   fa bit0(S[0],w1,A[0],B[0],carry);
   fa bit1(S[1],w2,A[1],B[1],w1); 
   fa bit2(S[2],w3,A[2],B[2],w2);
   fa bit3(S[3],Co,A[3],B[3],w3);
endmodule

module switch_and_led(led_11,led_12,led_13,led_14,led_15,sw0,sw1,sw2,sw3,sw4,sw5,sw6,sw7,sw8);
    output led_11;
    output led_12;
    output led_13;
    output led_14;
    output led_15;
    input sw0;
    input sw1;
    input sw2;
    input sw3;
    input sw4;
    input sw5;
    input sw6;
    input sw7;
    input sw8;
    
    FA_4bit test(sw0,{sw4,sw3,sw2,sw1},{sw8,sw7,sw6,sw5},led_15,{led_14,led_13,led_12,led_11});
    //input carry,
    //input [3:0] A,
    //input [3:0] B,
    //output Co,
    //output [3:0] S
    
    
endmodule  
    
 