module top_module (
    input car,
    input rst_n,
    output wire[2:0] led_highway,
    output wire[2:0] led_country
);
    wire clk;
    wire enable_h, enable_c;

    clk_generator clk_gen (
        .clk(clk)
    );

    highway #(10, 15) led_hw (
        .clk(clk),
        .rst_n(rst_n),
        .car(car),
        .enable_h(enable_h),
        .enable_c(enable_c),
        .led_highway(led_highway)
    );

    country #(10, 15) led_ct (
        .clk(clk),
        .rst_n(rst_n),
        .enable_c(enable_c),
        .enable_h(enable_h),
        .led_country(led_country)
    );
endmodule
