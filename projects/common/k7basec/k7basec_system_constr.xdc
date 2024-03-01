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

# create_clock -period 8.000 -name rgmii_rxc [get_ports rgmii_rxc]

set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN   Y2} [get_ports {phy_rst_n}]

set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN   W1} [get_ports {mdio_mdc}]
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN  AF5} [get_ports {mdio_mdio_io}]

set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN  AE1} [get_ports {rgmii_rd[3]}]
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN  AE2} [get_ports {rgmii_rd[2]}]
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN  AC3} [get_ports {rgmii_rd[1]}]
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN  AF3} [get_ports {rgmii_rd[0]}]
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN  AF4} [get_ports {rgmii_rx_ctl}]
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN  AB2} [get_ports {rgmii_rxc}]

set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN   Y3} [get_ports {rgmii_td[3]}]
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN  AB4} [get_ports {rgmii_td[2]}]
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN  AB1} [get_ports {rgmii_td[1]}]
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN  AC1} [get_ports {rgmii_td[0]}]
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN   Y1} [get_ports {rgmii_tx_ctl}]
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN  AC2} [get_ports {rgmii_txc}]

# EEPROM I2C
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN  B21 PULLUP TRUE} [get_ports {iic_eeprom_scl_io}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN  C21 PULLUP TRUE} [get_ports {iic_eeprom_sda_io}]

# FMC I2C
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN  C19 PULLUP TRUE} [get_ports {iic_main_scl_io}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN  B19 PULLUP TRUE} [get_ports {iic_main_sda_io}]

# GPIO LEDs & Buttons
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN  A23} [get_ports {gpio_led_1}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN  A24} [get_ports {gpio_led_2}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN  D23} [get_ports {gpio_led_3}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN  C24} [get_ports {gpio_led_4}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN  C26} [get_ports {gpio_led_5}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN  D24} [get_ports {gpio_led_6}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN  D25} [get_ports {gpio_led_7}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN  E25} [get_ports {gpio_led_8}]

set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN  J26} [get_ports {gpio_key_2}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN  E26} [get_ports {gpio_key_3}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN  G26} [get_ports {gpio_key_4}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN  H26} [get_ports {gpio_key_5}]

# SD card
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN  G24} [get_ports {sd_clk}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN  F24} [get_ports {sd_csn[0]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN  F23} [get_ports {sd_miso}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN  G25} [get_ports {sd_mosi}]

# QSPI flash
# set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN   C8} [get_ports {qspi_flash_sck_io}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN  C23} [get_ports {qspi_flash_ss_io[0]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN  B24} [get_ports {qspi_flash_io0_io}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN  A25} [get_ports {qspi_flash_io1_io}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN  B22} [get_ports {qspi_flash_io2_io}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN  A22} [get_ports {qspi_flash_io3_io}]

# OLED
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN  J24} [get_ports {oled_d0}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN  J25} [get_ports {oled_d1}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN  H22} [get_ports {oled_dc}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN  J21} [get_ports {oled_rstn}]

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
