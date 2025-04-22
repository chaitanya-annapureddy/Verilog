
module full_adder ( input a,b,c,
                   output sum,carry);

  wire w1,w2,w3;
  assign w1 = a ^ b;
  assign w2 = a & b;
  assign w3  = c & w1;

  assign sum = ( w1 ^ c);
  assign carry = (w2 | w1);

endmodule
                  


                   
                   
