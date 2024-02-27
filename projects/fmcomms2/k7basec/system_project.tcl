###############################################################################
## Copyright (C) 2014-2023 Analog Devices, Inc. All rights reserved.
### SPDX short identifier: ADIBSD
###############################################################################

source ../../../scripts/adi_env.tcl
source $ad_hdl_dir/projects/scripts/adi_project_xilinx.tcl
source $ad_hdl_dir/projects/scripts/adi_board.tcl

adi_project fmcomms2_k7basec
adi_project_files fmcomms2_k7basec [list \
  "system_top.v" \
  "system_constr.xdc"\
  "$ad_hdl_dir/library/common/ad_iobuf.v" \
  "$ad_hdl_dir/projects/common/k7basec/k7basec_system_constr.xdc" ]

adi_project_run fmcomms2_k7basec
if {![info exists ::env(ADI_SKIP_SYNTHESIS)]} {
    source $ad_hdl_dir/library/axi_ad9361/axi_ad9361_delay.tcl
}


