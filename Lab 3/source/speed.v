`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.02.2020 13:25:02
// Design Name: 
// Module Name: speed
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


module speed(
    input switch_0,
    input switch_1, 
    input switch_2,
    input slow_freq,
    input fast_freq,
    input freq,
    output desired_freq
    );
    
    assign desired_freq = switch_2 ? fast_freq : (switch_1 ? freq : (switch_0 ? slow_freq : freq));
endmodule
