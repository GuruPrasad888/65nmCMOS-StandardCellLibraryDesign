`timescale 1ns / 1ps

module tb_ALU;
reg [15:0] A;
reg [15:0] B;
reg [2:0] select;
reg clk;
reg reset_n;
wire [15:0] F;

always #5 clk = ~clk;   // Generate a clock of 100MHz

ALU dut (
    .A(A),
    .B(B),
    .select(select),
    .clk(clk),
    .reset_n(reset_n),
    .F(F)
);  // Instantiate ALU module

initial begin   // Input stimulus
    clk = 1;
    A = 16'd0;
    B = 16'd0;
    reset_n = 0;
    select = 3'd0;
    #10;
    reset_n = 1;
    A = 16'd8;
    B = 16'd4;
    #10;
    select = 3'd1;
    #10;
    select = 3'd2;
    #10
    select = 3'd3;
    #10
    select = 3'd4;
    #10
    $finish;
end

endmodule
