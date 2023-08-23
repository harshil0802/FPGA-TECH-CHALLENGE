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
    end module
    );
  
endmodule
