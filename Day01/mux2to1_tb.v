module mux2to1_tb;

    // Inputs
    reg [7:0] a_i;
    reg [7:0] b_i;
    reg sel_i;
    
    // Output
    wire [7:0] y_o;
    
    // Instantiate the mux design
    mux2to1 dut (
        .a_i(a_i),
        .b_i(b_i),
        .sel_i(sel_i),
        .y_o(y_o)
    );
    
    // Clock generation
    reg clk;
    always #5 clk = ~clk;
    
    // Test stimulus
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars;
        // Initialize inputs
        a_i = 8'b10101010;
        b_i = 8'b01010101;
        sel_i = 0;
        clk=1'b1;
        
        // Apply inputs and check outputs
        #20;
      assert(y_o === b_i) $display("Test 1 passed!");
        
        sel_i = 1;
        #20;
      assert(y_o === a_i) $display("Test 2 passed!");
        
        $display("All tests passed!");
        $finish;
    end
    
endmodule