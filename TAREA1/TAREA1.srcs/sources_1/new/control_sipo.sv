`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2026 08:16:11 PM
// Design Name: 
// Module Name: control_sipo
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


module control_sipo# ( parameter N = 8 ) (
    input logic clk, rst, start,
    output logic enable, valid, //enable es para habilitar el shifter
    input logic [N-1:0] counter
    );
    
    logic busy, busy_next, enable_next, valid_next;
    
    always_comb begin
        busy_next = busy;
        enable_next = 1'b0;
        valid_next = 1'b0;
        if (busy) begin
            if (counter != (N-1)) begin
                enable_next = 1'b1;
            end else begin
                enable_next = 1'b0;
                valid_next = 1'b1;
                busy_next = 1'b0;
            end 
        end else if (start) begin
            busy_next = 1'b1;
            enable_next = 1'b1;
        end
    end
    
    always_ff @(posedge clk) begin
        if (rst) begin
            busy   <= 1'b0;
            valid  <= 1'b0;
            enable <= 1'b0;
        end else begin
            busy <= busy_next;
            valid <= valid_next;
            enable <= enable_next;
        end
    end
    
endmodule
