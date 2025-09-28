	module up_down (input [2:0] t,input clk,rst,mode,output reg [2:0]count);
		
	   always @(posedge clk)
	     begin
		    if(rst)
		      count <= 0;
	      	    else if(mode)
		      count <= count + 1'b1;
		   else
		      count <= count -1'b1;
	     end

	endmodule
