`timescale 1ns / 1ps
`default_nettype none

module top
(
    input  wire i_clock,
    
    input  wire i_reset, 
    
    input  wire [13:0] i_adc_data,
    inout  wire io_adc_sdio,
    input  wire i_adc_dco_clock_p,
    output wire o_adc_dco_clock_n,
    output wire o_adc_sclk,
    output wire o_adc_clock_in_n,
    output wire o_adc_clock_in_p,
    output wire o_adc_ch1_coupling_h,
    output wire o_adc_ch1_coupling_l,
    output wire o_adc_ch2_coupling_h,
    output wire o_adc_ch2_coupling_l,
    output wire o_adc_ch2_gain_h,
    output wire o_adc_ch2_gain_l,
    output wire o_adc_ch1_gain_l,
    output wire o_adc_ch1_gain_h,
    output wire o_adc_relay_com_l,
    output wire o_adc_relay_com_h,
    output wire o_adc_cs,
    output wire o_adc_sync,
    
    inout  wire io_dac_sdio,
    output wire o_dac_cs,
    output wire o_dac_sclk,
    output wire o_dac_reset,
    output wire o_dac_clkio_p,
    output wire o_dac_clkio_n,
    output wire o_dac_clkin_p,
    output wire o_dac_clkin_n,
    output wire [13:0] o_dac_data,
    output wire o_dac_set_fs_ch1,
    output wire o_dac_set_fs_ch2,
    output wire o_dac_enable       
);

    /* ########################################################### */
    /* PARAMETERS ################################################ */
    
    localparam ZMOD_DATA_SIZE = 14;
    
    /* ########################################################### */
    /* CLOCK UNIT ################################################ */
    
    wire    sys_clock;
    wire    sys_reset;
    wire    adc_clock;
    wire    dac_clock;
    
    clock_unit #
    (
    )
    u_clock_unit
    (
        .i_clock        ( i_clock   ),
        .i_reset        ( i_reset   ),
        .o_sys_clock    ( sys_clock ),
        .o_adc_clock    ( adc_clock ),
        .o_dac_clock    ( dac_clock ),
        .o_valid        ( sys_reset )
    );
    
    /* ########################################################### */
    /* ADC1410 ################################################### */
    
    wire    [ ZMOD_DATA_SIZE - 1 : 0 ]  adc1410_ch1;
    wire    [ ZMOD_DATA_SIZE - 1 : 0 ]  adc1410_ch2;
    wire                                adc1410_init_done;
        
    adc1410 #
    (
        .ZMOD_DATA_SIZE         ( ZMOD_DATA_SIZE        )
    )
    u_adc1410
    (
        .i_sys_clock            ( sys_clock             ),
        .i_adc_clock            ( adc_clock             ),
        .i_reset                ( sys_reset             ),
        .i_adc_data             ( i_adc_data            ),
        .io_adc_sdio            ( io_adc_sdio           ),
        .i_adc_dco_clock_p      ( i_adc_dco_clock_p     ),
        .o_adc_dco_clock_n      ( o_adc_dco_clock_n     ),
        .o_adc_sclk             ( o_adc_sclk            ),
        .o_adc_clock_in_n       ( o_adc_clock_in_n      ),
        .o_adc_clock_in_p       ( o_adc_clock_in_p      ),
        .o_adc_ch1_coupling_h   ( o_adc_ch1_coupling_h  ),
        .o_adc_ch1_coupling_l   ( o_adc_ch1_coupling_l  ),
        .o_adc_ch2_coupling_h   ( o_adc_ch2_coupling_h  ),
        .o_adc_ch2_coupling_l   ( o_adc_ch2_coupling_l  ),
        .o_adc_ch2_gain_h       ( o_adc_ch2_gain_h      ),
        .o_adc_ch2_gain_l       ( o_adc_ch2_gain_l      ),
        .o_adc_ch1_gain_l       ( o_adc_ch1_gain_l      ),
        .o_adc_ch1_gain_h       ( o_adc_ch1_gain_h      ),
        .o_adc_relay_com_l      ( o_adc_relay_com_l     ),
        .o_adc_relay_com_h      ( o_adc_relay_com_h     ),
        .o_adc_cs               ( o_adc_cs              ),
        .o_adc_sync             ( o_adc_sync            ),
        .o_adc_data_out_ch1     ( adc1410_ch1           ),
        .o_adc_data_out_ch2     ( adc1410_ch2           ),
        .o_adc_init_done        ( adc1410_init_done     ) 
    );
    
    /* ########################################################### */
    /* DAC1411 ################################################### */
    
    wire        dac1411_init_done;
    
    dac1411 #
    (
        .ZMOD_DATA_SIZE     ( ZMOD_DATA_SIZE    )
    )
    u_dac1411
    (
        .i_sys_clock        ( sys_clock         ),
        .i_dac_clock        ( dac_clock         ),
        .i_reset            ( sys_reset         ),
        .i_data_ch1         ( adc1410_ch2       ),
        .i_data_ch2         ( adc1410_ch2       ),
        .io_dac_sdio        ( io_dac_sdio       ),
        .o_dac_init_done    ( dac1411_init_done ),
        .o_dac_cs           ( o_dac_cs          ),
        .o_dac_sclk         ( o_dac_sclk        ),
        .o_dac_reset        ( o_dac_reset       ),
        .o_dac_clkio_p      ( o_dac_clkio_p     ),
        .o_dac_clkio_n      ( o_dac_clkio_n     ),
        .o_dac_clkin_p      ( o_dac_clkin_p     ),
        .o_dac_clkin_n      ( o_dac_clkin_n     ),
        .o_dac_data         ( o_dac_data        ),
        .o_dac_set_fs_ch1   ( o_dac_set_fs_ch1  ),
        .o_dac_set_fs_ch2   ( o_dac_set_fs_ch2  ),
        .o_dac_enable       ( o_dac_enable      )
    );
            
endmodule

`default_nettype wire
