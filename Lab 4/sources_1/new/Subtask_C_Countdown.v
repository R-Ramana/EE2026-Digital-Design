`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2020 12:32:42
// Design Name: 
// Module Name: Subtask_C_Countdown
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


module Subtask_C_Countdown(
    input prev_flag, clock, //flag to mark completion of prev subtask
    output reg [15:0] led = 0,
    output reg flag = 0 //flag to signal completion of subtask
    );
    
    wire slowclock;
    reg [3:0] count;
    
    // setting t = 1.34s ==> f = 0.75Hz
    Subtask_C_slowclock slwclk(clock, slowclock);
    
    // countdown of LEDs
    always @ (posedge slowclock) begin
        if (prev_flag == 1) 
        begin
            count <= (count == 15) ? 0 : count + 1;
            
            case (count)
            0: led <= 16'b0111111111111111; //LED from LD0 to LD14 (8+6) turned on
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
            flag <= 1;
        end
    end
endmodule
