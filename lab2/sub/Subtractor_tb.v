

module TB_Subtractor;

  // Declare the inputs and outputs
  reg [31:0] A;
  reg [31:0] B;
 
  wire [31:0] Sum, Cout;
  
  // Instantiate the subtractor module
  subtractor_32bit subtractor(A, B, Sum, Cout);

  // Define clock signal
  

  // Assign values to inputs and test the subtractor
  initial begin
    $monitor(" A = %d, B = %d --> S = %d, Cout = %b", A, B, Sum, Cout[3]);
    A = 32'd10; B = 32'd5; 
    #10;
    A = 32'd10; B = 32'd0; 
    #10;
    A = 32'd10; B = 32'd10;
    #10;
    A = 32'd4231312; B = 32'd1;
    #10;
    
  end

endmodule

