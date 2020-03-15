`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2020 18:00:39
// Design Name: 
// Module Name: Subtask_E_singlepulse
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


module Subtask_E_singlepulse(
    input clock,
    input button,
    output s_pulse
    );
    
    wire dff_out1, dff_out2;
    
    Subtask_E_dflipflop dff0 (clock, button, dff_out1);
    Subtask_E_dflipflop dff1 (clock, dff_out1, dff_out2);
    
    assign s_pulse = dff_out1 & ~dff_out2;
endmodule
