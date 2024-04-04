`timescale 1ns / 1ps
`default_nettype none

module dac #
(
    parameter ZMOD_DATA_SIZE = 14,
    parameter AXIS_DATA_SIZE = 32
)
(
    input wire i_sys_clock,
    input wire i_dac_clock,
    input wire i_dac_in_clock,
    input wire i_nReset,
    input wire [AXIS_DATA_SIZE-1:0] i_data,
    input wire i_data_valid,
    output wire [ZMOD_DATA_SIZE-1:0] o_dac_data,
    inout wire io_dac_sdio,
    output wire o_dac_cs,
    output wire o_dac_sclk,
    output wire o_dac_reset,
    output wire o_dac_clkio_p,
    output wire o_dac_clkin_p,
    output wire o_dac_clkio_n,
    output wire o_dac_clkin_n,
    output wire o_dac_set_fs_ch1,
    output wire o_dac_set_fs_ch2,
    output wire o_dac_enable,
    output wire o_dac_init_done
);
    
    reg enable = 1;
    reg test_mode = 0;
    wire init_error;
    wire ready;
    
    assign o_dac_clkin_n = 1'b0;
    assign o_dac_clkio_n = 1'b0;
    
    ZmodAWGController_0
    u_ZmodAWGController_0
    (
        .SysClk100 (i_sys_clock),
        .DAC_InIO_Clk (i_dac_in_clock),
        .DAC_Clk (i_dac_clock),
        .aRst_n (i_nReset),
        .sTestMode (test_mode),
        .sInitDoneDAC (o_dac_init_done),
        .sConfigError (init_error),
        .cDataAxisTvalid (i_data_valid),
        .cDataAxisTready (ready),
        .cDataAxisTdata (i_data),
        .sDAC_EnIn (enable),
        .sZmodDAC_CS (o_dac_cs),
        .sZmodDAC_SCLK (o_dac_sclk),
        .sZmodDAC_SDIO (io_dac_sdio),
        .sZmodDAC_Reset (o_dac_reset),
        .ZmodDAC_ClkIO (o_dac_clkio_p),
        .ZmodDAC_ClkIn (o_dac_clkin_p),
        .dZmodDAC_Data (o_dac_data),
        .sZmodDAC_SetFS1 (o_dac_set_fs_ch1),
        .sZmodDAC_SetFS2 (o_dac_set_fs_ch2),
        .sZmodDAC_EnOut (o_dac_enable)
    );
    
endmodule

`default_nettype wire