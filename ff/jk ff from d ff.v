module jk_d (input j,k,clk,rst,output reg q,output wire qbar);

	wire w1,w2,w3;
	
	and a1(w1,qbar,j);
	and a2(w2,~k,q);
	or or1(w3,w1,w2);

	always @(posedge clk)
	 begin
		if(rst)
		q<= 0;
	 	else
	        q<= w3;
	 end
        
	 assign qbar = ~q;
endmodule
