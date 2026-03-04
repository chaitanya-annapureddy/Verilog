
module  asyn_fifo #(parameter depth = 16,width = 8,ptr = 4) (
                     input w_clk,w_en,full,empty,r_clk,r_en,
                     input [width-1:0] data_in,
                     input [ptr:0] b_wptr,b_rptr,
                     output reg[width-1:0] data_out
                     );

     reg [width-1:0] a_fifo[depth-1:0];


     //write logic
     always @(posedge w_clk)
      begin
          if(w_en && !full)
             a_fifo[b_wptr] <= data_in;
      end

     //read logic
       always @(posedge r_clk)
         begin
              if(r_en && !empty)
                  data_out <= a_fifo[b_rptr];
         end
endmodule
