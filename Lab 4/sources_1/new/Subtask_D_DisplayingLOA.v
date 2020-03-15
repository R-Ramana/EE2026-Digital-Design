`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2020 15:09:24
// Design Name: 
// Module Name: Subtask_D_DisplayingLOA
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


module Subtask_D_DisplayingLOA(
    input clock, prev_flag,
    output reg [3:0] AN,
    output reg [7:0] SEG
    );

    wire slowclock, fastclock, currentclock;
    reg [1:0] count;
    reg [2:0] char_counter;
    
    Subtask_D_slowclock sc (clock, slowclock); //T = 2.68; f = 0.37Hz
    Subtask_D_fastclock fc (clock, fastclock); //f = 381Hz
    
    // initial display of two lines
    initial begin
        AN = 4'b0000;
        SEG = 8'b11110110;
        count = 0;
        char_counter = 1;
    end
    
    // to switch to high freq display of 7-segment    
    assign currentclock = char_counter ? slowclock : fastclock;
    
    // displaying LOA    
    always @ (posedge currentclock) begin
        if (prev_flag == 1) 
        begin
            // if count reaches 2, set to 0, else increase by 1
            count <= (count == 2) ? 0 : count + 1;
            
            if (char_counter) 
            begin
                // if counter reaches 4, set to 0 else increase by 1
                char_counter <= (char_counter == 4) ? 0 : char_counter + 1;
            end
            
            // spelling out LOA
            case (count)
            0:
                begin
                    AN <= 4'b1011; 
                    SEG <= 8'b11000111; // L
                end
            1:
                begin
                    AN <= 4'b1101; 
                    SEG <= 8'b11000000; // O
                end
            2:
                begin
                    AN <= 4'b1110; 
                    SEG <= 8'b10001000; // A               
                end
            default: 
                begin
                    AN <= 4'b1111; 
                    SEG <= 8'b11111111;
                end
            endcase
        end
    end
endmodule
