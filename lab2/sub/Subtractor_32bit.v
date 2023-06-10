


module subtractor_32bit(a, b, sum, cout);
  input [31:0] a, b;
  output [31:0] sum, cout;
  wire [31:0] bc;

  genvar g;
  assign bc[0] = b[0];
  full_adder fa0(a[0], ~bc[0], 1, sum[0], cout[0]);
  
  generate  
    for(g = 1; g < 32; g = g + 1) begin
      assign bc[g] = b[g];
      full_adder fa(a[g], ~bc[g], cout[g-1], sum[g], cout[g]);
    end
  endgenerate
endmodule


module full_adder(a, b, cin, sum, cout);
  input a, b, cin;
  output sum, cout;
  assign sum = a ^ b ^ cin;
  assign cout = (a & b) | (b & cin) | (a & cin);
endmodule
