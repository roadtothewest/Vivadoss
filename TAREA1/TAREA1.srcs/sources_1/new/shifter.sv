`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2026 01:25:54 AM
// Design Name: 
// Module Name: shifter
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


module shifter# (parameter N = 8)(
    input logic clk, rst, enable,
    input logic in,
    output logic out
);
    logic [N-1:0] buffer;
    always_ff @(posedge clk) begin
        if (rst == 1'b1) begin
            buffer <= 'd0;
            out <= 'd0;
        end else if (enable == 1'b1) begin
            buffer <= {buffer[N-2:0], in};
        end
    end
    assign out = buffer[N-1];
endmodule
