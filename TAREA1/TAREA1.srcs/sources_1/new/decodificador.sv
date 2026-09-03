`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2026 12:55:48 PM
// Design Name: 
// Module Name: decodificador
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


module decodificador(
    input logic [2:0] sel,
    output logic [7:0] anodes
);
    always_comb begin
        case (sel)
            3'd0: anodes = 8'b01111111;
            3'd1: anodes = 8'b10111111;
            3'd2: anodes = 8'b11011111;
            3'd3: anodes = 8'b11101111;
            3'd4: anodes = 8'b11110111;
            3'd5: anodes = 8'b11111011;
            3'd6: anodes = 8'b11111101;
            3'd7: anodes = 8'b11111110;
            default: anodes = 8'b11111111;     
        endcase
    end
endmodule
