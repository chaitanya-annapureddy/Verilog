`timescale 1ns / 1ps 
module half_subtractor ( input a,b,
                        output diff,borrow);
  assign diff = (a ^ b);
  assign borrow  = (~a & b);

endmodule
                    
