`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2025 01:58:26 AM
// Design Name: 
// Module Name: ALUControl
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




module ALUControl(
  input wire [1:0] ALUOp,
  input wire [2:0] func3,
  input wire [6:0] func7,
  output reg [3:0] ALUCtl
);
  always @(*) begin
    ALUCtl = 4'b0010;
    case (ALUOp)
      2'b00: ALUCtl = 4'b0010; //ADD (load, store)
      2'b01: ALUCtl = 4'b0110; //SUBTRACT (branch)
      2'b10: begin //R-type
        case (func3)
          3'b000: begin
            case (func7)
              7'b0000000: ALUCtl = 4'b0010; //ADD
              7'b0100000: ALUCtl = 4'b0110; //SUBTRACT
            endcase
          end
          3'b100: ALUCtl = 4'b0111; //XOR
          3'b110: ALUCtl = 4'b0001; //OR
          3'b111: ALUCtl = 4'b0000; //AND
          3'b001: ALUCtl = 4'b0011; //SLL
          3'b010: ALUCtl = 4'b0100; //SLT
          3'b101: begin
            case (func7)
              7'b0000000: ALUCtl = 4'b1000; //SRL
              7'b0100000: ALUCtl = 4'b1010; //SRA
            endcase
          end
        endcase
      end
      2'b11: begin //I-type
        case (func3)
          3'b100: ALUCtl = 4'b0111; //XORi
          3'b110: ALUCtl = 4'b0001; //ORi
          3'b111: ALUCtl = 4'b0000; //ANDi
          3'b001: ALUCtl = 4'b0011; //SLLi
          3'b000: ALUCtl = 4'b0010; //ADDi
          3'b010: ALUCtl = 4'b0100; //SLTi
          3'b101: begin
            case (func7)
              7'b0000000: ALUCtl = 4'b1000; //SRLi
              7'b0100000: ALUCtl = 4'b1010; //SRAi
            endcase
          end
        endcase
      end
    endcase
  end
endmodule
          
          
          
        