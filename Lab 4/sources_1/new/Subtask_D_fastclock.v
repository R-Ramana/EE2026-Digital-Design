`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2020 11:25:48
// Design Name: 
// Module Name: Subtask_D_fastclock
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


module Subtask_D_fastclock(
   input clock,
   output reg fastclock = 0
   );
   
   // for 381 Hz
   reg [16:0] count = 0;
   
   always @ (posedge clock) begin
       count <= count + 1;
       fastclock <= (count == 0) ? ~fastclock : fastclock;
   end
endmodule
