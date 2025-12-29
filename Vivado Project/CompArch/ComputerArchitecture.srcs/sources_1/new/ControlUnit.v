`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2025 01:54:04 AM
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit(
  input wire [6:0] opcode,
  output reg Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite,
  output reg [1:0] ALUOp
);
  always @(*) begin
    ALUSrc = 0;
    MemtoReg = 0;
    RegWrite = 0;
    MemRead = 0;
    MemWrite = 0;
    Branch = 0;
    ALUOp = 2'b00;
    case (opcode)
      7'b0110011: begin   //R-type
        RegWrite = 1;
        ALUOp = 2'b10;
      end
      7'b0000011: begin  //Load
        ALUSrc = 1;
        MemtoReg = 1;
        RegWrite = 1;
        MemRead = 1;
      end
      7'b0100011: begin  //Store
        ALUSrc = 1;
        MemWrite = 1;
      end
      7'b1100011: begin // Beq
        Branch = 1;
        ALUOp = 2'b01;
      end
      7'b0010011: begin //I-type
        ALUSrc = 1;
        RegWrite = 1;
        ALUOp = 2'b11;
      end
    endcase
  end
endmodule

