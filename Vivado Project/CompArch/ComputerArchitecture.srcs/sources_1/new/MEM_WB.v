
module MEM_WB (
  input wire clk, 
  input wire reset, 
  input wire [63:0] MEM_ALUResult,
  input wire [63:0] MEM_MemData,
  input wire [4:0]  MEM_rd,
  input wire MEM_RegWrite,
  input wire MEM_MemtoReg,
  output reg [63:0] WB_ALUResult,
  output reg [63:0] WB_MemData,
  output reg [4:0]  WB_rd,
  output reg WB_RegWrite,
  output reg WB_MemtoReg
);

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      WB_ALUResult <= 64'b0;
      WB_MemData <= 64'b0;
      WB_rd <= 5'b0;
      WB_RegWrite <= 1'b0;
      WB_MemtoReg <= 1'b0;
    end 
    else begin
      WB_ALUResult <= MEM_ALUResult;
      WB_MemData <= MEM_MemData;
      WB_rd <= MEM_rd;
      WB_RegWrite <= MEM_RegWrite;
      WB_MemtoReg <= MEM_MemtoReg;
    end
  end
endmodule
