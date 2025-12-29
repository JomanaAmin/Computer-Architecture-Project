module ALU_tb;
    reg  [63:0] A, B;
    reg  [3:0]  ALUCtl;
    wire [63:0] ALUOut;
    wire        Zero;

    ALU dut (.A(A), .B(B), .ALUCtl(ALUCtl), .ALUOut(ALUOut), .Zero(Zero));

    initial begin
        $monitor("Time=%0t | Op=%b | A=%d B=%d | Out=%d | Zero=%b", 
                 $time, ALUCtl, A, B, ALUOut, Zero);

        // add
        A = 10; B = 5; ALUCtl = 4'b0010; #10;

        // sub
        A = 10; B = 5; ALUCtl = 4'b0110; #10;

        // slt: -5 < 10 → true (1)
        A = -5; B = 10; ALUCtl = 4'b0100; #10;

        // slt: 20 < 5 → false (0)
        A = 20; B = 5; ALUCtl = 4'b0100; #10;

        // xor
        A = 'hAA; B = 'h55; ALUCtl = 4'b0111; #10; // AA ^ 55 = FF
        // sll: 1 << 3 = 8
        A = 1; B = 3; ALUCtl = 4'b0011; #10;

        // srl: 64 >> 2 = 16
        A = 64; B = 2; ALUCtl = 4'b1000; #10;

        // and
        A = 'hFF; B = 'h0F; ALUCtl = 4'b0000; #10;

        // or
        A = 'hF0; B = 'h0F; ALUCtl = 4'b0001; #10;

        // Zero flag test
        A = 100; B = 100; ALUCtl = 4'b0110; #10; // sub Zero=1

        $finish;
    end
endmodule