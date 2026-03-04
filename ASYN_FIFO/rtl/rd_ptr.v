
 module rd_pntr #(parameter ptr =4)
        ( input  r_clk,r_en,r_rstn,
          input  [ptr:0] g_wptr_syn,
          output reg [ptr:0] g_rptr, b_rptr,
          output reg empty
        );

              wire [ptr:0] b_rptr_in, g_rptr_in;
                  wire empty_in;

                 //  assign b_rptr_in = b_rptr  + (r_en & !empty);
                  assign b_rptr_in = (r_en && ~empty) ? ((b_rptr == 5'd27) ? 5'd4 : (b_rptr + 5'd1)) :b_rptr;
                  assign g_rptr_in = b_rptr_in  ^ (b_rptr_in >> 1);

                  // empty condition
                 assign empty_in = (g_wptr_syn == g_rptr_in);




        // read pointer logic
          always @(posedge r_clk or negedge r_rstn)
                 begin
                            if(!r_rstn) begin
                             {b_rptr,g_rptr} <= 5'd0;
                                          empty   <= 1'b1;
                                        end
                            else
                                        begin
                                                     b_rptr <= b_rptr_in;
                                                 g_rptr <= g_rptr_in;
                                                                         empty  <= empty_in;
                                end
                     end




endmodule
~
~
