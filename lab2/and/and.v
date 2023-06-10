
module and4(out,in1,in2);
	input [3:0] in1, in2;
	output [3:0] out;

	and t1(out[3], in1[3], in2[3]),
		t2(out[2], in1[2], in2[2]),
		t3(out[1], in1[1], in2[1]),
		t4(out[0], in1[0], in2[0]);
endmodule

module and8(out,in1,in2);
	input [7:0] in1, in2;
	output [7:0] out;

	and4 t1(out[7:4], in1[7:4], in2[7:4]),
		 t2(out[3:0], in1[3:0], in2[3:0]);
endmodule

module and16(out,in1,in2);
	input [15:0] in1, in2;
	output [15:0] out;

	and8 t1(out[15:8], in1[15:8], in2[15:8]),
		t2(out[7:0], in1[7:0], in2[7:0]);
endmodule


module and32(out,in1,in2);
	input [31:0] in1, in2;
	output [31:0] out;

	and16 t1(out[31:16], in1[31:16], in2[31:16]),
			t2(out[15:0], in1[15:0], in2[15:0]);
endmodule