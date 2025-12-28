// Code your design here
module DataMemory(
  input wire [31:0] address,//ALU result (immediate value offset + rs1) 
  input wire clk,

  //when STORING
  input wire [63:0] writeData,
  input wire memWrite,
  //when LOADING
  output reg [63:0] readData,
  input wire memRead
  );
  reg [63:0] dataMemory [0:127]; // 128 × 64-bit words

  always @(posedge clk) begin
    if (memWrite)
        dataMemory[address[31:3]] <= writeData;

    if (memRead)
        readData <= dataMemory[address[31:3]];
    else
        readData <= 64'b0;
  end
endmodule