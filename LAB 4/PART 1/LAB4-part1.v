`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2021 03:56:47 PM
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
    input [3:0] A,
    input [3:0] B,
    input M,
    output Co,
    output [3:0] S,
    output V
    );
    
    wire w1, w2, w3;
    wire y0, y1, y2, y3;
    xor (y0,M,B[0]);
    xor (y1,M,B[1]);
    xor (y2,M,B[2]);
    xor (y3,M,B[3]);
    xor (V,Co,w3);
    //(S,Co,A,B,Ci)
   fa bit0(S[0],w1,A[0],y0,M);
   fa bit1(S[1],w2,A[1],y1,w1); 
   fa bit2(S[2],w3,A[2],y2,w2);
   fa bit3(S[3],Co,A[3],y3,w3);
endmodule


