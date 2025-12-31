`timescale 1ns / 1ps

module regfile_tb;

    reg clk;
    reg we;
    reg [4:0] rs1, rs2, rd;
    reg [63:0] wd;
    wire [63:0] rd1, rd2;

    Register uut (
        .clk(clk),
        .we(we),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .wd(wd),
        .rd1(rd1),
        .rd2(rd2)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        we = 0; rs1 = 0; rs2 = 0; rd = 0; wd = 0;
        #10;

        // Write 42 to x1
        we = 1; rd = 5'd1; wd = 64'd42;
        #10;

        // Read x1 and x0
        we = 0; rs1 = 5'd1; rs2 = 5'd0;
        #10;
        $display("%0dns\t%0d\t%0d\t%0d\t%0d\t%0d\t%0d", $time, rs1, rs2, rd, wd, rd1, rd2);

        // Write 100 to x2
        we = 1; rd = 5'd2; wd = 64'd100;
        #10;

        // Read x2 and x1
        we = 0; rs1 = 5'd2; rs2 = 5'd1;
        #10;
        $display("%0dns\t%0d\t%0d\t%0d\t%0d\t%0d\t%0d", $time, rs1, rs2, rd, wd, rd1, rd2);

        // Attempt to write 999 to x0 (should be ignored)
        we = 1; rd = 5'd0; wd = 64'd999;
        #10;

        // Read x0 and x1
        we = 0; rs1 = 5'd0; rs2 = 5'd1;
        #10;
        $display("%0dns\t%0d\t%0d\t%0d\t%0d\t%0d\t%0d", $time, rs1, rs2, rd, wd, rd1, rd2);

        $finish;
    end

endmodule