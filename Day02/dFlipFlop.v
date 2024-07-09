module dFlipFlop    (
    input     logic      clk,
    input     logic      reset,
    input     logic      d_i,        // -> D input to the flop
    output    logic      q_norst_o,  //  -> Q output from non-resettable flop
    output    logic      q_syncrst_o, // -> Q output from flop using synchronous reset
    output    logic      q_asyncrst_o //-> Q output from flop using asynchrnoous reset
);
  
always @(posedge clk ) begin
    q_norst_o <= d_i;
end

always @(posedge clk or posedge reset) begin
   if (!reset) begin
        q_asyncrst_o <= d_i; 
   end
   else 
        q_asyncrst_o <= 0;
   
end

always @(posedge clk ) begin

   if (!reset) begin
        q_syncrst_o <= d_i;

   end
     else 
        q_syncrst_o <= 0;
end

endmodule