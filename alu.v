`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2024 09:50:05
// Design Name: 
// Module Name: ALU
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


module ALU(
    input wire clk,
    input wire [15:0] A,
    input wire [15:0] B,
    input wire reset_n,
    input wire [2:0] select,
    output wire [15:0] F
    );
reg [15:0] F_out;
reg [15:0] ALU_out;

always @ (posedge clk)begin
    if (~reset_n)begin  //active low reset
        F_out <= 16'd0;
    end else begin
       F_out <= ALU_out;
    end
end

always @ (*) begin  // Combinational logic
    case(select)
        3'd0:ALU_out = A+B;                 // Addition
        3'd1:ALU_out = A+(~B)+16'd1;        // Subtraction(2's complement addition)
        3'd2:ALU_out = ~A;                  // Bitwise NOT of A
        3'd3:ALU_out = ~B;                  // Bitwise NOT of B
        3'd4:ALU_out = (A>B)?16'd1:16'd0;   // Comparator
        default:ALU_out = A+B;
    endcase
end

assign F = F_out;

endmodule
