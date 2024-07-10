module alu_8b_tb;

    reg [7:0]   a_i;  // First 8-bit input vector
    reg [7:0]   b_i;  // Second 8-bit input vector
    reg [2:0]   op_i; // Encoded operation
    reg [7:0]   alu_o; // ALU output

    // Instantiate the ALU module
    alu_8b dut (
        .a_i(a_i), 
        .b_i(b_i), 
        .op_i(op_i),
        .alu_o(alu_o)
    );
  
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, alu_8b_tb);

        // Test case 1: ADD operation
        a_i = 8'b0000_0001; // Set first input
        b_i = 8'b0000_0010; // Set second input
        op_i = 3'b000; // Select ADD operation

        // Wait for combinational logic to settle
        #20;

        // Check the result
        if (alu_o === 8'b0000_0011) begin
            $display("Test 1 (ADD) passed");
        end else begin
            $display("Test 1 (ADD) failed");
        end

        // Test case 2: SUB operation
        a_i = 8'b0000_0100; // Set first input
        b_i = 8'b0000_0010; // Set second input
        op_i = 3'b001; // Select SUB operation

        // Wait for combinational logic to settle
        #20;

        // Check the result
        if (alu_o === 8'b0000_0010) begin
            $display("Test 2 (SUB) passed");
        end else begin
            $display("Test 2 (SUB) failed");
        end

        // Test case 3: SLL operation
        a_i = 8'b0000_0011; // Set first input
        b_i = 3'b010; // Set second input (shift amount)
        op_i = 3'b010; // Select SLL operation

        // Wait for combinational logic to settle
        #20;

        // Check the result
        if (alu_o === 8'b0001_1000) begin
            $display("Test 3 (SLL) passed");
        end else begin
            $display("Test 3 (SLL) failed");
        end

        // Test case 4: LSR operation
        a_i = 8'b1100_1100; // Set first input
        b_i = 3'b011; // Set second input (shift amount)
        op_i = 3'b011; // Select LSR operation

        // Wait for combinational logic to settle
        #20;

        // Check the result
        if (alu_o === 8'b0001_1001) begin
            $display("Test 4 (LSR) passed");
        end else begin
            $display("Test 4 (LSR) failed");
        end

        // Test case 5: AND operation
        a_i = 8'b1010_1010; // Set first input
        b_i = 8'b0101_0101; // Set second input
        op_i = 3'b100; // Select AND operation

        // Wait for combinational logic to settle
        #20;

        // Check the result
        if (alu_o === 8'b0000_0000) begin
            $display("Test 5 (AND) passed");
        end else begin
            $display("Test 5 (AND) failed");
        end

        // Test case 6: OR operation
        a_i = 8'b1010_1010; // Set first input
        b_i = 8'b0101_0101; // Set second input
        op_i = 3'b101; // Select OR operation

        // Wait for combinational logic to settle
        #20;

        // Check the result
        if (alu_o === 8'b1111_1111) begin
            $display("Test 6 (OR) passed");
        end else begin
            $display("Test 6 (OR) failed");
        end

        // Test case 7: XOR operation
        a_i = 8'b1010_1010; // Set first input
        b_i = 8'b0101_0101; // Set second input
        op_i = 3'b110; // Select XOR operation

        // Wait for combinational logic to settle
        #20;

        // Check the result
        if (alu_o === 8'b1111_1111) begin
            $display("Test 7 (XOR) passed");
        end else begin
            $display("Test 7 (XOR) failed");
        end

        // Test case 8: EQL operation
        a_i = 8'b1010_1010; // Set first input
        b_i = 8'b1010_1010; // Set second input
        op_i = 3'b111; // Select EQL operation

        // Wait for combinational logic to settle
        #20;

        // Check the result
        if (alu_o === 1'b1) begin
            $display("Test 8 (EQL) passed");
        end else begin
            $display("Test 8 (EQL) failed");
        end

        // Additional test cases can be added as needed
    end

endmodule
