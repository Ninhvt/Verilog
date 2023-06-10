module TB_and32;
  
  reg [31:0] in1;
  reg [31:0] in2;
  wire [31:0] out;
  
  
  and32 and_inst(.out(out), .in1(in1), .in2(in2));
  
  
  initial begin
    $monitor("in1 = %b, in2 = %b --> out = %b", in1, in2, out);
    in1 = 32'b11110000111100001111000011110000;
    in2 = 32'b10101010101010101010101010101010; 
    #10;
    in1 = 32'b00001111000011110000111100001111;
    in2 = 32'b01010101010101010101010101010101;
    #10;
    $finish;
  end
endmodule

