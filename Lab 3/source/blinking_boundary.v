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


module blinking_boundary(
    input CLOCK,
    output reg LED_BB = 0
    );
    
    //6Hz
    reg [22:0] COUNT = 0;
    
    always @ (posedge CLOCK) begin
        COUNT <= COUNT + 1;
        LED_BB <= ( COUNT == 0 ) ? ~LED_BB : LED_BB;        
    end
endmodule
