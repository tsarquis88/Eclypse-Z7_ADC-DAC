`timescale 1ns / 1ns

module clock_unit_tb ();

  localparam SYS_CLOCK_PERIOD = 8;

  reg clock;
  reg reset;

  initial begin
    clock = 1'b0;
    reset = 1'b1;

    #100 reset = 1'b0;
  end

  always begin
    #(SYS_CLOCK_PERIOD / 2) clock = ~clock;
  end

  wire clock0;
  wire clock1;
  wire clock2;
  wire valid;

  clock_unit u_clock_unit (
      .i_clock (clock),
      .i_reset (reset),
      .o_clock0(clock0),
      .o_clock1(clock1),
      .o_clock2(clock2),
      .o_valid (valid)
  );

endmodule
