module IF_ID (
  input wire clk,
  input wire reset,
  input wire flush,
  input wire [63:0] IF_PC,
  input wire [31:0] IF_instruction,
  output reg [63:0] ID_PC,
  output reg [31:0] ID_instruction
);

  always @(posedge clk) begin
    if (reset || flush) begin
      ID_PC <= 64'b0;
      ID_instruction <= 32'h00000013; //NOP -> addi x0,x0,0
    end
    else begin
      ID_PC <= IF_PC;
      ID_instruction <= IF_instruction;
    end
  end
endmodule
