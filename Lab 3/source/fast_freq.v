`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.02.2020 13:27:38
// Design Name: 
// Module Name: fast_freq
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


module fast_freq(
    input CLOCK,
    output reg FASTCLOCK = 0
    );
    
    //12Hz
    reg [21:0] COUNT = 0;
    
    always @ (posedge CLOCK) begin
        COUNT <= COUNT + 1;
        FASTCLOCK <= ( COUNT == 0 ) ? ~FASTCLOCK : FASTCLOCK;
    end
endmodule
