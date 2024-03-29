###############################################################################
## Copyright (C) 2014-2023 Analog Devices, Inc. All rights reserved.
### SPDX short identifier: ADIBSD
###############################################################################

# ip
source ../../scripts/adi_env.tcl
source $ad_hdl_dir/library/scripts/adi_ip_xilinx.tcl

adi_ip_create util_rfifo
adi_ip_files util_rfifo [list \
  "$ad_hdl_dir/library/common/ad_mem.v" \
  "util_rfifo_constr.xdc" \
  "util_rfifo.v" ]

adi_ip_properties_lite util_rfifo

set_property company_url {https://wiki.analog.com/resources/fpga/docs/util_rfifo} [ipx::current_core]

ipx::remove_all_bus_interface [ipx::current_core]
set_property driver_value 0 [ipx::get_ports *dout_enable* -of_objects [ipx::current_core]]
set_property driver_value 0 [ipx::get_ports *dout_valid* -of_objects [ipx::current_core]]
set_property driver_value 0 [ipx::get_ports *din_valid_in* -of_objects [ipx::current_core]]
set_property driver_value 0 [ipx::get_ports *din_data* -of_objects [ipx::current_core]]
set_property driver_value 0 [ipx::get_ports *din_unf* -of_objects [ipx::current_core]]
set_property enablement_dependency {spirit:decode(id('MODELPARAM_VALUE.NUM_OF_CHANNELS')) > 1} \
  [ipx::get_ports *_1* -of_objects [ipx::current_core]]
set_property enablement_dependency {spirit:decode(id('MODELPARAM_VALUE.NUM_OF_CHANNELS')) > 2} \
  [ipx::get_ports *_2* -of_objects [ipx::current_core]]
set_property enablement_dependency {spirit:decode(id('MODELPARAM_VALUE.NUM_OF_CHANNELS')) > 3} \
  [ipx::get_ports *_3* -of_objects [ipx::current_core]]
set_property enablement_dependency {spirit:decode(id('MODELPARAM_VALUE.NUM_OF_CHANNELS')) > 4} \
  [ipx::get_ports *_4* -of_objects [ipx::current_core]]
set_property enablement_dependency {spirit:decode(id('MODELPARAM_VALUE.NUM_OF_CHANNELS')) > 5} \
  [ipx::get_ports *_5* -of_objects [ipx::current_core]]
set_property enablement_dependency {spirit:decode(id('MODELPARAM_VALUE.NUM_OF_CHANNELS')) > 6} \
  [ipx::get_ports *_6* -of_objects [ipx::current_core]]
set_property enablement_dependency {spirit:decode(id('MODELPARAM_VALUE.NUM_OF_CHANNELS')) > 7} \
  [ipx::get_ports *_7* -of_objects [ipx::current_core]]

ipx::infer_bus_interface din_clk xilinx.com:signal:clock_rtl:1.0 [ipx::current_core]
ipx::infer_bus_interface dout_clk xilinx.com:signal:clock_rtl:1.0 [ipx::current_core]
ipx::infer_bus_interface din_rstn xilinx.com:signal:reset_rtl:1.0 [ipx::current_core]
ipx::infer_bus_interface dout_rst xilinx.com:signal:reset_rtl:1.0 [ipx::current_core]

ipx::save_core [ipx::current_core]


