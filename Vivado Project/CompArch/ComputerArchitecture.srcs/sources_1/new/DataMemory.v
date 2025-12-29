`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2025 02:02:39 AM
// Design Name: 
// Module Name: DataMemory
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

// Code your design here
module DataMemory(
    input wire [31:0] address,
    input wire clk,
    input wire [63:0] writeData,
    input wire memWrite,
    output reg [63:0] readData,
    input wire memRead
);
    reg [63:0] dataMemory [0:127];
    integer i;

    initial begin
        for (i = 0; i < 128; i = i + 1) begin
            dataMemory[i] = 64'b0; // Initialize to 0 to avoid 'X'
        end
    end

    always @(posedge clk) begin
        if (memWrite)
            dataMemory[address[31:3]] <= writeData;

        if (memRead)
            readData <= dataMemory[address[31:3]];
        else
            readData <= 64'b0;
    end
endmodule