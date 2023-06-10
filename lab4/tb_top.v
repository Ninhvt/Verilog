`timescale 1ns/1ns

module testbench;
    reg car, rst_n;
    wire [2:0] led_highway, led_country;

    top_module top (
        .car(car),
        .rst_n(rst_n),
        .led_highway(led_highway),
        .led_country(led_country)
    );

    initial begin
        // Initialize inputs
        car = 0;
        rst_n = 0;

        #10 rst_n = 1; // Release reset

        // Test case 1
        #10 car = 1;
        #20 car = 0;
        #30 car = 1;

        // Test case 2
        #50 car = 0;
        #20 car = 1;
        #30 car = 0;
        #20 car = 1;
        #10 rst_n = 0;
        #10 rst_n = 1; // Release reset

        // Test case 1
        #10 car = 1;
        #20 car = 0;
        #30 car = 1;
        #10 rst_n = 0; // Release reset


       

        
    end
endmodule