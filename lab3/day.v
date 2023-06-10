
module days (
    input rst_n,
    input  inc_day,
    input [1:0] rst_day,
    output [4:0] day,
    output inc_month
);
  
  reg [4:0] day_cnt;
  reg inc_month_cnt;

  always @(posedge inc_day or negedge rst_n or posedge rst_day) begin
    if (!rst_n) begin
      day_cnt <= 1;
    end else begin
      if (day_cnt == 5'd28 && rst_day == 2'b00) begin
        day_cnt  <= 5'd1;
        inc_month_cnt <= 1;
      end else if (day_cnt == 5'd29 && rst_day == 2'b01) begin
        day_cnt  <= 5'd1;
        inc_month_cnt <= 1;
      end else if (day_cnt == 5'd30 && rst_day == 2'b10) begin
        day_cnt  <= 5'd1;
        inc_month_cnt <= 1;
      end else if (day_cnt == 5'd31 && rst_day == 2'b11) begin
        day_cnt  <= 5'd1;
        inc_month_cnt <= 1;
      end else begin
        day_cnt  <= day_cnt + 1'b1;
        inc_month_cnt <= 0;

      end
    end
  end

  assign inc_month = inc_month_cnt;
  assign day = day_cnt;

endmodule
