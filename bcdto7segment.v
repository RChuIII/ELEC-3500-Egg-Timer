`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2023 08:37:19 AM
// Design Name: 
// Module Name: bcdto7segment
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


module bcdto7segment(
    input [3:0] bcd_in,
    output reg [6:0] seg
    );

    always @ (bcd_in or seg)
        case (bcd_in)
            4'b0000: seg = 7'b100_0000;
            4'b0001: seg = 7'b111_1001;
            4'b0010: seg = 7'b010_0100;
            4'b0011: seg = 7'b011_0000;
            4'b0100: seg = 7'b001_1001;
            4'b0101: seg = 7'b001_0010;
            4'b0110: seg = 7'b000_0010;
            4'b0111: seg = 7'b111_1000;
            4'b1000: seg = 7'b000_0000;
            4'b1001: seg = 7'b001_0000;
            default: seg = 7'b111_11110;
         endcase
    
endmodule