`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2020 19:38:46
// Design Name: 
// Module Name: Subtask_E_buttonclock
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


module Subtask_E_buttonclock(
    input clock,
    output reg btnclock = 0
    );
    
    // for 1.5625 Mhz
    reg [3:0] count = 0;
    
    always @ (posedge clock) begin
        count <= count + 1;
        btnclock <= (count == 0) ? ~btnclock  : btnclock ;
    end
endmodule