`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2026 02:01:12 PM
// Design Name: 
// Module Name: char_rom
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


module char_rom(
    input logic [2:0] sel,
    output logic [6:0] seg,
    input logic [6:0] centesimas,
    input logic [5:0] segundos, minutos
);
    logic [3:0] data_in;
    // Logica combinacional de salida
    always_comb begin
        case (data_in)
            4'd0: seg = 7'b1000000; 
            4'd1: seg = 7'b1111001; 
            4'd2: seg = 7'b0100100; 
            4'd3: seg = 7'b0110000; 
            4'd4: seg = 7'b0011001; 
            4'd5: seg = 7'b0010010; 
            4'd6: seg = 7'b0000010; 
            4'd7: seg = 7'b1111000; 
            4'd8: seg = 7'b0000000; 
            4'd9: seg = 7'b0010000; 
            4'd10: seg = 7'b0111111;
            default: seg = 7'b1111111;
        endcase
    end
    // Logica combinacional de entradas (de tiempo)
    always_comb begin
        case (sel)
            3'd0: data_in = 4'(minutos / 10);
            3'd1: data_in = 4'(minutos % 10);
            3'd2: data_in = 4'd10; // Guion
            3'd3: data_in = 4'(segundos / 10);
            3'd4: data_in = 4'(segundos % 10);
            3'd5: data_in = 4'd10; // Guion
            3'd6: data_in = 4'(centesimas / 10);
            3'd7: data_in = 4'(centesimas % 10);
            default: data_in = 4'd10; // decision arbitraria
        endcase
    end
endmodule
