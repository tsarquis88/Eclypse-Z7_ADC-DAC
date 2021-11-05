`timescale 1ns / 1ps
`default_nettype none

module clock_unit
(
    input  wire i_clock,
    input  wire i_reset,
    output wire o_sys_clock,
    output wire o_adc_clock,
    output wire o_dac_clock,
    output wire o_valid
);
    
    wire        locked;
    
    assign  o_valid =   ~locked;

    /*
               <--- IP Configuration --->
        clk_in1     =   125 MHz
        clk_out1    =   100 MHz
        clk_out2    =   400 MHz
        clk_out3    =   100 MHz (shifted 90)
    */
    clk_wiz_0
    u_clk_wiz_0
    (
        .clk_out1           ( o_sys_clock   ),
        .clk_out2           ( o_adc_clock   ),
        .clk_out3           ( o_dac_clock   ),
        .reset              ( i_reset       ),
        .locked             ( locked        ),
        .clk_in1            ( i_clock       )
    );
    
endmodule

`default_nettype wire
