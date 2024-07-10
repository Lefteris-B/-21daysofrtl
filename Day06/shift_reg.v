module shift_reg (
    input wire clk,    
    input wire reset,  
    input wire x_i, 
    output wire[3:0] sr_o 
);

    reg [3:0] reg_data;   // Register to hold the counter value

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            reg_data <= 3'b0; // Reset value on reset signal
        end else begin
            reg_data <= {reg_data[2:0],x_i}; // Increment by 2 on each clock cycle
        end
    end

    assign sr_o = reg_data;

endmodule
