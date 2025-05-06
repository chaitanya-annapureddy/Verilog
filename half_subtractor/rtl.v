`timescale 1ns / 1ps 
module half_subtractor ( input a,b,
                        output diff,borrow);
  assign diff = (a ^ b);
  assign borrow  = (~a & b);

  /* gate level modeling 
   xor g1 (diff ,a ,b);
   not g2 (not_a , a);
   and g3 (borrow , not_a , b);
   */
endmodule
                    
