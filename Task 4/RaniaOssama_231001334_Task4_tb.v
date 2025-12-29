`timescale 1ns / 1ps

module PC_Unit_tb;

   
    reg clk;
    reg reset;
    reg PCWrite;
    reg BranchTaken;
    reg [63:0] BranchTarget;


    wire [63:0] PC;


    PC_Unit dut (
        .clk(clk),
        .reset(reset),
        .PCWrite(PCWrite),
        .BranchTaken(BranchTaken),
        .BranchTarget(BranchTarget),
        .PC(PC)
    );

    always #5 clk = ~clk;  

    initial begin
        clk = 0;
        reset = 1;
        PCWrite = 1;
        BranchTaken = 0;
        BranchTarget = 64'd0;


        #10;
        reset = 0;

  
        #10;   
        #10;   
        #10;   

        PCWrite = 0;
        #20; 

    
        PCWrite = 1;
        #10;  

        BranchTaken = 1;
        BranchTarget = 64'd100;
        #10;  
        BranchTaken = 0;
        #10;   // PC = 104


        #10;
        $stop;
    end

endmodule