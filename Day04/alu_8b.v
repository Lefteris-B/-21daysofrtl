module alu_8b (
    input     logic [7:0]   a_i,  //First 8-bit input vector
    input     logic [7:0]   b_i,  //Second 8-bit input vector
    input     logic [2:0]   op_i, //Encoded operation
    output    logic [7:0]   alu_o //ALU output
);
    
always @* 
    begin        
        case (op_i)
            3'b000:	//ADD	
                assign alu_o = a_i + b_i;
            3'b001:	//SUB	
                assign alu_o = a_i - b_i;
            3'b010:	//SLL	Vector a should left shift using bits 2:0 of vector b
                assign alu_o = a_i >> 2;
            3'b011:	//LSR	Vector a should right shift using bits 2:0 of vector b
                assign alu_o = a_i << 2 ;
            3'b100:	//AND	
                assign alu_o = a_i & b_i;
            3'b101:	//OR
                assign alu_o = a_i | b_i;
            3'b110:	//XOR	
                assign alu_o = a_i ^ b_i;
            3'b111:	//EQL	Output should be 1 when equal otherwise 0 
                assign alu_o = (a_i == b_i) ? 1'b1 : 1'b0;
            default: 
                assign alu_o = 8'b0;
        endcase
    end


endmodule