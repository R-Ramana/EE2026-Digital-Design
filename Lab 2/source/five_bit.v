`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2020 11:22:19
// Design Name: 
// Module Name: five_bit
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


module five_bit(
    input [4:0] A,
    input [4:0] B,
    input Cin,
    output [4:0] S,
    output Cout
    );
    
    wire C0, C1, C2, C3;
    
    one_bit FA0 (A[0], B[0], Cin, S[0], C0);
    one_bit FA1 (A[1], B[1], C0, S[1], C1);
    one_bit FA2 (A[2], B[2], C1, S[2], C2);
    one_bit FA3 (A[3], B[3], C2, S[3], C3);
    one_bit FA4 (A[4], B[4], C3, S[4], Cout);
endmodule
