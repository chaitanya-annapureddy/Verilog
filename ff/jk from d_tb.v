module tb;
  
  reg j,k,clk,rst;
  wire q,qbar;
 
  jk_d duv (j,k,clk,rst,q,qbar);

  initial
        begin
	      clk = 0;
 	      j =0;k =0;
	end
 always #5 clk = ~clk;

  task rest();
    begin
      @(negedge clk)
	rst = 1;
       @(negedge clk)
	 rst = 0;
    end
 endtask

  task val(input a,input b);
   begin
        @(negedge clk);
  	j = a;
	k = b;
   end
 endtask

 initial
  	begin
	 	rest();
		val(1,0);
		val(0,1);
		val(0,0);
		val(1,1);
	end

 initial 
	begin
		$monitor("j is %d,k is %d,q is %d,qbar is %d",j,k,q,qbar);
		#100;
 		$finish;
	end
endmodule
 
