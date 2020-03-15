`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2020 18:30:47
// Design Name: 
// Module Name: Subtask_F_sixHzclock
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


module Subtask_F_sixHzclock(
    input clock,
    output reg newclock = 0
    );
    
    // 5.96 Hz
    reg [22:0] count = 0;
    
    always @ (posedge clock) begin
        count <= count + 1;
        newclock <= (count == 0) ? ~newclock : newclock;
    end
endmodule
