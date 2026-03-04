 module piso (input [3:0]pi,clk,rst,load,shift,output so);

           reg[3:0] q;

            always @(posedge clk)
                begin
                      if(rst)
                           q <= 0;
                      else if(load)
                           q <= pi;
                      else if (!shift)
                           //q <= pi >> 1;
                             q <= {1'b0,q[3:1]};
                      else
                           q <= 0;
                end


            assign so = q[0];

      endmodule

~
~
