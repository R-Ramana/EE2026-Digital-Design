`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2020 23:13:59
// Design Name: 
// Module Name: Subtask_E_QUAR
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


module Subtask_E_QUAR(
    input clock, prev_flag,
    input BTNC, BTNU,BTND,BTNR,BTNL,
    output reg [3:0] AN,
    output reg [7:0] SEG,
    output [15:0] led,
    output antineg, flag
    );
    
    wire pulseC, pulseU, pulseD, pulseR, pulseL; // Individual button pulses
    wire clockC,clockU,clockD,clockR,clockL; // Individual button clocks 
    wire fastclock, sixHzclock;  // fastclock = 381 Hz mediumclock = 6 Hz
    wire QUAR, reset, QUARflag; // to set/reset QUAR
    wire [7:0] SEG0, SEG1, SEG2, SEG3; // inputs displayed on the 7seg display
    wire [7:0] intSEG0, intSEG1, intSEG2, intSEG3; // Storing intermediate segments from button press
    wire [3:0] currSEG0, currSEG1, currSEG2, currSEG3; // To store current character for each segment    
    reg [3:0] anodePointer; // Anode Pointer (AP)
    reg [1:0] count = 0; 

    
    // debounce and get the button press
    Subtask_E_debounce d0(clock, BTNC, clockC, pulseC);
    Subtask_E_debounce d1(clock, BTNU, clockU, pulseU);
    Subtask_E_debounce d2(clock, BTND, clockD, pulseD);
    Subtask_E_debounce d3(clock, BTNR, clockR, pulseR);
    Subtask_E_debounce d4(clock, BTNL, clockL, pulseL);
    
    //clock for display and Anode Pointer blink freq of 5.96Hz (subtask F)
    Subtask_D_fastclock fc0 (clock, fastclock);
    Subtask_F_sixHzclock fc1 (clock, sixHzclock);
    
    // Go to QUAR mode when BTNC is being pressed and countdown to reset to LOA if time runs out
    Subtask_E_startQUAR q0(clockC, pulseC, prev_flag, reset, QUAR, QUARflag);
    Subtask_E_countdown cd0(QUAR, clock, QUARflag, led, antineg, reset);
     
    // Character Display for the 7 segment
    Subtask_F_display disp0 (clockU, sixHzclock, anodePointer[0], pulseU, pulseD, reset, intSEG0, currSEG0);
    Subtask_F_display disp1 (clockU, sixHzclock, anodePointer[1], pulseU, pulseD, reset, intSEG1, currSEG1);
    Subtask_F_display disp2 (clockU, sixHzclock, anodePointer[2], pulseU, pulseD, reset, intSEG2, currSEG2);
    Subtask_F_display disp3 (clockU, sixHzclock, anodePointer[3], pulseU, pulseD, reset, intSEG3, currSEG3);
     
    // show the first 4 characters of name if password is correct
    Subtask_F_displayname dispname0 (clockC, pulseC, intSEG0, intSEG1, intSEG2, intSEG3, SEG0, SEG1, SEG2, SEG3, QUARflag);
     
    initial begin
        anodePointer = 4'b0001; // setting anodePointer = AN0
        AN = 0;
        SEG = 8'b10110110;
    end
         
    always @ (posedge clockR) begin
        if (reset) 
        begin
            anodePointer <= 4'b0001;
       end 
       else 
       begin
            // bit shifting to shift pointer
            anodePointer <= (pulseR && !anodePointer[0]) ? anodePointer >> 1 : (pulseL && !anodePointer[3]) ? anodePointer << 1 : anodePointer;
        end
    end
        
    always @ (posedge fastclock) begin
        count <= count + 1;
        case (count)
        0:
           begin
               AN <= 4'b1110;
               SEG <= SEG0;
           end
        1:
           begin
               AN <= 4'b1101;
               SEG <= SEG1;
           end
        2:
           begin
               AN <= 4'b1011;
               SEG <= SEG2;
            end
        3:
           begin
               AN <= 4'b0111;
               SEG <= SEG3;
           end
        endcase
    end
endmodule