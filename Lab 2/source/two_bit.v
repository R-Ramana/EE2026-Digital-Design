`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2020 11:28:44
// Design Name: 
// Module Name: two_bit
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


module two_bit(
    input [1:0] A,
    input [1:0] B,
    input Cin,
    output [1:0] S,
    output Cout
    );

    wire C0;
    
    one_bit FA0 (A[0], B[0], Cin, S[0], C0);
    one_bit FA1 (A[1], B[1], C0, S[1], Cout);
endmodule
