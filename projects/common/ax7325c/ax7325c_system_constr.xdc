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

# ethernet

set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN J24} [get_ports {mii_rx_dv}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN J23} [get_ports {mii_rxd[0]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN J22} [get_ports {mii_rxd[1]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN J21} [get_ports {mii_rxd[2]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN J26} [get_ports {mii_rxd[3]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN K26} [get_ports {mii_rx_clk}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN M27} [get_ports {mii_rx_er}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN N27} [get_ports {mii_col}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN N30} [get_ports {mii_crs}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN L27} [get_ports {mii_tx_en}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN L26} [get_ports {mii_txd[0]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN J28} [get_ports {mii_rst_n}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN J27} [get_ports {mii_txd[1]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN H29} [get_ports {mii_txd[2]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN J29} [get_ports {mii_txd[3]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN K29} [get_ports {mii_tx_clk}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN L21} [get_ports {mii_tx_er}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN L23} [get_ports {mdio_mdc}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN L22} [get_ports {mdio_mdio}]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets -of [get_pins -of [get_cells -of [get_pins -leaf -of [get_nets mii_tx_clk]]] -filter {direction == OUT}]]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets -of [get_pins -of [get_cells -of [get_pins -leaf -of [get_nets mii_rx_clk]]] -filter {direction == OUT}]]

# Setting the Configuration Bank Voltage Select
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
