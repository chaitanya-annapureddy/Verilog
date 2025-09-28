
   module tb;
  
     reg d=0,clk=0,rst=0;
     wire qbar,q;

   d_ff duv (clk,d,rst,q,qbar);
 
 /* initial
	 begin
	 clk = 0;
 	 d= 0;
	// q = 0;
	 end
 */
  always #5 clk = ~clk;

  task rest();
    begin
	@(negedge clk)
	 rst = 1'b1;
	@(negedge clk)
	 rst = 1'b0;
   end
  endtask

   task values(input a);
	begin
	       d =a;
	end
   endtask

   initial
	  begin
		rest();
 		values(0);
 		@(negedge clk)
		values(1);
		@(negedge clk)
		values(0);

          end

   initial
	 begin
	      $monitor("d is %d,q is %d,rst is %d",d,q,rst);
	       #100;
		$finish;
	 end
endmodule
