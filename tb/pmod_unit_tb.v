`timescale 1ns / 1ns

module pmod_unit_tb ();

  localparam SYS_CLOCK_PERIOD = 8;

  reg clock;
  reg reset;
  reg adc_init_done;
  reg dac_init_done;

  initial begin
    clock = 1'b0;
    reset = 1'b1;
    adc_init_done = 1'b0;
    dac_init_done = 1'b0;

    #100 reset = 1'b0;
  end

  always begin
    #(SYS_CLOCK_PERIOD / 2) clock = ~clock;
  end

  always begin
    #(SYS_CLOCK_PERIOD * 1000) adc_init_done = 1'b1;
  end

  always begin
    #(SYS_CLOCK_PERIOD * 2000) dac_init_done = 1'b1;
  end

  wire led0_r;
  wire led0_g;
  wire led0_b;
  wire led1_r;
  wire led1_g;
  wire led1_b;

  pmod_unit u_pmod_unit (
      .i_clock(clock),
      .i_reset(reset),
      .i_adc_init_done(adc_init_done),
      .i_dac_init_done(dac_init_done),
      .o_led0_r(led0_r),
      .o_led0_g(led0_g),
      .o_led0_b(led0_b),
      .o_led1_r(led1_r),
      .o_led1_g(led1_g),
      .o_led1_b(led1_b)
  );

endmodule
