`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2020 11:55:09
// Design Name: 
// Module Name: Subtask_B_BaseTrail
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


module Subtask_B_BaseTrail(
    input subtaskA_done, switches, //flag to indicate completion of previous task
    output reg [15:0] led,
    output reg flag = 0 //flag to signal completion of task
    );
    
    initial begin
        led = 16'b0000000000000000;
    end
    
    // setting LEDs to be turned on
    always @ (*) begin
        if (switches == 1) 
        begin
            led = 16'b0111111111111111;
            flag = 1;
        end
    end
endmodule
