`timescale 1ns / 1ps

module imm_tb;

    reg  [31:0] instr;
    wire [63:0] imm;

    Immediate uut (
        .instr(instr),
        .imm(imm)
    );

    initial begin
        // I-Type (addi, ld)
        instr = 2162707;
        #1;
        $display("%0dns\t%d", $time, imm);

        instr = 17051651;
        #1;
        $display("%0dns\t%d", $time, imm);

        // S-Type (sd)
        instr = 5441571;
        #1;
        $display("%0dns\t%d", $time, imm);

        // B-Type (beq)
        instr = -33485597;
        #1;
        $display("%0dns\t%d", $time, imm);

        instr = 4294243;
        #1;
        $display("%0dns\t%d", $time, imm);

        // Default
        instr = 2130355;
        #1;
        $display("%0dns\t%d", $time, imm);

        $finish;
    end
endmodule