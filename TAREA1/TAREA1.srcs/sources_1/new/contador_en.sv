`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/02/2026 10:43:10 PM
// Design Name: 
// Module Name: contador_en
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


module contador_en #( 
    parameter N = 8,
    parameter MAX = 99
) (
    input logic clk, rst, enable,
    output logic [N-1:0] counter,
    output logic tick_out
);
    logic [N-1:0] counter_next;
    always_comb begin
        tick_out = 1'b0; 
        if (rst) begin
            counter_next = 'd0;
        end else if (enable) begin
            if (counter == MAX[N-1:0]) begin
                counter_next = 'd0;
                tick_out = 1'b1;
            end else begin
                counter_next = counter + 'd1;
            end
        end else begin
            counter_next = counter;
        end
    end
    
    always_ff @(posedge clk) begin 
        counter <= counter_next;
    end
endmodule
