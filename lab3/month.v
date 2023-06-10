
module months (
    input rst_n,
    input inc_month,
    output [4:0] month,
    output inc_year
);

  // Internal logic
  reg [3:0] months_cnt;
  reg inc_year_cnt;

  always @(posedge inc_month or negedge rst_n) begin
    if (!rst_n) begin
      months_cnt <= 5'd1;
    
    end else begin
      if (months_cnt == 5'd12) begin
        months_cnt <= 5'd1;
        inc_year_cnt   <= 1;

      end else begin
        months_cnt <= months_cnt + 1'b1;
        inc_year_cnt  <= 0;
      end
    end
  end

  assign inc_year = inc_year_cnt;
  assign month = months_cnt;
endmodule
