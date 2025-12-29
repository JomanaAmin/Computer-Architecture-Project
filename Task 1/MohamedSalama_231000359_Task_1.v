module ALU (
    input  wire [63:0] A,
    input  wire [63:0] B,
    input  wire [3:0]  ALUCtl,
    output reg  [63:0] ALUOut,
    output wire        Zero
);

assign Zero = (ALUOut == 64'b0);

always @(*) begin
    case (ALUCtl)
        4'b0010: ALUOut = A + B;                                  // add
        4'b0110: ALUOut = A - B;                                  // sub
        4'b0100: ALUOut = ($signed(A) < $signed(B)) ? 64'd1 : 64'd0; // slt 
        4'b0000: ALUOut = A & B;                                  // and
        4'b0001: ALUOut = A | B;                                  // or
        4'b0111: ALUOut = A ^ B;                                  // xor 
        4'b0011: ALUOut = A << B[5:0];                            // sll 
        4'b1000: ALUOut = A >> B[5:0];                            // srl 
        4'b1010: ALUOut = $signed(A) >>> B[5:0];                  // sra 
        default: ALUOut = 64'b0;
    endcase
end

endmodule