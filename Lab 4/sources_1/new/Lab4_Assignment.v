`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2020 23:22:37
// Design Name: 
// Module Name: Lab4_Assignment
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


module Lab4_Assignment(
    input clock,
    input [15:0] switch,
    input BTNC, BTNU, BTND, BTNR, BTNL,
    output [3:0] AN,
    output [7:0] SEG,
    output [15:0] led
    );

    wire subtaskA, subtaskB, LOA, switches, antineg, complete; 
    wire [2:0] flag;
    
    // To display 7segs
    wire [3:0] taskA_AN, taskD_AN, taskE_AN;
    wire [7:0] taskA_SEG, taskD_SEG, taskE_SEG;
    wire [15:0] taskB_led, taskC_led, taskE_led;
    
    // switches to be turned on
    assign switches = (switch == 16'b0000000000011111);
    assign SEG[7] = 1;
    
    // Subtask A
    Subtask_A_Activation a0(switches, taskA_AN, taskA_SEG, subtaskA);
    
    // Subtask B
    Subtask_B_BaseTrail b0 (subtaskA, switches, taskB_led, subtaskB);
    
    // Subtask C
    Subtask_C_Countdown c0(subtaskB, clock, taskC_led, LOA);
    
    // Subtask D
    Subtask_D_DisplayingLOA d0 (clock, LOA, taskD_AN, taskD_SEG);
    
    // Subtask E-G
    Subtask_E_QUAR efg0 (clock, LOA, BTNC, BTNU, BTND, BTNR, BTNL, taskE_AN, taskE_SEG, taskE_led, antineg, complete);
    
    // Flag to determine which subtask to display
    assign flag = complete ? 4 : (subtaskA ? (LOA ? (antineg ? 3 : 2) : 1) : 0);
    
    // To display the respective output to the board using the flag
    Lab4_Assignment_output o0 (flag, taskA_AN, taskD_AN, taskE_AN, taskA_SEG, taskD_SEG, taskE_SEG, taskB_led, taskC_led, taskE_led, AN, SEG, led);
    
endmodule
