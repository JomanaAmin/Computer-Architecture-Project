`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2025 02:00:49 AM
// Design Name: 
// Module Name: PC_Unit
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


module PC_Unit (
    input  wire        clk,
    input  wire        reset,

    input  wire        PCWrite,
    input  wire        BranchTaken,
    input  wire [63:0] BranchTarget,

    output reg  [63:0] PC
);

    wire [63:0] PC_plus4;
    wire [63:0] PC_next;

    assign PC_plus4 = PC + 64'd4;

    assign PC_next = (BranchTaken) ? BranchTarget : PC_plus4;

    always @(posedge clk or posedge reset) begin
        if (reset)
            PC <= 64'd0;
        else if (PCWrite)
            PC <= PC_next;
    end

endmodule