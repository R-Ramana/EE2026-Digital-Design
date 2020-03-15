`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2020 01:03:35
// Design Name: 
// Module Name: Subtask_E_dflipflop
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


module Subtask_E_dflipflop(
    input DFF_clock,
    input D,
    output reg Q = 0
    );
    
    always @ (posedge DFF_clock) 
    begin
        Q <= D;
    end
endmodule
