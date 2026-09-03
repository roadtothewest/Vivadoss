`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2026 07:46:34 PM
// Design Name: 
// Module Name: shifter_sipo
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


module shifter_sipo# (parameter N = 8)(
    input logic clk, rst, in, enable,
    output logic [N-1:0] out
    );
    always_ff @(posedge clk) begin
        if (rst == 1'b1) begin
            out <= 'd0;
        end else if (enable == 1'b1) begin
            out <= {out[N-2:0], in};
        end
    end
endmodule
