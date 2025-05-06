`timescale 1ns / 1ps
module full_adder_tb ;
 reg a,b,c;
 wire sum,carry;
  integer i;

  // order based instantiation 
  full_adder dut (a,b,c,sum,carry);

  initial 
    begin
      {a,b,c} = 3'b000;
    end

  initial 
    begin
      for(i = 0 ; i <= 9 ; i = i+1) begin
        {a,b,c} = i;
        #5;
      end
    end

  initial 
    begin 
     $monitor ("time=%0t ,a = %b ,b = %b,c = %b,sum = %b ,carry = %b,$time,a,b,c");
      #100 $finish;
    end
endmodule
