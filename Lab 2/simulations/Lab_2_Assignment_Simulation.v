`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2020 12:06:22
// Design Name: 
// Module Name: Lab_2_Assignment_Simulation
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


module Lab_2_Assignment_Simulation(
    );
    
    //Inputs A & B
    reg [6:0] A, B;
    
    //Outputs S & Cout
    wire [6:0] S;
    wire Cout;
    
    //Instantation
    Lab_2_Graded_Assignment dut(A, B, S, Cout);
    
    //Simulation and 10 test cases
    initial begin
        //#1: 4 - (-14) = 18
        A=7'b0000100; B=7'b1110010;#100;
        //#2: 8 - 18 = -10 wrong bij
        A=7'b0001000; B=7'b0010010;#100;
        //#3: 26 - 25 = 1
        A=7'b0011010; B=7'b0011001;#100;
        //#4: 35 - 38 = -3 wrong
        A=7'b0100011; B=7'b0100110;#100;
        //#5: -30 - 29 = -59 wrong
        A=7'b1100010; B=7'b0011101;#100;
        //#6: -29 - 20 = -49 wrong
        A=7'b1100011; B=7'b0010100;#100;
        //#7: 47 - 11 = 36 
        A=7'b0101111; B=7'b0001011;#100;
        //#8: -49 - 3 = -52 wrong
        A=7'b1001111; B=7'b0000011;#100;
        //#9: 35 - 5 = 30
        A=7'b0100011; B=7'b0000101;#100;
        //#10: 55 - 50 = 5
        A=7'b0110111; B=7'b0110010;#100;
    end
endmodule
