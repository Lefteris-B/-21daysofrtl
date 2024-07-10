`timescale 1ns / 1ps
`default_nettype none

module edge_detect_tb;

    reg clk;
    reg reset;
    reg a_i;
    wire rising_edge_o;
    wire falling_edge_o;

    // Instantiate the Device Under Test (DUT)
    edge_detect dut (
        .clk(clk),
        .reset(reset),
        .a_i(a_i),
        .rising_edge_o(rising_edge_o),
        .falling_edge_o(falling_edge_o)
    );

    // Clock generation
    initial begin
        clk = 1'b1;
        forever #5 clk = ~clk;
    end

    // Input signal generation
    initial begin
        a_i = 1'b0;
        forever #12 a_i = ~a_i;
    end

    // Test sequence
    initial begin
      	$dumpfile("dump.vcd");
        $dumpvars;
        // Initialize signals
        reset = 1'b0;
        #20 reset = 1'b1; // Apply reset
        #20 reset = 1'b0; // Release reset

        // Wait for some time and check outputs
        #40;
        if (rising_edge_o !== 1'b0 || falling_edge_o !== 1'b0) begin
            $display("Test 1 failed!");
            $finish;
        end else begin
            $display("Test 1 passed!");
        end

        #40;
        if (rising_edge_o !== 1'b1) begin
            $display("Test 2 failed!");
            $finish;
        end else begin
            $display("Test 2 passed!");
        end

        #40;
        if (falling_edge_o !== 1'b1) begin
            $display("Test 3 failed!");
            $finish;
        end else begin
            $display("Test 3 passed!");
        end

        $display("All tests passed");
        $finish;
    end

endmodule
