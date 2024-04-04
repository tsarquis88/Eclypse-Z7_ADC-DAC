`timescale 1ns / 1ps
`default_nettype none

module top #
(
    parameter ZMOD_DATA_SIZE = 14
)
(
    input wire i_clock,
    input wire i_reset, 
    input wire [ZMOD_DATA_SIZE-1:0] i_adc_data,
    inout wire io_adc_sdio,
    input wire i_adc_dco_clock_p,
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
    inout wire io_dac_sdio,
    output wire o_dac_cs,
    output wire o_dac_sclk,
    output wire o_dac_reset,
    output wire o_dac_clkio_p,
    output wire o_dac_clkio_n,
    output wire o_dac_clkin_p,
    output wire o_dac_clkin_n,
    output wire [ZMOD_DATA_SIZE-1:0] o_dac_data,
    output wire o_dac_set_fs_ch1,
    output wire o_dac_set_fs_ch2,
    output wire o_dac_enable,
    output wire o_led0_g,
    output wire o_led0_r,
    output wire o_led0_b,
    output wire o_led1_g,
    output wire o_led1_r,
    output wire o_led1_b
);

    /* ########################################################### */
    /* PARAMETERS ################################################ */
    
    localparam AXIS_DATA_SIZE = 32;
    
    /* ########################################################### */
    /* CLOCK UNIT ################################################ */
    
    wire clock0; // 100 MHz.
    wire clock1; // 100 MHz - Shifted 90°.
    wire clock2; // 400 MHz.
    wire clocks_valid; // Up once the clocks are ready.
    
    clock_unit #
    (
    )
    u_clock_unit
    (
        .i_clock (i_clock),
        .i_reset (i_reset),
        .o_clock0 (clock0),
        .o_clock1 (clock1),
        .o_clock2 (clock2),
        .o_valid (clocks_valid)
    );
    
    /* ########################################################### */
    /* ADC1410 ################################################### */
    
    wire [AXIS_DATA_SIZE-1:0] adc_data;
    wire adc_init_done;
    wire adc_data_valid;
        
    adc #
    (
        .ZMOD_DATA_SIZE (ZMOD_DATA_SIZE),
        .AXIS_DATA_SIZE (AXIS_DATA_SIZE)
    )
    u_adc
    (
        .i_sys_clock (clock0),
        .i_adc_clock (clock2),
        .i_nReset (clocks_valid),
        .i_adc_data (i_adc_data),
        .io_adc_sdio (io_adc_sdio),
        .i_adc_dco_clock_p (i_adc_dco_clock_p),
        .o_adc_dco_clock_n (o_adc_dco_clock_n),
        .o_adc_sclk (o_adc_sclk),
        .o_adc_clock_in_n (o_adc_clock_in_n),
        .o_adc_clock_in_p (o_adc_clock_in_p),
        .o_adc_ch1_coupling_h (o_adc_ch1_coupling_h),
        .o_adc_ch1_coupling_l (o_adc_ch1_coupling_l),
        .o_adc_ch2_coupling_h (o_adc_ch2_coupling_h),
        .o_adc_ch2_coupling_l (o_adc_ch2_coupling_l),
        .o_adc_ch2_gain_h (o_adc_ch2_gain_h),
        .o_adc_ch2_gain_l (o_adc_ch2_gain_l),
        .o_adc_ch1_gain_l (o_adc_ch1_gain_l),
        .o_adc_ch1_gain_h (o_adc_ch1_gain_h),
        .o_adc_relay_com_l (o_adc_relay_com_l),
        .o_adc_relay_com_h (o_adc_relay_com_h),
        .o_adc_cs (o_adc_cs),
        .o_adc_sync (o_adc_sync),
        .o_adc_data (adc_data),
        .o_adc_data_valid (adc_data_valid),
        .o_adc_init_done (adc_init_done) 
    );
    
    /* ########################################################### */
    /* DAC1411 ################################################### */
    
    wire dac_init_done;
    
    dac #
    (
        .ZMOD_DATA_SIZE (ZMOD_DATA_SIZE),
        .AXIS_DATA_SIZE (AXIS_DATA_SIZE)
    )
    u_dac
    (
        .i_sys_clock (clock0),
        .i_dac_in_clock (clock0),
        .i_dac_clock (clock1),
        .i_nReset (clocks_valid),
        .i_data (adc_data),
        .i_data_valid (adc_data_valid),
        .io_dac_sdio (io_dac_sdio),
        .o_dac_init_done (dac_init_done),
        .o_dac_cs (o_dac_cs),
        .o_dac_sclk (o_dac_sclk),
        .o_dac_reset (o_dac_reset),
        .o_dac_clkio_p (o_dac_clkio_p),
        .o_dac_clkio_n (o_dac_clkio_n),
        .o_dac_clkin_p (o_dac_clkin_p),
        .o_dac_clkin_n (o_dac_clkin_n),
        .o_dac_data (o_dac_data),
        .o_dac_set_fs_ch1 (o_dac_set_fs_ch1),
        .o_dac_set_fs_ch2 (o_dac_set_fs_ch2),
        .o_dac_enable (o_dac_enable)
    );
    
    pmod_unit
    (
        .i_clock (clock0),
        .i_nReset (clocks_valid),
        .i_adc_init_done (adc_init_done),
        .i_dac_init_done (dac_init_done),
        .o_led0_r (o_led0_r),
        .o_led0_g (o_led0_g),
        .o_led0_b (o_led0_b),
        .o_led1_r (o_led1_r),
        .o_led1_g (o_led1_g),
        .o_led1_b (o_led1_b)
    );
            
endmodule

`default_nettype wire
