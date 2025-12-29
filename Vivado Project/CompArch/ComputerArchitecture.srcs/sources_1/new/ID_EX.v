

module ID_EX (
  input wire clk,
  input wire flush,
  input wire reset,
  input wire [63:0] ID_rdata1,
  input wire [63:0] ID_rdata2,
  input wire [4:0] ID_rs1,
  input wire [4:0] ID_rs2,
  input wire [63:0] ID_imm,
  input wire [4:0] ID_rd,
  input wire [63:0] ID_PC,
  input wire [2:0] ID_func3,
  input wire [6:0] ID_func7,
  input wire ID_RegWrite,
  input wire ID_MemtoReg,
  input wire ID_MemRead,
  input wire ID_MemWrite,
  input wire ID_ALUSrc,
  input wire ID_Branch,
  input wire [1:0] ID_ALUOp,
  output reg [63:0] EX_rdata1,
  output reg [63:0] EX_rdata2,  
  output reg [4:0] EX_rs1,
  output reg [4:0] EX_rs2,
  output reg [63:0] EX_imm,
  output reg [4:0] EX_rd,
  output reg [63:0] EX_PC,
  output reg [2:0] EX_func3,
  output reg [6:0] EX_func7,
  output reg EX_RegWrite,
  output reg EX_MemtoReg,
  output reg EX_MemRead,
  output reg EX_MemWrite,
  output reg EX_ALUSrc,
  output reg EX_Branch,
  output reg [1:0] EX_ALUOp
);
  
  always @(posedge clk) begin
    if (flush || reset) begin
      EX_rdata1 <= 64'b0;
      EX_rdata2 <= 64'b0;
      EX_rs1 <= 5'b0;
      EX_rs2 <= 5'b0;
      EX_imm <= 64'b0;
      EX_rd <= 5'b0;
      EX_PC <= 64'b0;
      EX_func3 <= 3'b0;
      EX_func7 <= 7'b0;
      EX_RegWrite <= 0;
      EX_MemtoReg <= 0;
      EX_MemRead  <= 0;
      EX_MemWrite <= 0;
      EX_ALUSrc <= 0;
      EX_ALUOp <= 2'b00;
      EX_Branch <= 0;
    end 
    else begin
      EX_rdata1 <= ID_rdata1;
      EX_rdata2 <= ID_rdata2;
      EX_rs1 <= ID_rs1;
      EX_rs2 <= ID_rs2;
      EX_imm <= ID_imm;
      EX_rd <= ID_rd;
      EX_PC <= ID_PC;
      EX_func3 <= ID_func3;
      EX_func7 <= ID_func7;
      EX_RegWrite <= ID_RegWrite;
      EX_MemtoReg <= ID_MemtoReg;
      EX_MemRead <= ID_MemRead;
      EX_MemWrite <= ID_MemWrite;
      EX_ALUSrc <= ID_ALUSrc;
      EX_ALUOp <= ID_ALUOp;
      EX_Branch <= ID_Branch; 
    end
  end
endmodule



