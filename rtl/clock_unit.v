`timescale 1ns / 1ps
`default_nettype none

module clock_unit
(
    input wire i_clock,
    input wire i_reset,
    output wire o_clock0,
    output wire o_clock1,
    output wire o_clock2,
    output wire o_valid
);
    /*
        <--- IP Configuration --->
        clk_in1 = 125 MHz.
        clk_out1 = 100 MHz.
        clk_out2 = 100 MHz shifted 90°.
        clk_out3 = 400 MHz
    */
    clk_wiz
    u_clk_wiz
    (
        .clk_in1 (i_clock),
        .reset (i_reset),
        .clk_out1 (o_clock0),
        .clk_out2 (o_clock1),
        .clk_out3 (o_clock2),
        .locked (o_valid)
    );
    
endmodule

`default_nettype wire
