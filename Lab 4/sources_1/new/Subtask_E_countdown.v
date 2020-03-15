`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2020 20:36:41
// Design Name: 
// Module Name: Subtask_E_countdown
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


module Subtask_E_countdown(
    input QUAR, clock, flag,
    output reg [15:0] led = 0,
    output reg outputFlag = 0,
    output reg reset = 0
    );
    
    wire slowclock;
    reg [3:0] count;
    
    // setting t = 1.34s
    Subtask_C_slowclock slwclk(clock, slowclock);
    
    // countdown of LEDs
    always @ (posedge slowclock) begin
        if (flag == 1) 
        begin
            reset <= 0;
        end
        
        // LED countdown in LOA mode
        if (QUAR == 1) 
        begin
            outputFlag <= 1;
            count <= (count == 15) ? 0 : count + 1;
            case (count)
            0: led <= 16'b0011111111111111;
            1: led[14] <= 0;
            2: led[13] <= 0;
            3: led[12] <= 0;
            4: led[11] <= 0;
            5: led[10] <= 0;
            6: led[9] <= 0;
            7: led[8] <= 0;
            8: led[7] <= 0;
            9: led[6] <= 0;
            10: led[5] <= 0;
            11: led[4] <= 0;
            12: led[3] <= 0;
            13: led[2] <= 0;
            14: led[1] <= 0;
            15: led[0] <= 0;
            default: led <= 0;
            endcase
        end
        
        if (count == 15) 
        begin
            outputFlag <= 0;
            reset <= 1;
        end
    end
endmodule
