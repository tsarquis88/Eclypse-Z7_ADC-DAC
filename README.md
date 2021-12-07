# Eclypse-Z7_ADC-DAC

## This is made with [outdated IPs](https://github.com/Digilent/vivado-library/tree/d1a02637eb5ada12cc60d971c0b834d5d7e245e6/ip/Zmods).

## Description
A Verilog-pure ADC-DAC loop back program using the ZMOD ADC1410 and ZMOD DAC1411 on Eclypse Z7 FPGA.
## Sources
```
rtl/top.v               : An example of a top level design
rtl/adc1410.v           : Wrapper of the ADC1410 IP core
rtl/dac1411.v           : Wrapper of the DAC1411 IP core
rtl/clock_generator.v   : Clock Wizard wrapper
```
