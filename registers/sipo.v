        module sipo (input si,clk,rst,output po);

         reg[3:0] q;

           always @(posedge clk)
                begin
                        if(rst)
                          q <= 0;
                        else
                          q <= {si,q[3:1]};
                end

           assign     po = q;

         endmodule


~
~
