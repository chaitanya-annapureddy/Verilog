//two stage synchronizer

module two_sync #(parameter ptr = 4) (input rst_n,
                                      input clk,
                                      input [ptr:0]data_in,
                                      output reg[ptr:0] syn2_out);

    reg [ptr:0] syn1_out;

        always @(posedge clk)
          begin
             if(!rst_n)
                {syn1_out,syn2_out} <=  5'b0;

            else
               begin
               syn1_out <= data_in;
              syn2_out <= syn1_out;
           end
          end

endmodule
~
~
~
~
