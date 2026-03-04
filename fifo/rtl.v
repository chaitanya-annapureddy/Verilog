 // synchronous fifo is used when both devices operation with the same clk but with the different operating speed because it may have the clk dividers,or anything
module fifo #(parameter START = 2,DEPTH =6) (input [7:0]data_in,
             input rstn,
             input clk,
             input w_en,
             input r_en,
             output reg [7:0]data_out,
             output wire full,
             output wire empty);

 reg [7:0] fifo [5:0];
 reg [3:0] wr_ptr = 4'd2;
 reg [3:0] rd_ptr = 4'd2;

//  wire full_in;
  //wire empty;
  integer i;



    always @(posedge clk)
      begin
           if(!rstn)
             begin
                 for(i=0;i<6;i=i+1)
                    begin
                          fifo[i] <= 0;
                    end
                          wr_ptr <= 4'd2;  // no need to make my empty and full initalize in asyn fifo only needed
             end

         else
          begin
                if (w_en & !full)
                 begin
                  fifo[wr_ptr[2:0]]  <= data_in;
                //  wr_ptr <= (wr_ptr == ( START + DEPTH -1))? START : wr_ptr +  1'b1; // for a depth of 6
                  wr_ptr <= wr_ptr + 1'b1;
                 end

          end
     end

  always @(posedge clk)
   begin
           if(!rstn)
              begin
                // for(i=0;i<8;i=i+1)
                   // begin
                              data_out <= 0;
                   // end
                       rd_ptr <= 4'd2;  // no need to make my empty and full initalize in asyn fifo only needed
             end

         else
          begin
                if (r_en & !empty)
                 begin
                 data_out <= fifo[rd_ptr[2:0]];
                  rd_ptr <= rd_ptr + 1'b1;
                  // rd_ptr <= (rd_ptr == ( START + DEPTH -1))? START : rd_ptr+1'b1;
                 end

          end
     end

      assign  full = (rd_ptr== {~wr_ptr[3],wr_ptr[2:0]}); //0010

     //  assign  full = (rd_ptr== {wr_ptr[3:2],~wr_ptr[1],wr_ptr[0]});
       // OR ELSE
    //    assign full = (rd_ptr == {wr_ptr +  1'b1});
      assign  empty = (wr_ptr == rd_ptr);

endmodule


module tb;

  reg  [7:0] data_in;
  reg        clk, rstn, w_en, r_en;
  wire [7:0] data_out;
  wire       full, empty;

  integer i;

  always #5 clk = ~clk;

  fifo duv (
    .data_in (data_in),
    .rstn    (rstn),
    .clk     (clk),
    .w_en    (w_en),
    .r_en    (r_en),
    .data_out(data_out),
    .full    (full),
    .empty   (empty)
  );

  // reset
  task reset;
    begin
      clk = 0;
      w_en = 0;
      r_en = 0;
      data_in = 0;
      rstn = 0;
      repeat(2) @(negedge clk);
      rstn = 1;
    end
  endtask

  // write one
  task write(input [7:0] d);
    begin
      @(negedge clk);
      if (!full || r_en) begin   // allow write when read is happening
        w_en = 1;
        data_in = d;
      end
      @(negedge clk);
      w_en = 0;
     end
  endtask

  // read one
  task read;
    begin
      @(negedge clk);
      if (!empty)
        r_en = 1;
      @(negedge clk);
      r_en = 0;
    end
  endtask

  // ===============================
  // TEST SEQUENCE
  // ===============================
  initial begin
    reset();

    // -------------------------------
    // PHASE 1: FILL FIFO COMPLETELY
    // -------------------------------
    i = 0;
    while (!full) begin
      write(i);
      i = i + 1;
    end

    $display("FIFO FULL");

    // -------------------------------
    // PHASE 2: READ + WRITE TOGETHER
    // FIFO STAYS FULL
    // -------------------------------
    for (i = 50; i < 120; i = i + 1) begin
           @(negedge clk);
      r_en = 1;
      w_en = 1;
      data_in = i;

      @(negedge clk);
      r_en = 0;
      w_en = 0;
    end

    $display("PARALLEL READ/WRITE DONE");

    #20;
    $finish;
  end

  // monitor
  initial begin
    $monitor("T=%0t | full=%0d empty=%0d w_en=%0d r_en=%0d data_in=%0d data_out=%0d wr_ptr=%0d rd_ptr=%0d",
      $time, full, empty, w_en, r_en, data_in, data_out,
      duv.wr_ptr, duv.rd_ptr);
  end

endmodule

/*
module tb;
    reg [7:0] data_in = 0;
    reg clk=0,rstn=0,w_en=0,r_en=0;
    wire [7:0] data_out;
    wire full,empty;
    integer i;

    always #5 clk = ~ clk;

    fifo duv (data_in,
              rstn,
              clk,
             w_en,
              r_en,
            data_out,
             full,
              empty);
 task rest();
    begin
        @(negedge clk)
          rstn = 0;
        @(negedge clk)
         rstn = 1;
    end
    endtask

    task inp(input [7:0] data);
      begin
                @(negedge clk)
                   w_en = 1;
                   data_in  = data;
                @(negedge clk)
                  w_en  =0;                     // w_en with the negedge clk if u want the delay between the no of writes u can give or else no need optional

      end
      endtask

      task red();
        begin

                @(negedge clk)
                   r_en = 1;
                 @(negedge clk)
                   r_en  = 0;
        end
    endtask

     /* initial
       begin
                rest();
                //for(i=0;i<20;i=i+1)
                 begin
                     inp(8'b0000_1111);
                       //checking one write and read

                      inp(8'b0000_0111);
                 end

                //  for(i=0;i<20;i=i+1)
                 begin
                 //  $display(i);
                     red();
                     red();
                       end

       end */

/*
     initial          /// writing and reading the data
       begin
                rest();
                for(i=0;i<40;i=i+1)
                 begin
                     inp(i);



                 end

                    for(i=0;i<40;i=i+1)
                 begin
                 //  $display(i);
                     red();

                 end

       end
*/
/*
        initial          /// writing and reading the data prallely now the pointers values will incresase and full signal is varies
       begin

                rest();
          fork
             begin
                for(i=0;i<30;i=i+1)
                 begin
                     inp(i);
                 end
             end

             begin
                                 for(i=0;i<40;i=i+1)
                 begin
                 //  $display(i);
                     red();

                 end

       end
*/
/*
        initial          /// writing and reading the data prallely now the pointers values will incresase and full signal is varies
       begin

                rest();
          fork
             begin
                for(i=0;i<30;i=i+1)
                 begin
                     inp(i);
                 end
             end

             begin
                               for(i=0;i<30;i=i+1)
                 begin
                 //  $display(i);
                     red();

                 end
             end
          join

       end

*/



     /*  initial
       begin
@@@       


     /*  initial
       begin
            $monitor("data is %0d,full is %d,empty is %od,dataOut is %0d,wr_ptr is %0d,w_en is %0d,rd_ptr is %0d,rd_en is %0d",data_in,full,empty,data_out,duv.wr_ptr,w_en,duv.rd_ptr,r_en);
       end

       initial
       begin
        #30000;
        $finish;
       end
       endmodule*/


        /* test cases

           one write and one read checking writing 0000 location read the loaction
            output is data is 15,full is 0,empty is 1d,dataOut is 0,wr_ptr is 0,rd_ptr is 0 e
             even though i written in the loacation 0000 empyt is calcualted based upon the pointers,empty is calcualted before the increment hte block always
             afrer wrpter is 1 same datais writen and rd ptr

              i can't read the beacuse fifo is empty ,if(r_en & !empty)
              Why your read is blocked */

           /* mem location is depend upon the === ptr - 1 ;            that location we completed the writing */

           /*
                                                           /*
After reset:

wptr = 0
rptr = 0
empty = 1   ✅ correct


You write one data:

write happens → wptr becomes 1
rptr still 0
empty MUST become 0


But in your design:

Either wptr is not incrementing

Or empty logic is still comparing old values

Or empty is asserted incorrectly

WRITE PHASE (fill FIFO)
Cycle   wptr (before)   Action  Address used    wptr (after)    rptr
1       00000   WRITE   mem[0]  00001   00000
2       00001   WRITE   mem[1]  00010   00000
3       00010   WRITE   mem[2]  00011   00000
4       00011   WRITE   mem[3]  00100   00000
5       00100   WRITE   mem[4]  00101   00000
6       00101   WRITE   mem[5]  00110   00000
7       00110   WRITE   mem[6]  00111   00000
8       00111   WRITE   mem[7]  01000   00000
9       01000   WRITE   mem[8]  01001   00000
10      01001   WRITE   mem[9]  01010   00000
11      01010   WRITE   mem[10] 01011   00000
12      01011   WRITE   mem[11] 01100   00000
13      01100   WRITE   mem[12] 01101   00000
14      01101   WRITE   mem[13] 01110   00000
15      01110   WRITE   mem[14] 01111   00000
16      01111   WRITE   mem[15] 10000   00000

🔴 FIFO is now FULL
*/
                                 FIFO is now FULL
*/

 /*  prallel write and read cases
  ASSUMPTIONS (read once)

FIFO depth = 16

Address width = 4 bits

Pointer width = 5 bits

Single clock (clk)

Both wr_en and rd_en can be 1 in the same cycle

FIFO is neither full nor empty during these cycles

Write data stream = D0, D1, D2, ...

👉 Rule

WRITE uses wptr BEFORE

READ uses rptr BEFORE

Both pointers increment independently on the same clock edge

RESET STATE
Time    wptr    rptr    FIFO
Reset   00000   00000   EMPTY
PARALLEL WRITE + READ (steady-state operation)
Cycle-by-cycle table
Cycle   wptr (before)   rptr (before)   Action  Write Addr / Data       Read Addr / Data        wptr (after)    rptr (after)
1       00000   00000   WRITE + READ    mem[0] ← D0     ❌ (empty before)       00001   00000
2       00001   00000   WRITE + READ    mem[1] ← D1     mem[0] → D0     00010   00001
3       00010   00001   WRITE + READ    mem[2] ← D2     mem[1] → D1     00011   00010
4       00011   00010   WRITE + READ    mem[3] ← D3     mem[2] → D2     00100   00011
5       00100   00011   WRITE + READ    mem[4] ← D4     mem[3] → D3     00101   00100
6       00101   00100   WRITE + READ    mem[5] ← D5     mem[4] → D4     00110   00101
7       00110   00101   WRITE + READ    mem[6] ← D6     mem[5] → D5     00111   00110
8       00111   00110   WRITE + READ    mem[7] ← D7     mem[6] → D6     01000   00111  */


/*
module sync_fifo #(
  parameter DATA_WIDTH = 8,
                                                                                                       



                         
