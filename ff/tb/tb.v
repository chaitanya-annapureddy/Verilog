
   module tb;
   	
     reg d,t,clk,rst;
     wire q ,qbar;

     t_b_ff duv (d,t,clk,rst, q , qbar);
         

     	
     initial
    	 begin
	       t = 0;
	       rst = 0;
	       clk = 0;
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

   task val(input a);
	  begin
		 @(negedge clk)
		   t =a ;
          end
   endtask
    
    initial
        begin
		rest();
		val(0);
		val(1);
	 end

   initial
	   begin
		    $monitor("t is %d,d is %d,q is %d ,qbar is %d",t,d ,q,qbar);
		    #100;
		    $finish;

 	   end

endmodule

