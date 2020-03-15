`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2020 23:42:14
// Design Name: 
// Module Name: Lab4_Assignment_output
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


module Lab4_Assignment_output(
    input [2:0] flag,
    input [3:0] taskA_AN, taskD_AN, taskE_AN,
    input [6:0] taskA_SEG, taskD_SEG, taskE_SEG,
    input [15:0] taskB_led, taskC_led, taskE_led,
    output  reg [3:0] AN, 
    output  reg [7:0] SEG,
    output reg [15:0] led
    );
    
    initial begin
        AN = 4'b1111;
        SEG = 8'b11111111;
        led = 0;
    end
    always @ (*) begin
        case (flag)
        0:
            begin
                AN = taskA_AN;
                SEG = taskA_SEG;
                led = taskB_led;
            end
        1:
            begin
                AN = taskA_AN;
                SEG = taskA_SEG;
                led = taskC_led;
            end
        2:
            begin
                AN = taskD_AN;
                SEG = taskD_SEG;
                led = 0;
            end
        3: 
            begin
                AN = taskE_AN;
                SEG = taskE_SEG;
                led = taskE_led;
            end
        4:
            begin
                AN = taskE_AN;
                SEG = taskE_SEG;
                led = 0;
            end
        default:
            begin
                AN = 0;
                SEG = 0;
                led = 0;
            end
        endcase
    end
endmodule