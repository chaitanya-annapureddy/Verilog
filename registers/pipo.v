   module pipo (input reg[3:0]d,clk,rst,output reg [3:0]q,output wire qbar);

          always @(posedge clk)
            begin
                   if(rst)
                    q <= 0;
                   else
                   /* q[0] <=  d[0];
                    q[1] <=  d[1];
                    q[2] <=  d[2];
                    q[3] <=  d[3];*/

                     q <= d;

            end

           assign qbar = ~ q;
  endmodule
~
~
~
~
~
~
