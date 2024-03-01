// ***************************************************************************
// ***************************************************************************
// Copyright (C) 2022-2023 Analog Devices, Inc. All rights reserved.
//
// In this HDL repository, there are many different and unique modules, consisting
// of various HDL (Verilog or VHDL) components. The individual modules are
// developed independently, and may be accompanied by separate and unique license
// terms.
//
// The user should read each of these license terms, and understand the
// freedoms and responsibilities that he or she has by using this source/core.
//
// This core is distributed in the hope that it will be useful, but WITHOUT ANY
// WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
// A PARTICULAR PURPOSE.
//
// Redistribution and use of source or resulting binaries, with or without modification
// of this file, are permitted under one of the following two license terms:
//
//   1. The GNU General Public License version 2 as published by the
//      Free Software Foundation, which can be found in the top level directory
//      of this repository (LICENSE_GPL2), and also online at:
//      <https://www.gnu.org/licenses/old-licenses/gpl-2.0.html>
//
// OR
//
//   2. An ADI specific BSD license, which can be found in the top level directory
//      of this repository (LICENSE_ADIBSD), and also on-line at:
//      https://github.com/analogdevicesinc/hdl/blob/master/LICENSE_ADIBSD
//      This will allow to generate bit files and not release the source code,
//      as long as it attaches to an ADI device.
//
// ***************************************************************************
// ***************************************************************************
`default_nettype none
`timescale 1ns/100ps

module system_top (

  input wire         sys_rst_n,
  input wire         sys_clk_50M,

  output wire [14:0] ddr3_addr,
  output wire [2:0]  ddr3_ba,
  output wire        ddr3_cas_n,
  output wire [0:0]  ddr3_ck_n,
  output wire [0:0]  ddr3_ck_p,
  output wire [0:0]  ddr3_cke,
  output wire [0:0]  ddr3_cs_n,
  output wire [3:0]  ddr3_dm,
  inout wire [31:0]  ddr3_dq,
  inout wire [3:0]   ddr3_dqs_n,
  inout wire [3:0]   ddr3_dqs_p,
  output wire [0:0]  ddr3_odt,
  output wire        ddr3_ras_n,
  output wire        ddr3_reset_n,
  output wire        ddr3_we_n,

  input wire         uart_sin,
  output wire        uart_sout,

  inout wire         iic_main_scl_io,
  inout wire         iic_main_sda_io,

  inout wire         iic_eeprom_scl_io,
  inout wire         iic_eeprom_sda_io,

  output wire        phy_rst_n,
  output wire        mdio_mdc,
  inout wire         mdio_mdio_io,

  input wire [3:0]   rgmii_rd,
  input wire         rgmii_rx_ctl,
  input wire         rgmii_rxc,
  output wire [3:0]  rgmii_td,
  output wire        rgmii_tx_ctl,
  output wire        rgmii_txc,

  output wire        gpio_led_1,
  output wire        gpio_led_2,
  output wire        gpio_led_3,
  output wire        gpio_led_4,
  output wire        gpio_led_5,
  output wire        gpio_led_6,
  output wire        gpio_led_7,
  output wire        gpio_led_8,

  input wire         gpio_key_2,
  input wire         gpio_key_3,
  input wire         gpio_key_4,
  input wire         gpio_key_5,

  output wire        sd_clk,
  output wire [0:0]  sd_csn,
  output wire        sd_mosi,
  input wire         sd_miso,

  inout wire         qspi_flash_io0_io,
  inout wire         qspi_flash_io1_io,
  inout wire         qspi_flash_io2_io,
  inout wire         qspi_flash_io3_io,
  inout wire [0:0]   qspi_flash_ss_io,

  output wire        oled_d0,
  output wire        oled_d1,
  output wire        oled_dc,
  output wire        oled_rstn

);

  // internal signals
  wire            sys_rst;
  wire    [63:0]  gpio_i;
  wire    [63:0]  gpio_o;
  wire    [63:0]  gpio_t;

  assign gpio_i[63:32] = gpio_o[63:32];
  assign gpio_i[31:0]  = {
    gpio_o[31:12],
    gpio_key_5, gpio_key_4, gpio_key_3, gpio_key_2,
    gpio_o[7:0]
  };

  assign gpio_led_1 = gpio_o[0];
  assign gpio_led_2 = gpio_o[1];
  assign gpio_led_3 = gpio_o[2];
  assign gpio_led_4 = gpio_o[3];
  assign gpio_led_5 = gpio_o[4];
  assign gpio_led_6 = gpio_o[5];
  assign gpio_led_7 = gpio_o[6];
  assign gpio_led_8 = gpio_o[7];

  assign oled_dc    = gpio_o[12];
  assign oled_rstn  = gpio_o[13];

  // default logic
  assign sys_rst = ~sys_rst_n;

  // instantiations
  system_wrapper i_system_wrapper (
    .ddr3_addr (ddr3_addr),
    .ddr3_ba (ddr3_ba),
    .ddr3_cas_n (ddr3_cas_n),
    .ddr3_ck_n (ddr3_ck_n),
    .ddr3_ck_p (ddr3_ck_p),
    .ddr3_cke (ddr3_cke),
    .ddr3_cs_n (ddr3_cs_n),
    .ddr3_dm (ddr3_dm),
    .ddr3_dq (ddr3_dq),
    .ddr3_dqs_n (ddr3_dqs_n),
    .ddr3_dqs_p (ddr3_dqs_p),
    .ddr3_odt (ddr3_odt),
    .ddr3_ras_n (ddr3_ras_n),
    .ddr3_reset_n (ddr3_reset_n),
    .ddr3_we_n (ddr3_we_n),

    .gpio0_i (gpio_i[31:0]),
    .gpio0_o (gpio_o[31:0]),
    .gpio0_t (gpio_t[31:0]),
    .gpio1_i (gpio_i[63:32]),
    .gpio1_o (gpio_o[63:32]),
    .gpio1_t (gpio_t[63:32]),

    .sys_clk_50M (sys_clk_50M),
    .sys_rst (sys_rst),

    .uart_sin (uart_sin),
    .uart_sout (uart_sout),

    .iic_main_scl_io (iic_main_scl_io),
    .iic_main_sda_io (iic_main_sda_io),

    .iic_eeprom_scl_io (iic_eeprom_scl_io),
    .iic_eeprom_sda_io (iic_eeprom_sda_io),

    .mdio_mdc (mdio_mdc),
    .mdio_mdio_io (mdio_mdio_io),
    .phy_rst_n (phy_rst_n),
    .rgmii_rd (rgmii_rd),
    .rgmii_rx_ctl (rgmii_rx_ctl),
    .rgmii_rxc (rgmii_rxc),
    .rgmii_td (rgmii_td),
    .rgmii_tx_ctl (rgmii_tx_ctl),
    .rgmii_txc (rgmii_txc),

    .spi_clk_i (1'b0),
    .spi_clk_o (),
    .spi_csn_i (8'h01),
    .spi_csn_o (),
    .spi_sdi_i (1'b0),
    .spi_sdo_i (1'b0),
    .spi_sdo_o (),

    .sd_clk (sd_clk),
    .sd_csn (sd_csn),
    .sd_mosi (sd_mosi),
    .sd_miso (sd_miso),

    .qspi_flash_io0_io (qspi_flash_io0_io),
    .qspi_flash_io1_io (qspi_flash_io1_io),
    .qspi_flash_io2_io (qspi_flash_io2_io),
    .qspi_flash_io3_io (qspi_flash_io3_io),
    .qspi_flash_ss_io  (qspi_flash_ss_io),

    .oled_d0  (oled_d0),
    .oled_d1  (oled_d1)
    );

endmodule
`default_nettype wire
