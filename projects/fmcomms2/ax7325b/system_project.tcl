###############################################################################
## Copyright (C) 2014-2023 Analog Devices, Inc. All rights reserved.
### SPDX short identifier: ADIBSD
###############################################################################

source ../../../scripts/adi_env.tcl
source $ad_hdl_dir/projects/scripts/adi_project_xilinx.tcl
source $ad_hdl_dir/projects/scripts/adi_board.tcl

adi_project fmcomms2_ax7325b
adi_project_files fmcomms2_ax7325b [list \
  "system_top.v" \
  "system_constr.xdc"\
  "$ad_hdl_dir/library/common/ad_iobuf.v" \
  "$ad_hdl_dir/projects/common/ax7325b/ax7325b_system_constr.xdc" ]

adi_project_run fmcomms2_ax7325b
source $ad_hdl_dir/library/axi_ad9361/axi_ad9361_delay.tcl

