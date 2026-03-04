
        module mod_16 (input clock,rstn,output reg[3:0] count_output);

         always @(posedge clock)
           begin
             if(!rstn)
                    count_output <=0;
             else

                   count_output <= count_output+1;
          end
        endmodule


        module tb;

                reg clock=0,rstn=0;
                wire[3:0] count_output;

                mod_16 duv(clock,rstn,count_output);

                always #5 clock = ~clock;

                task rst();
                  begin
                         @(negedge clock)
                           rstn=0;
                         @(negedge clock)
                           rstn=1;
                  end
                endtask

                 initial
                        begin
                              rst();
                              $monitor("count_output is %0d",count_output);

                       end

                  initial
                         begin
                                #300;
                                $finish;
                         end
          endmodule


        ///frequency divsion for f/2


        module freq_div_2 (input clock,reset,output reg count);

         always @(posedge clock)
          begin
                  if(rst)
                    count <=0;
                 else
                    count <= count + 1'b1;
          end


        endmodule
                                                              
                                 
