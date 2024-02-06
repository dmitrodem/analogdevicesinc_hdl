###############################################################################
## Copyright (C) 2014-2023 Analog Devices, Inc. All rights reserved.
### SPDX short identifier: ADIBSD
###############################################################################

# constraints
create_clock -period 20.000 -name sys_clk_50M [get_ports sys_clk_50M]

set_property -dict  {PACKAGE_PIN   D26  IOSTANDARD  LVCMOS33} [get_ports sys_rst_n]

# clocks

set_property -dict  {PACKAGE_PIN   G22  IOSTANDARD  LVCMOS33} [get_ports sys_clk_50M]

# uart

set_property -dict  {PACKAGE_PIN   B20  IOSTANDARD  LVCMOS33} [get_ports uart_sin]
set_property -dict  {PACKAGE_PIN   C22  IOSTANDARD  LVCMOS33} [get_ports uart_sout]

# ethernet

# set_property -dict {IOSTANDARD PACKAGE_PIN } [get_ports {mii_rx_dv}]
# set_property -dict {IOSTANDARD PACKAGE_PIN } [get_ports {mii_rxd[0]}]
# set_property -dict {IOSTANDARD PACKAGE_PIN } [get_ports {mii_rxd[1]}]
# set_property -dict {IOSTANDARD PACKAGE_PIN } [get_ports {mii_rxd[2]}]
# set_property -dict {IOSTANDARD PACKAGE_PIN } [get_ports {mii_rxd[3]}]
# set_property -dict {IOSTANDARD PACKAGE_PIN } [get_ports {mii_rx_clk}]
# set_property -dict {IOSTANDARD PACKAGE_PIN } [get_ports {mii_rx_er}]
# set_property -dict {IOSTANDARD PACKAGE_PIN } [get_ports {mii_col}]
# set_property -dict {IOSTANDARD PACKAGE_PIN } [get_ports {mii_crs}]
# set_property -dict {IOSTANDARD PACKAGE_PIN } [get_ports {mii_tx_en}]
# set_property -dict {IOSTANDARD PACKAGE_PIN } [get_ports {mii_txd[0]}]
# set_property -dict {IOSTANDARD PACKAGE_PIN } [get_ports {mii_rst_n}]
# set_property -dict {IOSTANDARD PACKAGE_PIN } [get_ports {mii_txd[1]}]
# set_property -dict {IOSTANDARD PACKAGE_PIN } [get_ports {mii_txd[2]}]
# set_property -dict {IOSTANDARD PACKAGE_PIN } [get_ports {mii_txd[3]}]
# set_property -dict {IOSTANDARD PACKAGE_PIN } [get_ports {mii_tx_clk}]
# set_property -dict {IOSTANDARD PACKAGE_PIN } [get_ports {mii_tx_er}]
# set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN   W1} [get_ports {mdio_mdc}]
# set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN  AF5} [get_ports {mdio_mdio}]

# set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets -of [get_pins -of [get_cells -of [get_pins -leaf -of [get_nets mii_tx_clk]]] -filter {direction == OUT}]]
# set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets -of [get_pins -of [get_cells -of [get_pins -leaf -of [get_nets mii_rx_clk]]] -filter {direction == OUT}]]

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
