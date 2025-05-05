module half_adder;
reg a,b;
wire sum,carry;

// order based mapping
half_adder dut (a,b,sum,carry);

//initalizing values 
initial
 begin
a = 0 ;b =0 ;#2;
a = 0 ;b = 1; #2;
a = 1 ;b = 0 ;#2;
a = 1 ; b = 1 ;#2;
 end
// displaying the output
inital 
 begin
$display("a = % b , b = % b ,a,b");

#100 $finish;
 end
endmodule

