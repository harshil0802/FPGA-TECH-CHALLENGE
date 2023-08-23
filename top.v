`timescale 1ns / 1ps

module top(
    input clk,
    input rst,
    input [2:0] mode,
    input [7:0] DS0,
    input [7:0] DS1,
    input [7:0] DS2,
    input switch_clk_cycles,
    output [7:0] d_out
    );


    reg [2:0] counter = 3'b000; 
    reg [7:0] current_data;     
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 3'b000;
            current_data <= 8'b0;
        end else begin
            if (counter >= switch_clk_cycles - 1) begin
                counter <= 3'b000;
                case (mode)
                    3'b000: current_data <= DS0;
                    3'b001: current_data <= DS1;
                    3'b010: current_data <= DS2;
                    default: current_data <= 8'b0;
                endcase
            end else begin
                counter <= counter + 1;
            end
        end
    end
    
    assign d_out = current_data;
    
endmodule



