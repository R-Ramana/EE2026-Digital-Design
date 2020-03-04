`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2020 12:09:50
// Design Name: 
// Module Name: Lab_2_Graded_Assignment
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


module Lab_2_Graded_Assignment(
   input [6:0] A,
   input [6:0] B,
   output [6:0] S,
   output Cout
   );
   
   wire [6:0] B_1s_complement;
   wire Cin;
   
   //Finding 1's complement of B
   assign B_1s_complement = ~B;
   
   //Generating a carry in by adding A LSB and B LSB
   five_bit LSB (A[4:0], B_1s_complement[4:0], 1, S[4:0], Cin);
   //Adding A MSB and B MSB, with the carry in generated from LSB above
   two_bit MSB (A[6:5], B_1s_complement[6:5], Cin, S[6:5], Cout);
endmodule
