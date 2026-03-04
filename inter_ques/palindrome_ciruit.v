 module palindrome_circuit (input [3:0] inp ,output det);
         wire w1,w2;

             xnor x1 (w1,inp[1],inp[2]);
             xnor x2 (w2,inp[3],inp[0]);

             and  a1 (det,w1,w2);

             /*assign w1 = inp[1] ~^ inp[2];
             assign w2 = inp[3] ~^ inp[0];

             assign det = w1 & w2;*/

   endmodule


   module tb;
           reg [3:0] inp=0;
           wire det;
           integer i;

            palindrome_circuit duv (inp,det);


           initial
                  begin

                          for(i=0;i<=15;i=i+1) begin
                                 inp = i;
                                 #5;
                          end
                  end

         initial
         begin
                 $monitor("inp is %0d,det is %0d",inp,det);
        end

        initial
        begin
                #500;
                $finish;
        end

   endmodule
