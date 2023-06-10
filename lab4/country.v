`timescale 1ns/1ns

module country#(
    parameter t = 10,
    parameter T = 15
)
(
    input clk,
    input rst_n,
    input enable_c,
    output reg enable_h = 0,
    output reg[2:0] led_country = 3'b100
);
    localparam green = 3'b001;
    localparam yellow = 3'b010;
    localparam red = 3'b100;

    reg[2:0] state, next_states;
    reg T_timeout = 0, t_timeout = 0;

    always @(state or enable_c or T_timeout or t_timeout) begin
        next_states = state;
        led_country = state;
        enable_h = 0;
        case (state)
            red: if (~enable_c) begin
                next_states = red;
            end else begin
                next_states = green;
            end

            green: if (T_timeout == 0) begin
                next_states = green;
                if (T_timeout == 0)
                    #T T_timeout = 1;
            end else begin
                next_states = yellow;
                T_timeout = 0;
            end

            yellow: if (t_timeout == 1) begin
                next_states = red;
                t_timeout = 0;
                enable_h = 1;
            end else begin
                next_states = yellow;
                if (t_timeout == 0)
                    #t t_timeout = 1;
            end

            default: begin
                next_states = red;
                T_timeout = 0;
                t_timeout = 0;
            end
        endcase
    end

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            state <= red;
        end else begin
            state <= next_states;
        end
    end
endmodule
