`timescale 1ns / 1ps
`default_nettype none

module adc1410 #
(
    parameter   ZMOD_DATA_SIZE      = 14
)
(
    input  wire                                 i_sys_clock,
    input  wire                                 i_adc_clock,
    input  wire                                 i_reset,
    input  wire [ ZMOD_DATA_SIZE    - 1 : 0 ]   i_adc_data,
    inout  wire                                 io_adc_sdio,
    input  wire                                 i_adc_dco_clock_p,
    output wire                                 o_adc_dco_clock_n,
    output wire                                 o_adc_sclk,
    output wire                                 o_adc_clock_in_n,
    output wire                                 o_adc_clock_in_p,
    output wire                                 o_adc_ch1_coupling_h,
    output wire                                 o_adc_ch1_coupling_l,
    output wire                                 o_adc_ch2_coupling_h,
    output wire                                 o_adc_ch2_coupling_l,
    output wire                                 o_adc_ch2_gain_h,
    output wire                                 o_adc_ch2_gain_l,
    output wire                                 o_adc_ch1_gain_l,
    output wire                                 o_adc_ch1_gain_h,
    output wire                                 o_adc_relay_com_l,
    output wire                                 o_adc_relay_com_h,
    output wire                                 o_adc_cs,
    output wire                                 o_adc_sync,
    output wire [ ZMOD_DATA_SIZE    - 1 : 0 ]   o_adc_data_out_ch1,
    output wire [ ZMOD_DATA_SIZE    - 1 : 0 ]   o_adc_data_out_ch2,
    output wire                                 o_adc_init_done
);
    
    localparam ADC_OUT_DATA_SIZE    = 16;
    
    wire                                test_mode;
    wire                                init_done;
    wire [ ADC_OUT_DATA_SIZE - 1 : 0 ]  data_out_ch1;
    wire [ ADC_OUT_DATA_SIZE - 1 : 0 ]  data_out_ch2;
    
    assign test_mode            = 1'b0;
    assign o_adc_dco_clock_n    = 1'b0;
    assign o_adc_init_done      = ~init_done;
    assign o_adc_data_out_ch1   = data_out_ch1[ 15 : 2 ];
    assign o_adc_data_out_ch2   = data_out_ch2[ 15 : 2 ];
    
    /*
               <--- IP Configuration --->
        Ch1CouplingStatic   =   1
        Ch2CouplingStatic   =   0
        Ch1GainStatic       =   1
        Ch2GainStatic       =   1
        Ch1HgAddCoefStatic  =   000000000000000000
        Ch2HgAddCoefStatic  =   000000000000000000
        Ch1LgAddCoefStatic  =   000000000000000000
        Ch2LgAddCoefStatic  =   000000000000000000
        Ch1HgMultCoefStatic =   010000000000000000
        Ch2HgMultCoefStatic =   010000000000000000
        Ch1LgMultCoefStatic =   010000000000000000
        Ch2LgMultCoefStatic =   010000000000000000   
    */
    ZmodADC1410_Controller_0
    u_ZmodADC1410_Controller_0
    (
        .SysClk             ( i_sys_clock           ),
        .ADC_InClk          ( i_adc_clock           ),
        .sRst_n             ( ~i_reset              ),
        .sInitDone_n        ( init_done             ),
        .FIFO_EMPTY_CHA     (                       ),
        .FIFO_EMPTY_CHB     (                       ),
        .sCh1Out            ( data_out_ch1          ),
        .sCh2Out            ( data_out_ch2          ),
        .sTestMode          ( test_mode             ),
        .adcClkIn_p         ( o_adc_clock_in_p      ),
        .adcClkIn_n         ( o_adc_clock_in_n      ),
        .adcSync            ( o_adc_sync            ),
        .DcoClk             ( i_adc_dco_clock_p     ),
        .dADC_Data          ( i_adc_data            ),
        .sADC_SDIO          ( io_adc_sdio           ),
        .sADC_CS            ( o_adc_cs              ),
        .sADC_Sclk          ( o_adc_sclk            ),
        .sCh1CouplingH      ( o_adc_ch1_coupling_h  ),
        .sCh1CouplingL      ( o_adc_ch1_coupling_l  ),
        .sCh2CouplingH      ( o_adc_ch2_coupling_h  ),
        .sCh2CouplingL      ( o_adc_ch2_coupling_l  ),
        .sCh1GainH          ( o_adc_ch1_gain_h      ),
        .sCh1GainL          ( o_adc_ch1_gain_l      ),
        .sCh2GainH          ( o_adc_ch2_gain_h      ),
        .sCh2GainL          ( o_adc_ch2_gain_l      ),
        .sRelayComH         ( o_adc_relay_com_h     ),
        .sRelayComL         ( o_adc_relay_com_l     )
    );
    
endmodule

`default_nettype wire