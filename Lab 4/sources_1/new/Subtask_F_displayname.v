`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2020 22:03:41
// Design Name: 
// Module Name: Subtask_F_displayname
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


module Subtask_F_displayname(
    input slowclock, pulseC,
    input [7:0] intSEG0, intSEG1, intSEG2, intSEG3,
    output reg [7:0] SEG0, SEG1, SEG2, SEG3,
    output reg complete
    );
    
    wire password, QUAR, redundant;
    
    assign password =  (intSEG0 == 8'b10000000) && (intSEG1 == 8'b10000000) && (intSEG2 == 8'b11111000) && (intSEG3 == 8'b11111000);
    
    Subtask_E_startQUAR q0(slowclock, pulseC, password, 0, QUAR, redundant);

    initial begin
        // 3 lines across each seg
        SEG0 = 8'b10110110;
        SEG1 = 8'b10110110;
        SEG2 = 8'b10110110;
        SEG3 = 8'b10110110;
        complete = 0;
    end
    
    // to display name
    always @ (posedge slowclock) begin
        if (QUAR) begin
            // R
            SEG3 <= 8'b10101111; 
            // R
            SEG2 <= 8'b10101111; 
            // A
            SEG1 <= 8'b10001000; 
            // M
            SEG0 <= 8'b11101010; 
  
            complete <= 1;
        end 
        
        else 
        begin
            SEG3 <= intSEG3;
            SEG2 <= intSEG2;
            SEG1 <= intSEG1;
            SEG0 <= intSEG0;
        end
    end
endmodule
