
module full_adder ( input a,b,c,
                   output sum,carry);

  wire w1,w2,w3;
  //half_adder instantiation  by name based
  half_adder ha1 (.a(a),.b(b),.sum(w1),.carry(w2));
  half_adder ha2 (.a(w1),.b(c),.sum(sum),.carry(w3));

  //or gate
  assign carry = (w2 | w3 );

endmodule


                  


                   
                   
