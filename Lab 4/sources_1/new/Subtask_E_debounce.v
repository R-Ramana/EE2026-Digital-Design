`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2020 17:55:39
// Design Name: 
// Module Name: Subtask_E_debounce
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


module Subtask_E_debounce(
    input clock, button,
    output slowclock, pulse
    );
    
    Subtask_E_buttonclock c0(clock, slowclock);
    Subtask_E_singlepulse p0(slowclock, button, pulse);
endmodule
