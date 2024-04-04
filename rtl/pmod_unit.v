`timescale 1ns / 1ps
`default_nettype none

module pmod_unit
(
    input wire i_clock,
    input wire i_nReset,
    input wire i_adc_init_done,
    input wire i_dac_init_done,
    output wire o_led0_r,
    output wire o_led0_g,
    output wire o_led0_b,
    output wire o_led1_r,
    output wire o_led1_g,
    output wire o_led1_b
);
    
    localparam LED_PWM_TICKS = 50;
    localparam SEC_TICKS = 100000000;

    reg led_pwm;
    integer led_pwm_counter;    
    integer sec_counter;
    
    // PWM generation.
    always@( posedge i_clock ) begin
        if( ~i_nReset ) begin
            led_pwm_counter <= 0;
            led_pwm <= 0;
        end
        else begin
            if( led_pwm_counter == LED_PWM_TICKS ) begin
                led_pwm <= 1'b1;
                led_pwm_counter <= 0;
            end
            else begin
                led_pwm <= 1'b0;
                led_pwm_counter <= led_pwm_counter + 1;
            end   
        end
    end 
    
    // Counter management.
    always@( posedge i_clock ) begin
        if( ~i_nReset ) begin
            sec_counter <= 0;
        end
        else begin 
            sec_counter <= sec_counter >= SEC_TICKS ? 0 : sec_counter + 1;
        end
    end
    
    // Outputs.
    assign o_led0_r = i_adc_init_done ? 1'b0 : led_pwm;
    assign o_led0_g = i_adc_init_done ? led_pwm : 1'b0;
    assign o_led0_b = 1'b0;
    assign o_led1_r = i_dac_init_done ? 1'b0 : led_pwm;
    assign o_led1_g = i_dac_init_done ? led_pwm : 1'b0;
    assign o_led1_b = 1'b0;
    
endmodule

`default_nettype wire
