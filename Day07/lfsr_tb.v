module lfsr_tb ;
    reg clk;    
    reg reset;    
    reg [3:0] lfsr_o;

      lfsr dut (
        .clk(clk),
        .reset(reset),
        .lfsr_o(lfsr_o)
    );

    initial begin
        clk = 1'b0;
        forever #7 clk=~clk;
    end

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0, lfsr_tb);
    #20
    reset <= 1'b1;
  if (lfsr_o == 4'b1010) begin
    $display("Test 1 passed");
  end else
    $display("Test 1 failed");
  	#20
  	reset <= 1'b0;
    #50
  if (lfsr_o != 3'b1) begin
        $display("Test 2 passed");
    end else 
        $display("Test 2 failed");
    #100
    
 $finish;
end
endmodule
