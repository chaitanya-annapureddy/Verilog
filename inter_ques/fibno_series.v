    module fib_series (input clk ,rstn,output [3:0] fib_out);

                reg first=0,second = 1;
                reg [3:0] inter_result;

                reg mem[5:0];

                always @(posedge clk)
                  begin
                          if(!rstn)
                             {second,first} <= 0;

                          else
                                for(integer i=0;i<5;i=i+1)
                                 begin
                                        mem[0] <= first;
                                        mem[1] <= second;

                        /*
                                        inter_result <= mem[first]   + mem[second]
                                        first <=  first +1;
                                        second  <= second +1;

                                        if(i>=2)
                                        mem[i]<= inter_result;

                                        i want mem[second + 1] is 3
                                        mem[second + 1] <= inter_result + mem[second  - first]; */

                                        if(i>1)

                                          fib_out <=  mem[i-1] +  mem[i+1];

                                 end


        endmodule
~
~
