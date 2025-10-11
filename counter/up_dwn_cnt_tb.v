

	module tb;
		
	 reg [2:0] t =0;
	 reg clk = 0,rst =0,mode = 1;

	 wire [2:0]count;
	 
 	 //dut instantiation 

	 up_down duv (t,clk,rst,mode,count);

	 always #5 clk = ~clk;

	 task rest();
	   begin
		  @(negedge clk)
		    rst = 1;
		  @(negedge clk)
		    rst = 0;
	   end
	 endtask

	 task values(input a,input b);
	   begin
		   @(negedge clk)
		   t = a;
		   mode = b;
	   end
	 endtask
	
	 initial
	   begin
		  rest();
		  values(111,1);
		  values(111,0);
		  
	   end 
	 
	initial
	    begin
	       $monitor($time,"count is %d",count);
       		
	   	#200;
		$finish;
	    end
endmodule


    


