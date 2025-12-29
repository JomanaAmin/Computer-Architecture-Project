module ForwardingUnit(
    input  wire [4:0] EX_rs1, EX_rs2,   // source registers of current instruction
    input  wire [4:0] MEM_rd, WB_rd,    // destination registers in later stages
    input  wire MEM_RegWrite, WB_RegWrite,
    output reg [1:0] forwardA, forwardB
);
    always @(*) begin
        forwardA = 2'b00;
        forwardB = 2'b00;

        // EX hazard (forward from EX/MEM)
        if (MEM_RegWrite && MEM_rd != 0 && MEM_rd == EX_rs1)
            forwardA = 2'b10;
        if (MEM_RegWrite && MEM_rd != 0 && MEM_rd == EX_rs2)
            forwardB = 2'b10;

        // MEM/WB hazard (forward from WB)
        if (WB_RegWrite && WB_rd != 0 && WB_rd == EX_rs1)
            forwardA = 2'b01;
        if (WB_RegWrite && WB_rd != 0 && WB_rd == EX_rs2)
            forwardB = 2'b01;
    end
endmodule
