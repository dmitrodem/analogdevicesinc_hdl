###############################################################################
## Copyright (C) 2014-2023 Analog Devices, Inc. All rights reserved.
### SPDX short identifier: ADIBSD
###############################################################################

# constraints
create_clock -period 5.000 -name sys_clk_p [get_ports sys_clk_p]

set_property -dict  {PACKAGE_PIN  AG27  IOSTANDARD  LVCMOS25} [get_ports sys_rst_n]

# clocks

set_property -dict  {PACKAGE_PIN  AE10  IOSTANDARD  DIFF_SSTL15} [get_ports sys_clk_p]
set_property -dict  {PACKAGE_PIN  AF10  IOSTANDARD  DIFF_SSTL15} [get_ports sys_clk_n]

# uart

set_property -dict  {PACKAGE_PIN  AJ26  IOSTANDARD  LVCMOS25} [get_ports uart_sin]
set_property -dict  {PACKAGE_PIN  AK26  IOSTANDARD  LVCMOS25} [get_ports uart_sout]

# fan

set_property -dict  {PACKAGE_PIN  AE26  IOSTANDARD  LVCMOS25} [get_ports fan_pwm]

#Setting the Configuration Bank Voltage Select
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN Pullup [current_design]
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

# Create SPI clock
create_generated_clock -name spi_clk  \
  -source [get_pins i_system_wrapper/system_i/axi_spi/ext_spi_clk] \
  -divide_by 2 [get_pins i_system_wrapper/system_i/axi_spi/sck_o]
