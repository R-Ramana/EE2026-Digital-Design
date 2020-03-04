`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.02.2020 11:53:34
// Design Name: 
// Module Name: blinking_boundary
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


module task_B(
    input CLOCK,
    output reg LED_9 = 0, reg LED_10 = 0, reg LED_11 = 0, reg LED_12 = 0, reg LED_13 = 0, reg LED_14 = 0, reg LED_15 = 0
    );
    
    reg [3:0] COUNT = 0;
    
    always @ (posedge CLOCK) begin
        COUNT <= (COUNT == 6) ? 0 : COUNT + 1;
        LED_9 <= ( COUNT == 0 ) ? ~LED_9 : 0;
        LED_10 <= ( COUNT == 1 ) ? ~LED_10 : 0;
        LED_11 <= ( COUNT == 2 ) ? ~LED_11 : 0;
        LED_12 <= ( COUNT == 3 ) ? ~LED_12 : 0;
        LED_13 <= ( COUNT == 4 ) ? ~LED_13 : 0;
        LED_14 <= ( COUNT == 5 ) ? ~LED_14 : 0;
        LED_15 <= ( COUNT == 6 ) ? ~LED_15 : 0;
    end
endmodule
