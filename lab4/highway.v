`timescale 1ns/1ns

module highway#(
    parameter t = 10,
    parameter T = 15
)
(
    input clk,
    input rst_n,
    input car,
    input enable_h,
    input T_timeout,
    output reg enable_c = 0,
    output reg[2:0] led_highway
);
    localparam green = 3'b001;
    localparam yellow = 3'b010;
    localparam red = 3'b100;

    reg[2:0] state, next_states;
    

    always @(car or state or enable_h or T_timeout or t_timeout) begin
        state = next_states;
        led_highway = state;
        enable_c = 0;

        case (state)
            green: if ((car == 1) && (T_timeout == 1)) begin
                next_states = green;
                if (T_timeout == 0) begin
                    #T T_timeout = 1;
                end
            end else begin
                next_states = yellow;
                T_timeout = 0;
            end

            yellow: if (t_timeout == 0) begin
                next_states = yellow;
                if (t_timeout == 0) begin
                    #t t_timeout = 1;
                end
            end else begin
                next_states = red;
                t_timeout = 0;
                enable_c = 1;
            end

            red: if ((T_timeout == 1) && (enable_h == 1)) begin
                next_states = green;
                T_timeout = 0;
            end else begin
                next_states = red;
                if (T_timeout == 0) begin
                    #T T_timeout = 1;
                end
            end

            default: begin
                next_states = green;
                T_timeout = 0;
                t_timeout = 0;
            end
        endcase
    end

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            state <= green;
        end else begin
            state <= next_states;
        end
    end
endmodule
