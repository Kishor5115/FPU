`timescale 1ns/1ps

module tb_alu;

    reg FPUCLK;
    reg RST;
    reg [31:0] A, B;
    reg [2:0] CTRL;
    wire [31:0] OUT;

    // Instantiate the ALU
    alu uut (
        .FPUCLK(FPUCLK),
        .RST(RST),
        .A(A),
        .B(B),
        .CTRL(CTRL),
        .OUT(OUT)
    );

    // Clock generation (20ns period)
    always #10 FPUCLK = ~FPUCLK;

    initial begin
        $display("Starting ALU FPU Testbench...");
        $dumpfile("alu_tb.vcd");
        $dumpvars(0, tb_alu);

        FPUCLK = 0;
        RST = 1;
        A = 0;
        B = 0;
        CTRL = 3'b111; // NONE
        #40;

        RST = 0;
        #40;
        RST = 1;
        #40;

        // ---------------------------
        // ADD: 3.0 + 4.0 = 7.0
        // ---------------------------
        A = 32'h41C80000; // 3.0
        B = 32'h40800000; // 4.0
        CTRL = 3'b000;    // ADD
        $display("ADD: %h + %h", A, B);
        #250; // Wait for pipeline
        $display("ADD Result: %h (Expected ~40e00000 = 7.0)", OUT);
        #20;

        // ---------------------------
        // SUB: 3.0 - 4.0 = -1.0
        // ---------------------------
        CTRL = 3'b001;    // SUB
        $display("SUB: %h - %h", A, B);
        #250;
        $display("SUB Result: %h (Expected ~bf800000 = -1.0)", OUT);
        #20;

        // ---------------------------
        // MUL: 3.0 * 4.0 = 12.0
        // ---------------------------
        CTRL = 3'b010;    // MUL
        $display("MUL: %h * %h", A, B);
        #250;
        $display("MUL Result: %h (Expected ~41400000 = 12.0)", OUT);
        #20;

        // ---------------------------
        // DIV: 3.0 / 4.0 = 0.75
        // ---------------------------
        CTRL = 3'b011;    // DIV
        $display("DIV: %h / %h", A, B);
        #1000; // Allow extra time for division
        $display("DIV Result: %h (Expected ~3f400000 = 0.75)", OUT);
        #40;

        $display("Testbench Complete.");
        $finish;
    end

endmodule
