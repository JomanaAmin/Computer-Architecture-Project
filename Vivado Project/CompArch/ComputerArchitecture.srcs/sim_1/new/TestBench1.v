`timescale 1ns / 1ps

module TestBench1_tb();
    reg clk;
    reg reset;
    reg flush;
    wire [63:0] pc_out  = uut.PC;
    wire [63:0] alu_res = uut.ex_ALU_result;
    wire [1:0] fwdA     = uut.forwardA;
    wire [1:0] fwdB     = uut.forwardB;
    PipelineProcessor uut (
        .clk(clk),
        .reset(reset),
        .flush(flush)
    );

    // Clock generation (10ns period -> 100MHz)
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        reset = 1;
        flush = 0;

        // Release reset
        #20;
        reset = 0;

        // Run long enough to clear the 5-stage pipeline and finish the infinite loop
        #250; 
// Let the simulation run long enough to clear the 5-stage pipeline
        #250; 

        $display("_________________________________________");
        $display("          SIMULATION COMPLETED           ");
        $display("Register x7  : %d", uut.regfile.regs[7]);
        $display("Register x17 : %d", uut.regfile.regs[17]);
        $display("Register x18 : %d", uut.regfile.regs[18]);
        $display("Register x24 : %d", uut.regfile.regs[24]);
        
        // Final Data Memory Values (Using your 'dataMemory' naming)
        // We check index 6 because 48 / 8 bytes per word = 6
        $display("Memory [48]  : %d", uut.DataMem.dataMemory[6]);        
        $stop;
    end
endmodule