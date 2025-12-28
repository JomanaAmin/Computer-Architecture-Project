// Code your design here
module InstructionMemory (
  input  wire [63:0] address,   // PC
  output wire [31:0] instruction
  );
  reg [31:0] instructionMemory [0:1023]; // 1024 instructions

  
    initial begin
        $readmemh("program.hex", mem);
    end

  
  assign instruction = instructionMemory[address[11:2]];
endmodule