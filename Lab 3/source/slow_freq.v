`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.02.2020 13:28:24
// Design Name: 
// Module Name: slow_freq
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


module slow_freq(
    input CLOCK,
    output reg SLOWCLOCK = 0
    );

    //0.37Hz
    reg [26:0] COUNT = 0;

    always @ (posedge CLOCK) begin
        COUNT <= COUNT + 1;
        SLOWCLOCK <= ( COUNT == 0 ) ? ~SLOWCLOCK : SLOWCLOCK;
    end
endmodule
