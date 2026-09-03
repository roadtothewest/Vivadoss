`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/02/2026 10:57:50 PM
// Design Name: 
// Module Name: cronometer
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


module cronometer(
    input logic clk, rst,
    output logic [7:0] anodes,
    output logic [6:0] segments
    );
    // Centesimas, Segundos, Minutos:
    logic tick, tick_seg, tick_min;
    logic [6:0] centesimas;
    logic [5:0] segundos, minutos;
    tick _tick(
        .clk(clk),
        .rst(rst),
        .tick(tick)
    );
    contador_en #(.N(7), .MAX(99)) _centesimas (
        .clk(clk),
        .rst(rst),
        .enable(tick),
        .counter(centesimas),
        .tick_out(tick_seg)
    );
    contador_en #(.N(6), .MAX(59)) _segundos (
        .clk(clk),
        .rst(rst),
        .enable(tick_seg),
        .counter(segundos),
        .tick_out(tick_min)
    );
    contador_en #(.N(6), .MAX(59)) _minutos (
        .clk(clk),
        .rst(rst),
        .enable(tick_min),
        .counter(minutos),
        .tick_out()
    );
    // Display
    logic [2:0] sel_wire;
    prescaler _prescaler (
        .clk(clk),
        .rst(rst),
        .sel(sel_wire)
    );
    
    decodificador _anode_decoder (
        .sel(sel_wire),
        .anodes(anodes)
    );
    
    char_rom _char_rom (
        .sel(sel_wire),
        .centesimas(centesimas),
        .segundos(segundos),
        .minutos(minutos),
        .seg(segments)
    );
endmodule
