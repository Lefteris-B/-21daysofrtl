module dFlipFlop_tb;
  
    reg clk;
    reg reset;
    reg d_i;
    reg q_norst_o;
    reg q_syncrst_o;
    reg q_asyncrst_o;


dFlipFlop dut (
    .clk(clk),
    .reset(reset),
    .d_i(d_i),
    .q_norst_o(q_norst_o),
    .q_syncrst_o(q_syncrst_o),
    .q_asyncrst_o(q_asyncrst_o)
);

always #10 clk <= ~clk;
always #7 d_i <= ~d_i;
always #13 reset <= ~reset;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars;

    reset = 1'b0;
    clk = 1'b1;
    d_i = 1'b1;

    #20;
    assert(q_norst_o === 1'b1) $display("Test 1 passed!");

    #20;
    
  assert(q_syncrst_o === 1'b0) $display("Test 2 passed!");

    #20;
    
  assert(q_syncrst_o === 1'b0) $display("Test 3 passed!");

    #20;
   
    assert(q_asyncrst_o === 1'b0) $display("Test 4 passed!");

    #20;
    
  assert(q_asyncrst_o === 1'b0) $display("Test 5 passed!");

    $finish;
end

endmodule