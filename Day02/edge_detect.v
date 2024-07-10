module edge_detect (
    input logic clk,
    input logic reset,
    input logic a_i,             // Serial input to the module
    output logic rising_edge_o,  // Rising edge output
    output logic falling_edge_o  // Falling edge output
);

    logic ff_comp_1;
    logic ff_comp_2;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset all flip-flops and outputs
            ff_comp_1 <= 1'b0;
            ff_comp_2 <= 1'b0;
            rising_edge_o <= 1'b0;
            falling_edge_o <= 1'b0;
        end else begin
            // Update the flip-flops with the current and previous states of a_i
            ff_comp_1 <= a_i;
            ff_comp_2 <= ff_comp_1;

            // Rising edge detection
            if ((ff_comp_1 == 1'b1) && (ff_comp_2 == 1'b0)) begin
                rising_edge_o <= 1'b1;
            end else begin
                rising_edge_o <= 1'b0;
            end

            // Falling edge detection
            if ((ff_comp_1 == 1'b0) && (ff_comp_2 == 1'b1)) begin
                falling_edge_o <= 1'b1;
            end else begin
                falling_edge_o <= 1'b0;
            end
        end
    end

endmodule
