`timescale 1ns/1ns

module clk_generator (
    output reg clk = 0
);
    always #5 clk = ~clk;
endmodule