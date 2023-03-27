`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2023 08:50:45 AM
// Design Name: 
// Module Name: clock_divider
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

module clock_divider(clk_in, enable, clk_out);
    input clk_in;
    input enable;
    output reg clk_out;
    integer count = 0; //500hz
    
    parameter CLK_DIV = 5_000_000;
    
    always @ (posedge clk_in) begin
        if (enable) begin
            if (count == CLK_DIV) begin
                count <= 0;
                clk_out <= ~clk_out;
            end else count <= count + 1;
        end else clk_out <= 0;
    end
endmodule