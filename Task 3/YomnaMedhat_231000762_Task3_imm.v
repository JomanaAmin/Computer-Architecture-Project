`timescale 1ns / 1ps

module Immediate (
    input  wire [31:0] instr,
    output reg  [63:0] imm
);

    wire [6:0] opcode = instr[6:0];
    wire [2:0] funct3 = instr[14:12];

    always @(*) begin
        case (opcode)

            // addi, andi, ori, xori, ld
            7'b0010011,
            
            // ld
            7'b0000011:
                imm = {{52{instr[31]}}, instr[31:20]};

            // sd
            7'b0100011:
                imm = {{52{instr[31]}}, instr[31:25], instr[11:7]};

            // beq
            7'b1100011:
                imm = {{51{instr[31]}},
                       instr[31],
                       instr[7],
                       instr[30:25],
                       instr[11:8],
                       1'b0};

            default:
                imm = 64'b0;
        endcase
    end
endmodule