`timescale 1ns / 1ps
`default_nettype none

module adc #
(
    parameter ZMOD_DATA_SIZE = 14,
    parameter AXIS_DATA_SIZE = 32
)
(
    input wire i_sys_clock,
    input wire i_adc_clock,
    input wire i_nReset,
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
    output wire [AXIS_DATA_SIZE-1:0] o_adc_data,
    output wire o_adc_data_valid,
    output wire o_adc_init_done
);
        
    reg test_mode = 0;
    reg enable_acquisition = 1;
    reg ready = 1;
    wire data_overflow;
    wire init_done_relay;
    wire init_done_adc;
    wire config_error;
    wire reset_busy;
    
    assign o_adc_dco_clock_n = 1'b0;
    assign o_adc_init_done = init_done_adc && init_done_relay;
    
    ZmodScopeController_0
    u_ZmodScopeController_0
    (
        .SysClk100 (i_sys_clock),
        .ADC_SamplingClk (i_sys_clock),
        .ADC_InClk (i_adc_clock),
        .aRst_n (i_nReset),
        .sEnableAcquisition (enable_acquisition),
        .sTestMode (test_mode),
        .ZmodDcoClk (i_adc_dco_clock_p),
        .dZmodADC_Data (i_adc_data),
        .sRstBusy (reset_busy),
        .sInitDoneADC (init_done_adc),
        .sConfigError (config_error),
        .sInitDoneRelay (init_done_relay),
        .sDataOverflow (data_overflow),
        .ZmodAdcClkIn_p (o_adc_clock_in_p),
        .ZmodAdcClkIn_n (o_adc_clock_in_n),
        .iZmodSync (o_adc_sync),
        .sZmodADC_SDIO (io_adc_sdio),
        .sZmodADC_CS (o_adc_cs),
        .sZmodADC_Sclk (o_adc_sclk),
        .sZmodCh1CouplingH (o_adc_ch1_coupling_h),
        .sZmodCh1CouplingL (o_adc_ch1_coupling_l),
        .sZmodCh2CouplingH (o_adc_ch2_coupling_h),
        .sZmodCh2CouplingL (o_adc_ch2_coupling_l),
        .sZmodCh1GainH (o_adc_ch1_gain_h),
        .sZmodCh1GainL (o_adc_ch1_gain_l),
        .sZmodCh2GainH (o_adc_ch2_gain_h),
        .sZmodCh2GainL (o_adc_ch2_gain_l),
        .sZmodRelayComH (o_adc_relay_com_h),
        .sZmodRelayComL (o_adc_relay_com_l),
        .cDataAxisTdata (o_adc_data),
        .cDataAxisTvalid (o_adc_data_valid),
        .cDataAxisTready (ready)
    );
    
endmodule

`default_nettype wire