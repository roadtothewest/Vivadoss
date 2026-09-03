`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2026 08:53:29 PM
// Design Name: 
// Module Name: sipo
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

module sipo #(parameter N = 8) (
    input  logic clk,
    input  logic rst,
    input  logic start,
    input  logic serial_in,
    output logic [N-1:0] parallel_out,
    output logic valid
);

    // Señales internas para interconexión
    logic enable;
    logic [N-1:0] count_val;

    // Instancia del Control
    control_sipo #(.N(N)) ctrl (
        .clk(clk),
        .rst(rst),
        .start(start),
        .counter(count_val), 
        .enable(enable),
        .valid(valid)
    );

    // Instancia del Contador (ahora recibe el enable directamente)
    contador_sipo #(.N(N)) cnt (
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .counter(count_val)
    );

    // Instancia del Shifter
    shifter_sipo #(.N(N)) shf (
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .in(serial_in),
        .out(parallel_out)
    );

endmodule