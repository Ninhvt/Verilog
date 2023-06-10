

module full_adder_32bit (a,b,cin,sum,cout);
  input [31:0] a,b;
  input cin;
  output [31:0] sum,cout;
  

 
  genvar g;
  full_adder fa0(a[0], b[0], cin, sum[0], cout[0]);
  
  generate  
    for(g = 1; g<32; g=g+1) begin
      full_adder fa(a[g], b[g], cout[g-1], sum[g], cout[g]);
    end
  endgenerate
endmodule



module full_adder (a, b, cin, sum, cout);
  input a, b, cin;
  output sum, cout;
assign sum = a^b^cin;
assign cout = (a & b) | (b & cin) | (a & cin);
endmodule

