`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2023 02:00:29 PM
// Design Name: 
// Module Name: up_down_counter
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


module up_down_counter (
    input clk_in,
    input clk_en,
    input reset,
    input load, 
    input [3:0] data,
    output reg [3:0] count,
    output thresh
);
    parameter UP_OR_DOWN = 1;
    parameter INCREMENT = 1;
    parameter LIMIT = 9;

    initial begin count <= 4'b0000; end

    always @(posedge clk_in or posedge load) begin
        if (load) begin count <= data; end

        else if (UP_OR_DOWN == 1) begin
            if (reset == 1) begin count <= 0; end
            else if (clk_en == 1) begin  
                if (count >= LIMIT) begin count <= 0; end 
                else begin
                    count <= count + INCREMENT;
                end
            end
        end else begin
            if (reset == 1) begin count <= LIMIT;end
            else if (clk_en == 1) begin  
                if (count <= 0) begin count <= LIMIT; end 
                else begin
                    count <= count - INCREMENT;
                end
           end
        end
    end

    assign thresh = (UP_OR_DOWN == 1) ? ((count == LIMIT) ? 1:0) : ((count == 0) ? 1:0);
endmodule