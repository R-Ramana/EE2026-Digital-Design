`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.01.2020 15:34:53
// Design Name: 
// Module Name: Lab1_Homework
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


module Lab1_Homework(
    input SW0,
    input SW1,
    input SW2,
    input SW3,
    input SW4,
    input SW5,
    input SW6,
    input SW7,
    input SW8,
    input SW9,
    output AN0,
    output AN1,
    output AN2,
    output AN3,
    output SEG_A,
    output SEG_B,
    output SEG_C,
    output SEG_D,
    output SEG_E,
    output SEG_F,
    output SEG_G,
    output SEG_DP
    );
    
//A0197788X
//assigning values for the character to be displayed - X
    assign SEG_B = 0;
    assign SEG_C = 0;
    assign SEG_E = 0;
    assign SEG_F = 0;
    assign SEG_G = 0;
    assign SEG_A = 1;
    assign SEG_D = 1;
    assign SEG_DP = 1;
    
//Assigning values for 7 SEG display - only for AN0, AN1, AN2, AN3
//Last digit is 8 so character to appear on AN0, AN1 & AN2 ONLY
    assign AN0 = ~(SW7 & SW8 & SW9) | SW0 | SW1 | SW2 | SW3 | SW4 | SW5 | SW6;
    assign AN1 = AN0;
    assign AN2 = AN1;
    assign AN3 = 1;
    
    
endmodule
