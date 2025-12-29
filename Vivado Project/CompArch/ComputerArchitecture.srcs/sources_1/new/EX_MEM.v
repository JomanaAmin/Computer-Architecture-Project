
module EX_MEM (
  input wire clk,
  input wire reset,
  input wire [63:0] EX_ALUResult,
  input wire [63:0] EX_rdata2,
  input wire [63:0] EX_PCBranch, //PC+Immediate
  input wire EX_Zero,
  input wire [4:0] EX_rd,
  input wire EX_RegWrite,
  input wire EX_MemtoReg,
  input wire EX_MemRead,
  input wire EX_MemWrite,
  input wire EX_Branch,
  output reg [63:0] MEM_ALUResult,
  output reg [63:0] MEM_rdata2,
  output reg [63:0] MEM_PCBranch,
  output reg MEM_Zero,
  output reg [4:0] MEM_rd,
  output reg MEM_RegWrite,
  output reg MEM_MemtoReg,
  output reg MEM_MemRead,
  output reg MEM_MemWrite,
  output reg MEM_Branch
);

  always @(posedge clk) begin
    if (reset) begin
      MEM_ALUResult <= 64'b0;
      MEM_rdata2 <= 64'b0;
      MEM_PCBranch <= 64'b0;
      MEM_Zero <= 1'b0;
      MEM_rd <= 5'b0;
      MEM_RegWrite <= 1'b0;
      MEM_MemtoReg <= 1'b0;
      MEM_MemRead <= 1'b0;
      MEM_MemWrite <= 1'b0;
      MEM_Branch <= 1'b0;
    end 
    else begin
      MEM_ALUResult <= EX_ALUResult;
      MEM_rdata2 <= EX_rdata2;
      MEM_PCBranch <= EX_PCBranch;
      MEM_Zero <= EX_Zero;
      MEM_rd <= EX_rd;
      MEM_RegWrite <= EX_RegWrite;
      MEM_MemtoReg <= EX_MemtoReg;
      MEM_MemRead <= EX_MemRead;
      MEM_MemWrite <= EX_MemWrite;
      MEM_Branch <= EX_Branch;
    end
  end
endmodule




