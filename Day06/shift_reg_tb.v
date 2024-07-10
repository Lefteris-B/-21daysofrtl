module shift_reg_tb ;
    reg clk;    
    reg reset;  
    reg x_i;  
    reg [3:0] sr_o;

      shift_reg dut (
        .clk(clk),
        .reset(reset),
        .x_i(x_i),
        .sr_o(sr_o)
    );

    initial begin
        clk = 1'b0;
        forever #7 clk=~clk;
    end

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, shift_reg_tb);

    #20
    reset <= 1'b1;
  if (sr_o == 3'b0 ) begin
    $display("Test 1 passed");
  end else
    $display("Test 1 failed");
  	#20
  	reset <= 1'b0;
    #50
    x_i <=1'b1;
    #20
    x_i <=1'b1;
    #20
    x_i <=1'b1;
    #20
    x_i <=1'b1;
    if (sr_o == 3'b1) begin
        $display("Test 2 passed");
    end else 
        $display("Test 2 failed");
    
 $finish;
end
endmodule
