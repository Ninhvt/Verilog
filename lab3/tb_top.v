
module testbench;
  reg clk;
  reg rst_n;
  wire [5:0] second;
  wire [5:0] minute;
  wire [4:0] hour;
  wire [4:0] day;
  wire [3:0] month;
  wire [15:0] year;

  top #(
    .CLOCK_FREQ(5)
  ) dut (
    .clk(clk),
    .rst_n(rst_n),
    .second(second),
    .minute(minute),
    .hour(hour),
    .day(day),
    .month(month),
    .year(year)
  );

  initial begin
    // start
    rst_n = 0;
    #5;
    rst_n = 1;

    repeat (15) @(month);
    #10;
    $stop;
  
  end
endmodule

