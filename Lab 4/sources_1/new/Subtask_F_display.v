`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2020 21:29:24
// Design Name: 
// Module Name: Subtask_F_display
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


module Subtask_F_display(
    input slowclock, sixHzclock, anodePointer, pulseU, pulseD, reset,
    output reg [7:0] SEG,
    output reg [3:0] currSEG = 4'd10
    );
    
    reg [7:0] SEGtoggle;
    
    initial begin
        SEGtoggle = 8'b10000000;
        SEG = 8'b10110110;
    end
    
    // toggle at 6 Hz
    always @ (posedge sixHzclock) begin
        SEGtoggle <= anodePointer ? ~SEGtoggle : 8'b10000000;
    end
    
    always @ (posedge slowclock) begin
        if (reset == 1) 
        begin
            currSEG <= 10;
        end 
        
        else if (anodePointer == 1) 
        begin
            currSEG <= pulseU ? currSEG + 1 : (pulseD ? ((currSEG == 0) ? 10 : currSEG - 1)  : currSEG);
            case (currSEG)
            10: SEG <= SEGtoggle | 8'b10110110;
            0: SEG <= SEGtoggle | 8'b11000000;
            1: SEG <= SEGtoggle | 8'b11111001;
            2: SEG <= SEGtoggle | 8'b10100100;
            3: SEG <= SEGtoggle | 8'b10110000;
            4: SEG <= SEGtoggle | 8'b10011001;
            5: SEG <= SEGtoggle | 8'b10010010;
            6: SEG <= SEGtoggle | 8'b10000010;
            7: SEG <= SEGtoggle | 8'b11111000;
            8: SEG <= SEGtoggle | 8'b10000000;
            9: SEG <= SEGtoggle | 8'b10010000;
            11: currSEG <= 0;
            default: SEG <= SEGtoggle | 8'b10110110;
            endcase
        end 
        
        else 
        begin
            case (currSEG)
            10: SEG <= 8'b10110110;
            0: SEG <= 8'b11000000;
            1: SEG <= 8'b11111001;
            2: SEG <= 8'b10100100;
            3: SEG <= 8'b10110000;
            4: SEG <= 8'b10011001;
            5: SEG <= 8'b10010010;
            6: SEG <= 8'b10000010;
            7: SEG <= 8'b11111000;
            8: SEG <= 8'b10000000;
            9: SEG <= 8'b10010000;
            11: currSEG <= 0;
            default: SEG <= 8'b10110110;
            endcase
         end
    end
endmodule
