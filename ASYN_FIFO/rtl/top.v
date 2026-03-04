
module asyn_top #(parameter width = 8,depth = 24, ptr=4) ( input   [width-1:0]data_in,
     input  w_en,w_clk, w_rstn,
     input  r_en,r_clk,r_rstn,
     output [width-1:0] data_out,
     output  empty , full
   );


            wire [ptr:0] b_wptr_in,g_wptr_in;
            wire [ptr:0] b_rptr_in, g_rptr_in;
            wire [ptr:0] g_wptr_syn_in, g_rptr_syn_in;


   // modules instation





                wptr_blk #(.ptr(ptr)) wptr_duv (
                                            .w_clk(w_clk),
                                            .w_en(w_en),
                                            .w_rstn(w_rstn),
                                            .full(full),
                                            .g_rptr_sync(g_rptr_syn_in),
                                            .g_wptr(g_wptr_in),
                                            .b_wptr(b_wptr_in)
                                          );

                rd_pntr #(.ptr(ptr))  rdptr_duv                  (
                                                             .r_clk(r_clk),
                                                             .r_en(r_en),
                                                             .r_rstn(r_rstn),
                                                             .g_wptr_syn(g_wptr_syn_in),
                                                             .g_rptr(g_rptr_in),
                                                             .b_rptr(b_rptr_in),
                                                             .empty(empty)
                                                           );

    asyn_fifo #(.depth(depth),.width(width),.ptr(ptr)) duv (
                                                             .w_clk(w_clk),
                                                             .w_en(w_en),
                                                             .full(full),
                                                             .empty(empty),
                                                             .r_clk(r_clk),
                                                             .r_en(r_en),
                                                             .data_in(data_in),
                                                             .b_wptr(b_wptr_in),
                                                             .b_rptr(b_rptr_in),
                                                             .data_out(data_out)
                                                             );

                two_sync #(.ptr(ptr)) wr_syn                   (
                                                               .rst_n(w_rstn),
                                                                .clk(w_clk),
                                                                .data_in(g_rptr_in),
                                                                .syn2_out(g_rptr_syn_in)
                                                              );


    two_sync #(.ptr(ptr)) rd_syn                                (
                                                                   .rst_n(r_rstn),
                                                                    .clk(r_clk),
                                                                   .data_in(g_wptr_in),
                                                                   .syn2_out(g_wptr_syn_in)
                                                              );


endmodule

                                    
