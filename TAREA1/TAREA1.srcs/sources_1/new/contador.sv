`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2026 07:39:42 PM
// Design Name: 
// Module Name: contador
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


module contador# ( parameter N = 8 ) (
    input logic clk, rst,
    output logic [N-1:0] counter
);
    logic [N-1:0] counter_next;
    always_comb begin 
        if (rst)
            counter_next = 'd0;
        else
            counter_next = counter + 'd1;
    end
    always_ff @(posedge clk) begin 
        counter <= counter_next;
    end
endmodule