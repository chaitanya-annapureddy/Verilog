        module fsm_1x11m (input clk,rstn,data_in,output data_out);

            reg[2:0] ps,ns;

            parameter s0 = 4'b0,s1=4'b1,s2=4'b11,s3=4'b111,s4=4'b10,s5=4'b101;

            // present state logic
             always @(posedge clk)
               begin
                      if(!rstn)
                          ps <= 0;
                      else
                          ps <= ns;
              end


           // next state decoder
           always @(*)
            begin
                   case(ps)
                        s0 :    if(data_in)
                                   ps = s1;
                                else
                                   ps = s0;

                        s1 :    if(data_in)
                                  ps = s2;
                                else
                                  ps = s4;

                        s2 :  if(data_in)
                                  ps = s3;
                                else
                                  ps = s4;

                        s3 :  if(data_in)
                                  ps = s3;
                                else
                                  ps = s4;


                        s4 :  if(data_in)
                                  ps = s5;
                                else
                                  ps = s0;

                        s5 : if(data_in)
                                  ps = s2;
                             else
                                  ps = s4;

                 default   : ps  = s0;

                 endcase
          end



          //output logic

          assign data_out  = (ps == s3 && data_in) ||  (ps == s5 && data_in) ? 1'b1:1'b0;


endmodule
