module odd_counter (
    input wire clk,      // Clock input
    input wire reset,    // Reset input
    output logic [7:0] cnt_o // 8-bit counter output
);

    reg [7:0] tmp_reg;   // Register to hold the counter value

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            tmp_reg <= 8'h1; // Reset value on reset signal
        end else begin
            tmp_reg <= tmp_reg + 2; // Increment by 2 on each clock cycle
        end
    end

    assign cnt_o = tmp_reg; // Output the counter value

endmodule
