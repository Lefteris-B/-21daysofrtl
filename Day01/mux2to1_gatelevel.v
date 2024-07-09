module mux2to1 (
    input   logic [7:0]    a_i,   // First leg of the mux
    input   logic [7:0]    b_i,   // Second leg of the mux
    input   logic          sel_i, // Mux select
    output  logic [7:0]    y_o    // Mux output
);
    
    wire [7:0] and1_out;
    wire [7:0] and2_out;
    wire [7:0] not_sel_i;
    
    and #(8) and1 (
        .a(a_i),
        .b(sel_i),
        .z(and1_out)
    );
    
    and #(8) and2 (
        .a(b_i),
        .b(!sel_i),
        .z(and2_out)
    );
    
    not #(1) not1 (
        .a(sel_i),
        .z(not_sel_i)
    );
    
    or #(8) or1 (
        .a(and1_out),
        .b(and2_out),
        .z(y_o)
    );

endmodule