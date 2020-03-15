`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2020 11:25:19
// Design Name: 
// Module Name: Subtask_D_slowclock
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


module Subtask_D_slowclock(
    input clock,
    output reg slowclock = 0
    );
    
    // for time, T = 2.68 s, f = 1/T = 0.37
    reg [26:0] count = 0;
    
    always @ (posedge clock) begin
        count <= count + 1;
        slowclock <= (count == 0) ? ~slowclock : slowclock;
    end
endmodule
