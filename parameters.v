module tb;

  parameter a = 10;
  parameter b  = 20;
initial begin
  $display("a is %d,b is %d",a,b);

  //defparam a = 20;
  //defparam b = 10;

  //$display("a is %d,b is %d",a,b);
end

 //initial
   //begin
   //  defparam a = 80;
    // defparam b = 90;
    /*initial
     $display("a is %d,b is %d",a,b); */


endmodule

/*
 module top;
        tb ins();
        defparam ins.a = 50;
        defparam ins.b = 80;

  endmodule */

 module top;

     // tb #(100,70) duv();

      tb #(.a(100),.b(80)) duv();

  endmodule



~
~
