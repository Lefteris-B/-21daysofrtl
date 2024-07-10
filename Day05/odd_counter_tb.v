module odd_counter_tb ;
    reg clk;     // Clock input
    reg reset;    // Reset input
    reg [7:0] cnt_o; // 8-bit counter output

      odd_counter dut (
        .clk(clk),
        .reset(reset),
        .cnt_o(cnt_o)
    );

    initial begin
        clk = 1'b0;
        forever #7 clk=~clk;
    end

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, odd_counter_tb);

    #20
    reset <= 1'b1;
  if (cnt_o == 8'h1 ) begin
    $display("Test 1 passed");
  end 
  	#20
  	reset <= 1'b0;
    #50
    if (cnt_o == 8'h3) begin
        $display("Test 3 passed: Counter incremented correctly");
    end else 
        $display("Test 3 failed: Counter did not increment correctly");
    

 $finish;
end
endmodule
