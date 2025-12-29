`timescale 1ns / 1ps

module register (
    input wire clk,
    input wire we,
    input wire [4:0] rs1,
    input wire [4:0] rs2,
    input wire [4:0] rd,
    input wire [63:0] wd,
    output wire [63:0] rd1,
    output wire [63:0] rd2
);

    reg [63:0] regs [31:0];
    integer i;

    initial begin
        for (i = 0; i < 32; i = i + 1)
            regs[i] = 64'b0;
    end

    always @(posedge clk) begin
        if (we && rd != 0) begin
            regs[rd] <= wd;
        end
    end

    assign rd1 = (rs1 == 0) ? 64'b0 : regs[rs1];
    assign rd2 = (rs2 == 0) ? 64'b0 : regs[rs2];

endmodule