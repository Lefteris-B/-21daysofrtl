module lfsr (
  input     wire      clk,
  input     wire      reset,

  output    wire[3:0] lfsr_o
);

    reg [3:0] reg_data;   // Register to hold the counter value

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            reg_data <= 4'b1010; // Reset value on reset signal
        end else begin
            reg_data <= {reg_data[2:0],(reg_data[1]^reg_data[3])}; 
        end
    end

    assign lfsr_o = reg_data;
 

endmodule
