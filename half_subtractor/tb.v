module half_sub_tb.v ;
  reg a,b;
  wire diff,borrow;

  half_subtractor dut ( a,b,diff,borrow );

  initial 
    begin
       a = 0 ; b = 0 ; #2;
       a = 0 ; b = 1 ; #2;
       a = 1; b =  0 ; #2;
       a = 1 ; b = 1; #2; 
      %display (
        $monitor("time=%0t,a= %b , b = %b ,diff = %b,borrow = %b, $time,a,b,diff,borrow);
      #100  $finish; 
    end
                 endmodule
                 
