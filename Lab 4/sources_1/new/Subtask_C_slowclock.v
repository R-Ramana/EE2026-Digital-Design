`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2020 14:20:05
// Design Name: 
// Module Name: Subtask_C_slowclock
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


module Subtask_C_slowclock(
    input clock,
    output reg slowclock = 0
    );
    
    // for delay of T = 1.34 s, f = 1/T = 0.746 Hz = 0.75 Hz
    reg [25:0] count = 0;
    
    always @ (posedge clock) begin
        count <= count + 1;
        slowclock <= (count == 0) ? ~slowclock : slowclock;
    end
endmodule
