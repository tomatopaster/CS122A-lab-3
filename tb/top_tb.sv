`include "src/top.sv"
`timescale 1ns/1ps         // Set tick to 1ns. Set sim resolution to 1ps.

/**
 * Note:
 *  The TB below is only an example of a testbench written in SV.
 *  Adapt this for your lab assignments as you see fit.
 *  An example clk signal has been added to show what a signal decl and usage looks like.
 *     You are welcome to delete the clk signal if it's not needed.
 *     For instance, purely combinational circuits do not need clks.
 *     So for labs without sequential elements, you can remove them.
 */

module top_tb;

/** declare tb signals below */
logic clk_tb;
logic [3:0] val1;
logic [3:0] val2;
wire [7:0] seg7out;

/** declare module(s) below */
top dut                    // declare an inst of top called "dut" (device under test)
(
    /** hook up tb signals to dut signals */
    .val1(val1),
    .val2(val2),
    .seg7(seg7out)
);

localparam CLK_PERIOD = 10;
always #(CLK_PERIOD/2) clk_tb=~clk_tb;          // toggle clk_tb every #(CLK_PERIOD/2) ticks

initial begin
    $dumpfile("build/top.vcd"); // intermediate file for waveform generation
    $dumpvars(0, top_tb);       // capture all signals under top_tb
end

initial begin
    /** testbench logic goes below */
    clk_tb<=1'b1;       // sets clk_tb to 1
    #(CLK_PERIOD*3);    // waits for CLK_PERIOD * 3 ticks
    val1 = 4'b0001;
    val2 = 4'b0000;
    #(CLK_PERIOD*2);
    val1 = 4'b0010;
    #(CLK_PERIOD*2);
    val1 = 4'b0011;
    #(CLK_PERIOD*2);
    val1 = 4'b0100;
    #(CLK_PERIOD*2);
    val1 = 4'b0101;
    #(CLK_PERIOD*2);
    val1 = 4'b0110;
    #(CLK_PERIOD*2);
    val1 = 4'b0111;
    #(CLK_PERIOD*2);
    val1 = 4'b1000;
    #(CLK_PERIOD*2);
    val1 = 4'b1001;
    #(CLK_PERIOD*2);
    val1 = 4'b1010;
    #(CLK_PERIOD*2);
    val1 = 4'b1011;
    #(CLK_PERIOD*2);
    val1 = 4'b1100;
    #(CLK_PERIOD*2);
    val1 = 4'b1101;
    #(CLK_PERIOD*2);
    val1 = 4'b1110;
    #(CLK_PERIOD*2);
    val1 = 4'b1111;
    // bcdin = 4'h0; 
    #(CLK_PERIOD*2);

    #(CLK_PERIOD*2);
    $finish;            // end simulation, otherwise it runs indefinitely
end

endmodule
