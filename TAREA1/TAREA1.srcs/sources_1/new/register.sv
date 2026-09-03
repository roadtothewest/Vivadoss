`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2026 01:14:11 AM
// Design Name: 
// Module Name: register
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


module register(
    input logic [3:0] D,
    input logic clk, rst,
    output logic [3:0] Q
);
    always_ff @(posedge clk) begin
        if (rst ==1) begin
            Q <= 'd0;
        end else begin
            Q <= D;
        end
    end
endmodule
