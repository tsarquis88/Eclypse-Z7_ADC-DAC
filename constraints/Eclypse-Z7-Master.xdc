## This file is a general .xdc for the Eclypse Z7 Rev. B.0
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## 125MHz Clock from Ethernet PHY
set_property -dict { PACKAGE_PIN D18   IOSTANDARD LVCMOS33 } [get_ports { i_clock }]; #IO_L12P_T1_MRCC Sch=sysclk
create_clock -add -name sys_clk_pin -period 8.00 -waveform {0 4} [get_ports { i_clock }];

## Buttons
set_property -dict { PACKAGE_PIN C17   IOSTANDARD LVCMOS33 } [get_ports { i_reset }]; #IO_L11P_T1_SRCC Sch=btn[0]

## Syzygy Port A -> ADC1410
set_property -dict { PACKAGE_PIN N20  IOSTANDARD DIFF_SSTL18_I } [get_ports { o_adc_clock_in_n }]; #IO_L14N_T2_SRCC Sch=syzygy_a_c2p_clk_n
set_property -dict { PACKAGE_PIN N19  IOSTANDARD DIFF_SSTL18_I } [get_ports { o_adc_clock_in_p }]; #IO_L14P_T2_SRCC Sch=syzygy_a_c2p_clk_p
set_property -dict { PACKAGE_PIN T17  IOSTANDARD LVCMOS18 } [get_ports { o_adc_ch1_coupling_l }]; #IO_L21N_T3_DQS Sch=syzygy_a_d_n[0]
set_property -dict { PACKAGE_PIN T16  IOSTANDARD LVCMOS18 } [get_ports { o_adc_ch1_coupling_h }]; #IO_L21P_T3_DQS Sch=syzygy_a_d_p[0]
set_property -dict { PACKAGE_PIN T19  IOSTANDARD LVCMOS18 } [get_ports { o_adc_ch2_coupling_l }]; #IO_L22N_T3 Sch=syzygy_a_d_n[1]
set_property -dict { PACKAGE_PIN R19  IOSTANDARD LVCMOS18 } [get_ports { o_adc_ch2_coupling_h }]; #IO_L22P_T3 Sch=syzygy_a_d_p[1]
set_property -dict { PACKAGE_PIN T18  IOSTANDARD LVCMOS18 } [get_ports { o_adc_sclk }]; #IO_L23N_T3 Sch=syzygy_a_d_n[2]
set_property -dict { PACKAGE_PIN R18  IOSTANDARD LVCMOS18 } [get_ports { io_adc_sdio }]; #IO_L23P_T3 Sch=syzygy_a_d_p[2]
set_property -dict { PACKAGE_PIN P18  IOSTANDARD LVCMOS18 } [get_ports { o_adc_ch2_gain_l }]; #IO_L20N_T3 Sch=syzygy_a_d_n[3]
set_property -dict { PACKAGE_PIN P17  IOSTANDARD LVCMOS18 } [get_ports { o_adc_ch2_gain_h }]; #IO_L20P_T3 Sch=syzygy_a_d_p[3]
set_property -dict { PACKAGE_PIN R16  IOSTANDARD LVCMOS18 } [get_ports { i_adc_data[2] }]; #IO_L24N_T3 Sch=syzygy_a_d_n[4]
set_property -dict { PACKAGE_PIN P16  IOSTANDARD LVCMOS18 } [get_ports { i_adc_data[9] }]; #IO_L24P_T3 Sch=syzygy_a_d_p[4]
set_property -dict { PACKAGE_PIN P15  IOSTANDARD LVCMOS18 } [get_ports { o_adc_ch1_gain_l }]; #IO_L19N_T3_VREF Sch=syzygy_a_d_n[5]
set_property -dict { PACKAGE_PIN N15  IOSTANDARD LVCMOS18 } [get_ports { o_adc_ch1_gain_h }]; #IO_L19P_T3 Sch=syzygy_a_d_p[5]
set_property -dict { PACKAGE_PIN K18  IOSTANDARD LVCMOS18 } [get_ports { i_adc_data[4] }]; #IO_L7N_T1 Sch=syzygy_a_d_n[6]
set_property -dict { PACKAGE_PIN J18  IOSTANDARD LVCMOS18 } [get_ports { i_adc_data[3] }]; #IO_L7P_T1 Sch=syzygy_a_d_p[6]
set_property -dict { PACKAGE_PIN K21  IOSTANDARD LVCMOS18 } [get_ports { o_adc_relay_com_l }]; #IO_L9N_T1_DQS Sch=syzygy_a_d_n[7]
set_property -dict { PACKAGE_PIN J20  IOSTANDARD LVCMOS18 } [get_ports { o_adc_relay_com_h }]; #IO_L9P_T1_DQS Sch=syzygy_a_d_p[7]
set_property -dict { PACKAGE_PIN M20  IOSTANDARD LVCMOS18 } [get_ports { o_adc_dco_clock_n }]; #IO_L13N_T2_MRCC Sch=syzygy_a_p2c_clk_n
set_property -dict { PACKAGE_PIN M19  IOSTANDARD LVCMOS18 } [get_ports { i_adc_dco_clock_p }]; #IO_L13P_T2_MRCC Sch=syzygy_a_p2c_clk_p
set_property -dict { PACKAGE_PIN L19  IOSTANDARD LVCMOS18 } [get_ports { i_adc_data[5] }]; #IO_L12N_T1_MRCC Sch=syzygy_a_s[16]
set_property -dict { PACKAGE_PIN K20  IOSTANDARD LVCMOS18 } [get_ports { i_adc_data[8] }]; #IO_L11N_T1_SRCC Sch=syzygy_a_s[17]
set_property -dict { PACKAGE_PIN L18  IOSTANDARD LVCMOS18 } [get_ports { i_adc_data[6] }]; #IO_L12P_T1_MRCC Sch=syzygy_a_s[18]
set_property -dict { PACKAGE_PIN K19  IOSTANDARD LVCMOS18 } [get_ports { i_adc_data[10] }]; #IO_L11P_T1_SRCC Sch=syzygy_a_s[19]
set_property -dict { PACKAGE_PIN L22  IOSTANDARD LVCMOS18 } [get_ports { i_adc_data[7] }]; #IO_L10N_T1 Sch=syzygy_a_s[20]
set_property -dict { PACKAGE_PIN J22  IOSTANDARD LVCMOS18 } [get_ports { i_adc_data[11] }]; #IO_L8N_T1 Sch=syzygy_a_s[21]
set_property -dict { PACKAGE_PIN L21  IOSTANDARD LVCMOS18 } [get_ports { i_adc_data[1] }]; #IO_L10P_T1 Sch=syzygy_a_s[22]
set_property -dict { PACKAGE_PIN J21  IOSTANDARD LVCMOS18 } [get_ports { i_adc_data[12] }]; #IO_L8P_T1 Sch=syzygy_a_s[23]
set_property -dict { PACKAGE_PIN N22  IOSTANDARD LVCMOS18 } [get_ports { i_adc_data[0] }]; #IO_L16P_T2 Sch=syzygy_a_s[24]
set_property -dict { PACKAGE_PIN P22  IOSTANDARD LVCMOS18 } [get_ports { i_adc_data[13] }]; #IO_L16N_T2 Sch=syzygy_a_s[25]
set_property -dict { PACKAGE_PIN M21  IOSTANDARD LVCMOS18 } [get_ports { o_adc_cs }]; #IO_L15P_T2_DQS Sch=syzygy_a_s[26]
set_property -dict { PACKAGE_PIN M22  IOSTANDARD LVCMOS18 } [get_ports { o_adc_sync }]; #IO_L15N_T2_DQS Sch=syzygy_a_s[27]
set_property DRIVE 4 [get_ports io_adc_sdio]
set_property DRIVE 4 [get_ports o_adc_cs]
set_property DRIVE 4 [get_ports o_adc_sclk]
set_property DRIVE 4 [get_ports o_adc_sync]
set_property SLEW SLOW [get_ports o_adc_sync]
set_property SLEW SLOW [get_ports -filter { name =~ o_adc_clock_in_* }]
create_clock -period 10.000 -name i_adc_dco_clock_p -waveform {0.000 5.000} [get_ports i_adc_dco_clock_p]
set_input_delay -clock [get_clocks i_adc_dco_clock_p] -clock_fall -min -add_delay 3.240 [get_ports {i_adc_data}]
set_input_delay -clock [get_clocks i_adc_dco_clock_p] -clock_fall -max -add_delay 5.440 [get_ports {i_adc_data}]
set_input_delay -clock [get_clocks i_adc_dco_clock_p] -min -add_delay 3.240 [get_ports {i_adc_data}]
set_input_delay -clock [get_clocks i_adc_dco_clock_p] -max -add_delay 5.440 [get_ports {i_adc_data}]

## Syzygy Port B -> DAC1411
set_property -dict { PACKAGE_PIN Y16  IOSTANDARD LVCMOS18 } [get_ports { o_dac_clkin_n }]; #IO_L14N_T2_SRCC Sch=syzygy_b_c2p_clk_n
set_property -dict { PACKAGE_PIN W16  IOSTANDARD LVCMOS18 } [get_ports { o_dac_clkin_p }]; #IO_L14P_T2_SRCC Sch=syzygy_b_c2p_clk_p
set_property -dict { PACKAGE_PIN Y15  IOSTANDARD LVCMOS18 } [get_ports { o_dac_set_fs_ch2 }]; #IO_L21N_T3_DQS Sch=syzygy_b_d_n[0]
set_property -dict { PACKAGE_PIN W15  IOSTANDARD LVCMOS18 } [get_ports { o_dac_set_fs_ch1 }]; #IO_L21P_T3_DQS Sch=syzygy_b_d_p[0]
set_property -dict { PACKAGE_PIN W13  IOSTANDARD LVCMOS18 } [get_ports { o_dac_data[12] }]; #IO_L20N_T3 Sch=syzygy_b_d_n[1]
set_property -dict { PACKAGE_PIN V13  IOSTANDARD LVCMOS18 } [get_ports { o_dac_data[13] }]; #IO_L20P_T3 Sch=syzygy_b_d_p[1]
set_property -dict { PACKAGE_PIN AA13 IOSTANDARD LVCMOS18 } [get_ports { o_dac_sclk }]; #IO_L23N_T3 Sch=syzygy_b_d_n[2]
set_property -dict { PACKAGE_PIN Y13  IOSTANDARD LVCMOS18 } [get_ports { o_dac_reset }]; #IO_L23P_T3 Sch=syzygy_b_d_p[2]
set_property -dict { PACKAGE_PIN AB15 IOSTANDARD LVCMOS18 } [get_ports { o_dac_data[10] }]; #IO_L24N_T3 Sch=syzygy_b_d_n[3]
set_property -dict { PACKAGE_PIN AB14 IOSTANDARD LVCMOS18 } [get_ports { o_dac_data[11] }]; #IO_L24P_T3 Sch=syzygy_b_d_p[3]
set_property -dict { PACKAGE_PIN AA14 IOSTANDARD LVCMOS18 } [get_ports { o_dac_cs }]; #IO_L22N_T3 Sch=syzygy_b_d_n[4]
set_property -dict { PACKAGE_PIN Y14  IOSTANDARD LVCMOS18 } [get_ports { io_dac_sdio }]; #IO_L22P_T3 Sch=syzygy_b_d_p[4]
set_property -dict { PACKAGE_PIN V15  IOSTANDARD LVCMOS18 } [get_ports { o_dac_data[8] }]; #IO_L19N_T3_VREF Sch=syzygy_b_d_n[5]
set_property -dict { PACKAGE_PIN V14  IOSTANDARD LVCMOS18 } [get_ports { o_dac_data[9] }]; #IO_L19P_T3 Sch=syzygy_b_d_p[5]
set_property -dict { PACKAGE_PIN AB22 IOSTANDARD LVCMOS18 } [get_ports { o_dac_data[2] }]; #IO_L7N_T1 Sch=syzygy_b_d_n[6]
set_property -dict { PACKAGE_PIN AA22 IOSTANDARD LVCMOS18 } [get_ports { o_dac_enable }]; #IO_L7P_T1 Sch=syzygy_b_d_p[6]
set_property -dict { PACKAGE_PIN Y21  IOSTANDARD LVCMOS18 } [get_ports { o_dac_data[6] }]; #IO_L9N_T1_DQS Sch=syzygy_b_d_n[7]
set_property -dict { PACKAGE_PIN Y20  IOSTANDARD LVCMOS18 } [get_ports { o_dac_data[7] }]; #IO_L9P_T1_DQS Sch=syzygy_b_d_p[7]
set_property -dict { PACKAGE_PIN W18  IOSTANDARD LVCMOS18 } [get_ports { o_dac_clkio_n }]; #IO_L13N_T2_MRCC Sch=syzygy_b_p2c_clk_n
set_property -dict { PACKAGE_PIN W17  IOSTANDARD LVCMOS18 } [get_ports { o_dac_clkio_p }]; #IO_L13P_T2_MRCC Sch=syzygy_b_p2c_clk_p
set_property -dict { PACKAGE_PIN AA18 IOSTANDARD LVCMOS18 } [get_ports { o_dac_data[4] }]; #IO_L12N_T1_MRCC Sch=syzygy_b_s[16]
set_property -dict { PACKAGE_PIN AA19 IOSTANDARD LVCMOS18 } [get_ports { o_dac_data[5] }]; #IO_L11N_T1_SRCC Sch=syzygy_b_s[17]
set_property -dict { PACKAGE_PIN Y18  IOSTANDARD LVCMOS18 } [get_ports { o_dac_data[1] }]; #IO_L12P_T1_MRCC Sch=syzygy_b_s[18]
set_property -dict { PACKAGE_PIN Y19  IOSTANDARD LVCMOS18 } [get_ports { o_dac_data[0] }]; #IO_L11P_T1_SRCC Sch=syzygy_b_s[19]
set_property -dict { PACKAGE_PIN AB20 IOSTANDARD LVCMOS18 } [get_ports { o_dac_data[3] }]; #IO_L10N_T1 Sch=syzygy_b_s[20]
#set_property -dict { PACKAGE_PIN AB21 } [get_ports { syzygy_b_s[21] }]; #IO_L8N_T1 Sch=syzygy_b_s[21]
#set_property -dict { PACKAGE_PIN AB19 } [get_ports { syzygy_b_s[22] }]; #IO_L10P_T1 Sch=syzygy_b_s[22]
#set_property -dict { PACKAGE_PIN AA21 } [get_ports { syzygy_b_s[23] }]; #IO_L8P_T1 Sch=syzygy_b_s[23]
#set_property -dict { PACKAGE_PIN U16  } [get_ports { syzygy_b_s[24] }]; #IO_L15N_T2_DQS Sch=syzygy_b_s[24]
#set_property -dict { PACKAGE_PIN U15  } [get_ports { syzygy_b_s[25] }]; #IO_L15P_T2_DQS Sch=syzygy_b_s[25]
#set_property -dict { PACKAGE_PIN V17  } [get_ports { syzygy_b_s[26] }]; #IO_L16N_T2 Sch=syzygy_b_s[26]
#set_property -dict { PACKAGE_PIN U17  } [get_ports { syzygy_b_s[27] }]; #IO_L16P_T2 Sch=syzygy_b_s[27]