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
  output wire        uart_sout
);

  // internal signals
  wire            sys_rst;
  wire    [63:0]  gpio_i;
  wire    [63:0]  gpio_o;
  wire    [63:0]  gpio_t;

  assign gpio_i[63:32] = gpio_o[63:32];
  assign gpio_i[31:0]  = gpio_o[31:0];

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

    .spi_clk_i (1'b0),
    .spi_clk_o (),
    .spi_csn_i (8'h01),
    .spi_csn_o (),
    .spi_sdi_i (1'b0),
    .spi_sdo_i (1'b0),
    .spi_sdo_o ()
    );

endmodule
`default_nettype wire
