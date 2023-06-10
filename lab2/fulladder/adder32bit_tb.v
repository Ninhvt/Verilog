

module TB;
  
  reg [31:0] A;
  reg [31:0] B;
  reg Cin;
  wire [31:0] Sum;
  wire [31:0] Cout;
  full_adder_32bit fa32(A,B,Cin,Sum,Cout);
  initial begin
    $monitor("Cin=%b: A = %b, B = %b --> S = %b, Cout = %b", Cin, A, B, Sum, Cout);
    Cin = 0;
    A = 0;
    B = 0;
    #10;
    A = 10;
    B = 5;
    Cin = 1;
    #10;
    A = 100;
    B = 200;
    Cin = 0;
    #10;
    A = 200;
    B = 100;
    Cin = 1;
    #100;
   
  end

endmodule


