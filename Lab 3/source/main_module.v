`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.02.2020 01:58:00
// Design Name: 
// Module Name: main_module
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


module main_module(
    input CLOCK, switch_0, switch_1, switch_2,
    output LED_BB, LED_9, LED_10, LED_11, LED_12, LED_13, LED_14, LED_15, AN0, AN1, AN2, AN3, segA,segB,segC,segD,segE,segF,segG,segDP
    );
    
    wire SLOWCLOCK, FASTCLOCK, defaultCLOCK, desired_freq;
    
    //Task A: blinking boundary
    blinking_boundary fa0(CLOCK, LED_BB);
    // Task B - C: frequency modifier
    slow_freq fa1(CLOCK, SLOWCLOCK);
    fast_freq fa2(CLOCK, FASTCLOCK);
    freq fa3(CLOCK, defaultCLOCK);
    speed fa4(switch_0, switch_1, switch_2, SLOWCLOCK, FASTCLOCK, defaultCLOCK, desired_freq);
    task_B fa5(desired_freq, LED_9, LED_10, LED_11, LED_12, LED_13, LED_14, LED_15);
    // Task D - F: 7 segment display
    seven_segment fa6(LED_9, AN0, AN1, AN2, AN3, segA,segB,segC,segD,segE,segF,segG,segDP);
endmodule
