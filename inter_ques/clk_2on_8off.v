  module clk_2on_8off (input clk,rstn,output reg  final_clk);



         reg [3:0] count;
        // reg [3:0] count2on;

         // MOD 10 COUNTER
         always @(posedge clk)
          begin
                  if(!rstn)
                     count <= 4'b0;
                  else
                   begin

                      if(count == 9)
                          count <=  4'b0;
                      else
                          count <= count + 1'b1;
                end
          end





         always @(posedge clk)
           begin
                  if(!rstn)
                     final_clk <= 0;
                  else
                      if(count  < 4'd4)
                          final_clk <= ~final_clk;
                      else
                          final_clk <= 0;
          end


    //   assign final_clk = count2on;

endmodule

  module tb;

     reg clk = 0,rstn=0;
     wire final_clk;

       always #5 clk = ~clk;


     clk_2on_8off duv (clk,rstn,final_clk);


     task rst();
      begin
            @(negedge clk)
                rstn = 0;
            @(negedge clk)
                rstn = 1;
      end
     endtask

     initial
     begin
             rst();
     end

     initial
      begin
             $monitor("clk is %0d,count is %0d, final clk is %0d",clk,duv.count,final_clk);
      end

      initial
      begin

              #1000;
              $finish;
      end




   endmodule


