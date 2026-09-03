`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2026 01:03:56 PM
// Design Name: 
// Module Name: tick
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


module tick(
    input logic clk, rst,
    output logic tick
);
    logic [19:0] count_wire;
    logic _rst;
    
    contador #(.N(20)) _contador (
        .clk(clk),
        .rst(_rst),
        .counter(count_wire)
    );
    
    always_comb begin
        tick = (count_wire == 20'd999_999); // Cuenta desde 0, son 100M / 1M
        _rst = rst || tick;
    end
    
endmodule
