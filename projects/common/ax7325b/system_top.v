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

`timescale 1ns/100ps

module system_top (

  input           sys_rst_n,
  input           sys_clk_p,
  input           sys_clk_n,

  input           uart_sin,
  output          uart_sout,
  output          fan_pwm
);

  // internal signals
  wire            sys_clk;
  wire            sys_clk_bufg;
  wire            sys_rst;
  wire    [63:0]  gpio_i;
  wire    [63:0]  gpio_o;
  wire    [63:0]  gpio_t;

  assign gpio_i[63:32] = gpio_o[63:32];
  assign gpio_i[31:0]  = gpio_o[31:0];

  // default logic
  assign fan_pwm = 1'b0;
  assign sys_rst = ~sys_rst_n;

  // instantiations
  IBUFDS i_sys_clkbuf (
    .O  (sys_clk),
    .I  (sys_clk_p),
    .IB (sys_clk_n));
  BUFG i_sys_bufg (
    .I (sys_clk),
    .O (sys_clk_bufg));
  system_wrapper i_system_wrapper (
    .gpio0_i (gpio_i[31:0]),
    .gpio0_o (gpio_o[31:0]),
    .gpio0_t (gpio_t[31:0]),
    .gpio1_i (gpio_i[63:32]),
    .gpio1_o (gpio_o[63:32]),
    .gpio1_t (gpio_t[63:32]),

    .sys_clk (sys_clk_bufg),
    .sys_rst (sys_rst),

    .uart_sin (uart_sin),
    .uart_sout (uart_sout),

    .spi_clk_i (),
    .spi_clk_o (),
    .spi_csn_i (1'b1),
    .spi_csn_o (),
    .spi_sdi_i (1'b0),
    .spi_sdo_i (1'b0),
    .spi_sdo_o ());

endmodule
