# Eclypse-Z7_ADC-DAC

## Description

A Verilog-pure ADC-DAC loop back program using the ZMOD ADC1410 and ZMOD DAC1411 on Eclypse Z7 FPGA.

## Sources

```
rtl/top.v        : An example of a top level design
rtl/adc.v        : Wrapper of the ADC1410 IP core
rtl/dac.v        : Wrapper of the DAC1411 IP core
rtl/clock_unit.v : Clock Wizard wrapper
rtl/pmod_unit.v  : LED lights manager
```
