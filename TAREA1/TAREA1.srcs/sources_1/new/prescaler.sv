`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2026 12:40:50 PM
// Design Name: 
// Module Name: prescaler
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


module prescaler(
    input logic clk, rst,
    output logic [2:0]sel
);
    logic [19:0] count_wire; // Refresco ~95.36743Hz
    
    contador #(.N(20)) _contador (
        .clk(clk),
        .rst(rst),
        .counter(count_wire)
    );
    
    assign sel = count_wire[19:17];
    
endmodule
