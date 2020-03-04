`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.01.2020 15:41:45
// Design Name: 
// Module Name: lab1_homework_module_simulation
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


module lab1_homework_module_simulation(

    );
    
    reg SW0, SW1, SW2, SW3, SW4, SW5, SW6, SW7, SW8, SW9;
    wire AN0, AN1, AN2, AN3, SEG_A, SEG_B, SEB_C, SEG_D, SEG_E, SEG_F, SEG_G, SEG_DP;
    
    Lab1_Homework dut(SW0, SW1, SW2, SW3, SW4, SW5, SW6, SW7, SW8, SW9, AN0, AN1, AN2, AN3, SEG_A, SEG_B, SEB_C, SEG_D, SEG_E, SEG_F, SEG_G, SEG_DP);
 
// Running simulation   
    initial begin
        SW7 = 1; SW8 = 1; SW9 = 1; SW0 = 0; SW1 = 0; SW2 = 0; SW3 = 0; SW4 = 0; SW5 = 0; SW6 = 0; #10;
        SW7 = 1; SW8 = 1; SW9 = 1; SW0 = 0; SW1 = 0; SW2 = 0; SW3 = 0; SW4 = 0; SW5 = 0; SW6 = 1; #10;
    end
    
endmodule
