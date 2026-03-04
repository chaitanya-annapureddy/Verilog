
   module d_3 (input sqn_in,clk,rst,output div_3);

         parameter r0 = 2'b00,
                   r1 = 2'b01,
                   r2 = 2'b10;

         reg [1:0] state,ns;

         // sequential state
          always @(posedge clk)
            begin
                  if(rst)
                     state <= 0;
                  else
                     state <= ns;
             end

         always @ (state,sqn_in)
             begin
                   case(state)
                     r0 : if(r0 == 1)
                              ns = r1;
                    else
                              ns = r0;

                     r1 : if(r1 == 1)
                              ns = r0;
                          else
                              ns = r2;
                     r2 : if(r2 == 1)
                              ns = r2;
                          else
                              ns = r1;

                  default: ns = r0;
                   endcase
             end


         assign div_3 = (state == r0 && sqn_in == 1)? 1:0;

        endmodule
