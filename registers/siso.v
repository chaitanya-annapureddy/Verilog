       module siso(input  si,clk,rst,output  so);

           reg [3:0] q;

                always @(posedge clk)
                  begin
                         if(rst)
                          q <=0;
                        else
                          // right shift
                        /*  q[3] <= si;
                          q[2] <= q[3];
                          q[1] <= q[2];
                          q[0] <= q[1];*/

                          /*q[3] <= si;
                          q[2] <= q[3];
                          q[1] <= q[2];
                          q[0] <= q[1];
                                */
                         //so <= {si,q[3:1]};

                         //q <= {si,q[3:1]};
                         //
                         //
                         //left shift

                           q <= {q[2:1],si};
                  end

                          assign so = q[0];

        endmodule
~
~
