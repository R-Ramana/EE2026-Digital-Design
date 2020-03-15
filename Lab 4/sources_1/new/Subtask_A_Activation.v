`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2020 11:43:32
// Design Name: 
// Module Name: Subtask_A_Activation
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


module Subtask_A_Activation(
    input switches, //switch inputs that will be turned on
    output reg [3:0] AN,
    output reg [7:0] SEG,
    output reg flag = 0 // flag to mark completion of subtask to move to next one
    );
    
    // initializing to no display
    initial begin
        AN = 4'b1111;
        SEG = 8'b11111111;
    end
    
    // when switches are turned on, two lines across the 7 segment
    always @ (*) begin
        if (switches == 1) 
        begin
            AN = 4'b0000;
            SEG = 8'b11110110;
            flag = 1;
        end
    end
endmodule