module d_ff (input clk,d,rst,output reg q,output wire qbar);

   always @(posedge clk)
    begin
         if(rst)
	    q <= 0;
	 else
	    q <= d;
    end

  assign qbar = ~ q;

endmodule
