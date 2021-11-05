`timescale 1ns / 1ps
`default_nettype none

module dac1411 #
(
    parameter   ZMOD_DATA_SIZE      = 14
)
(
    input  wire                                 i_sys_clock,
    input  wire                                 i_dac_clock,
    input  wire                                 i_reset,
    input  wire [ ZMOD_DATA_SIZE   - 1 : 0 ]    i_data_ch1,
    input  wire [ ZMOD_DATA_SIZE   - 1 : 0 ]    i_data_ch2,
    output wire [ ZMOD_DATA_SIZE   - 1 : 0 ]    o_dac_data,
    inout  wire                                 io_dac_sdio,
    output wire                                 o_dac_cs,
    output wire                                 o_dac_sclk,
    output wire                                 o_dac_reset,
    output wire                                 o_dac_clkio_p,
    output wire                                 o_dac_clkin_p,
    output wire                                 o_dac_clkio_n,
    output wire                                 o_dac_clkin_n,
    output wire                                 o_dac_set_fs_ch1,
    output wire                                 o_dac_set_fs_ch2,
    output wire                                 o_dac_enable,
    output wire                                 o_dac_init_done
);
    
    wire                                    init_done;
    wire                                    enable;
    
    assign enable           = 1'b1;
    assign o_dac_init_done  = ~init_done;
    assign o_dac_clkin_n    = 1'b0;
    assign o_dac_clkio_n    = 1'b0;
    
    /*
               <--- IP Configuration --->
        Ch1ScaleStatic      =   1
        Ch2ScaleStatic      =   1
        Ch1HgAddCoefStatic  =   000000000000000000
        Ch2HgAddCoefStatic  =   000000000000000000
        Ch1LgAddCoefStatic  =   000000000000000000
        Ch2LgAddCoefStatic  =   000000000000000000
        Ch1HgMultCoefStatic =   010000000000000000
        Ch2HgMultCoefStatic =   010000000000000000
        Ch1LgMultCoefStatic =   010000000000000000
        Ch2LgMultCoefStatic =   010000000000000000   
    */
    ZmodDAC1411_Controller_0
    u_ZmodDAC1411_Controller_0
    (
        .SysClk         ( i_sys_clock       ),
        .DacClk         ( i_dac_clock       ),
        .sRst_n         ( ~i_reset          ),
        .sInitDone_n    ( init_done         ),
        .sCh1In         ( i_data_ch1        ),
        .sCh2In         ( i_data_ch2        ),
        .sDAC_EnIn      ( enable            ),
        .sDAC_CS        ( o_dac_cs          ),
        .sDAC_SCLK      ( o_dac_sclk        ),
        .sDAC_SDIO      ( io_dac_sdio       ),
        .sDAC_Reset     ( o_dac_reset       ),
        .sDAC_ClkIO     ( o_dac_clkio_p     ),
        .sDAC_Clkin     ( o_dac_clkin_p     ),
        .sDAC_Data      ( o_dac_data        ),
        .sDAC_SetFS1    ( o_dac_set_fs_ch1  ),
        .sDAC_SetFS2    ( o_dac_set_fs_ch2  ),
        .sDAC_EnOut     ( o_dac_enable      )
    );
    
endmodule

`default_nettype wire