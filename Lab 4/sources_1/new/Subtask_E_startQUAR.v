`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2020 20:02:35
// Design Name: 
// Module Name: Subtask_E_startQUAR
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


module Subtask_E_startQUAR(
    input slowclock, pulseC, password, reset,
    output reg QUAR = 0, 
    output reg outputFlag = 0
    );
    
    always @ (posedge slowclock) begin
        if (reset == 1) 
        begin
            QUAR <= 0;
            outputFlag <= 1;
        end 
        
        else 
        begin
            if (QUAR == 0)
            begin
//                QUAR <= QUAR;
//            end
//            else
//            begin
                QUAR <= (password && pulseC);
                outputFlag <= 0;
            end
        end
    end
endmodule
