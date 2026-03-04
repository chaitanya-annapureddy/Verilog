
 module wptr_blk #(parameter ptr = 4) (
            input  w_clk, w_en, w_rstn,
              input  [ptr:0] g_rptr_sync,
              output  reg [ptr:0] g_wptr, b_wptr,
        output reg full
      );

            wire [ptr:0] b_wptr_in;
                wire [ptr:0] g_wptr_in;

                //assign  b_wptr_in = b_wptr + 1;// one wrong // asgigin will executes contious when lhs changes rhs will assgin to it
                //assign   b_wptr_in  = b_wptr +  (b_wptr_in == LAST)? (b_wptr_in == START):(w_en && ~full);   // wrong check this once

                assign   b_wptr_in = (w_en && ~full) + b_wptr ;
                                                                //? ((b_wptr == 5'd27) ? 5'd5 : (b_wptr + 5'd1)) :b_wptr;
                assign   g_wptr_in  = b_wptr_in ^ (b_wptr_in >> 1);

      // write pointer logic d
        always @(posedge w_clk or negedge w_rstn)
                begin
                      if(!w_rstn)
                             {b_wptr,g_wptr } <= 5'd4;
                           else
                             begin
                                              b_wptr     <= b_wptr_in;
                                              g_wptr     <= g_wptr_in;
                                                                  full       <= (g_wptr == {g_rptr_sync + 5'd24});

                                                     // full       <= (g_wptr == {~g_rptr_sync[ptr:ptr-1],g_rptr_sync[ptr-2:0]});


                                                   // full      <= (g_wptr == {g_rptr_sync[ptr],~g_rptr_sync[ptr-1],g_rptr_sync[ptr-2], ~g_rptr_sync[ptr-ptr]});

                                                     //full      <= (g_wptr == {g_rptr_sync[ptr],~g_rptr_sync[ptr-1],g_rptr_sync[ptr-2], g_rptr_sync[ptr-ptr]}); // for a depth of 6 full condition
                                   end

                end


              //full condition

         // assign full = (g_wptr == {~g_rptr_sync[ptr:ptr-1],g_rptr_sync[ptr-2:0]});


endmodule
"wr_ptr.v" [dos] 47L, 1665C               
