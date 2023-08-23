# FPGA-TECH-CHALLENGE
DESIGN CODE:-
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


TESTBENCH CODE:-
`timescale 1ns / 1ps
module tb(
    reg clk,
    reg rst,
    reg mode,
    reg DS0,
    reg DS1,
    reg DS2,
    reg switch_clk_cycles,
    wire d_out,
   
   top dut(
        .clk(clk),
        .rst(rst),
        .mode(mode),
        .DS0(DS0),
        .DS1(DS1),
        .DS2(DS2),
        .switch_clk_cycles(switch_clk_cycles),
        .d_out(d_out)
   ) ;
    
    initial begin
        clk = 0;
        rst = 1;
        mode = 3'b000;
        data_0 = 8'b11001100;
        data_1 = 8'b10101010;
        data_2 = 8'b00110011;
        
  
        symbol_clk_cycles = 10000000;  
       
        mode = 3'b000;
        switch_clk_cycles = symbol_clk_cycles * 2;
        #200;  
     
        mode = 3'b001;
        switch_clk_cycles = symbol_clk_cycles * 3;
        #300;  
        mode = 3'b010;
        switch_clk_cycles = symbol_clk_cycles * 4;
        #400;    
        $finish;
    end
    );
    end module
    
