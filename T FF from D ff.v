	
    module t_b_ff(input d,t,clk,rst,output reg q ,output wire qbar);
         
      wire w1;
      xor x1 (w1,t,q);
	
    	always @(posedge clk)
	   begin
		  if(rst)
		   q <=0;
	    	  else
		   q <= w1;
	   end

	assign qbar = ~q;

    endmodule
