`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.01.2020 15:34:53
// Design Name: 
// Module Name: Lab1_Homework
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


module seven_segment(
    input LED_9,
    output AN0,
    output AN1,
    output AN2,
    output AN3,
    output reg segA, segB, segC, segD, segE, segF, segG, segDP
    );
    
    reg [5:0]COUNT = 0;
    
//Assigning values for 7 SEG display - only for AN0, AN1, AN2, AN3
//2nd last digit is 8 so character to appear on AN0, AN1 & AN2 ONLY
    assign AN0 = 0;
    assign AN1 = AN0;
    assign AN2 = AN1;
    assign AN3 = 1;
    
    always @ (posedge LED_9) begin
       case(COUNT)
       // DIGITS
       //assigning values for the character to be displayed - 0
       5'd0:
           begin
               segA <= 0; segB <= 0; segC <= 0; segD <= 0; 
               segE <= 0; segF <= 0; segG <= 1; segDP <= 1;
           end
       // 1
       5'd1:
           begin
               segA <= 1; segB <= 0; segC <= 0; segD <= 1; 
               segE <= 1; segF <= 1; segG <= 1; segDP <= 1;
           end
       // 2
       5'd2:
           begin
               segA <= 0; segB <= 0; segC <= 1; segD <= 0; 
               segE <= 0; segF <= 1; segG <= 0; segDP <= 1;
           end
       // 3
       5'd3:
           begin
               segA <= 0; segB <= 0; segC <= 0; segD <= 0; 
               segE <= 1; segF <= 1; segG <= 0; segDP <= 1;
           end
       // 4
       5'd4:
           begin
               segA <= 1; segB <= 0; segC <= 0; segD <= 1; 
               segE <= 1; segF <= 0; segG <= 0; segDP <= 1;
           end
       // 5
       5'd5:
           begin
               segA <= 0; segB <= 1; segC <= 0; segD <= 0; 
               segE <= 1; segF <= 0; segG <= 0; segDP <= 1;
           end
       // 6
       5'd6:
           begin
               segA <= 0; segB <= 1; segC <= 0; segD <= 0; 
               segE <= 0; segF <= 0; segG <= 0; segDP <= 1;
           end
       // 7
       5'd7:
           begin
               segA <= 0; segB <= 0; segC <= 0; segD <= 1; 
               segE <= 1; segF <= 1; segG <= 1; segDP <= 1;
           end
       // 8
       5'd8:
           begin
               segA <= 0; segB <= 0; segC <= 0; segD <= 0; 
               segE <= 0; segF <= 0; segG <= 0; segDP <= 1;
           end
       // 9
       5'd9:
           begin
               segA <= 0; segB <= 0; segC <= 0; segD <= 0; 
               segE <= 1; segF <= 0; segG <= 0; segDP <= 1;
           end
           
       // START OF NAME
       // R
       5'd10:
          begin
              segA <= 1; segB <= 1; segC <= 1; segD <= 1; 
              segE <= 0; segF <= 1; segG <= 0; segDP <= 1;
          end
      // A
      5'd11:
          begin
              segA <= 0; segB <= 0; segC <= 0; segD <= 1; 
              segE <= 0; segF <= 0; segG <= 0; segDP <= 1;
          end
      // M
      5'd12:
          begin
              segA <= 0; segB <= 1; segC <= 0; segD <= 1; 
              segE <= 0; segF <= 1; segG <= 1; segDP <= 1;
          end
      // A
      5'd13:
          begin
             segA <= 0; segB <= 0; segC <= 0; segD <= 1; 
             segE <= 0; segF <= 0; segG <= 0; segDP <= 1;
          end
      // N
      5'd14:
          begin
              segA <= 1; segB <= 1; segC <= 0; segD <= 1; 
              segE <= 0; segF <= 1; segG <= 0; segDP <= 1;
          end          
      // A
      5'd15:
          begin
              segA <= 0; segB <= 0; segC <= 0; segD <= 1; 
              segE <= 0; segF <= 0; segG <= 0; segDP <= 1;
          end
      // period
      5'd16:
          begin
             segA <= 1; segB <= 1; segC <= 1; segD <= 1; 
             segE <= 1; segF <= 1; segG <= 1; segDP <= 0;
          end
     endcase
     // looping back to start of name
     COUNT <= (COUNT == 5'd16) ? 4'd10 : COUNT + 1; 
     end 
endmodule
