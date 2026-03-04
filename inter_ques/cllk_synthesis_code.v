 module clk_genetor (input clk_50mhz,rstn,output reg clk_out_5mhz =0);


    reg [3:0] cntr_interanl;


       always @(posedge clk_50mhz)
        begin
             if(!rstn)
                cntr_interanl <=  4'b0;

            else if (cntr_interanl == 4)
              begin
                    cntr_interanl  <= 0;
                    clk_out_5mhz   <= ~ clk_out_5mhz;
              end
             else begin
                    cntr_interanl <=  cntr_interanl +  1'b1;
             end
        end

 endmodule

  module tb;
     reg clk_50mhz =0,rstn = 0;
     wire clk_out_5mhz;

     always #10 clk_50mhz =  ~ clk_50mhz;

    clk_genetor  duv (clk_50mhz,rstn,clk_out_5mhz);

   task rest();
     begin
          @(negedge clk_50mhz)
              rstn = 0;
           @(negedge clk_50mhz)
              rstn =  1;
     end
   endtask

    initial begin
         rest();

   end

  initial begin
                $monitor("clk_50mhz is %0d ,cntr_internal is %0d,clk_out_5mhz is %0d",clk_50mhz,duv.cntr_interanl,clk_out_5mhz);
  end

  initial begin
             #1000;
             $finish;

  end
   endmodule


   initial begin
