###############################################################################
## Copyright (C) 2019-2023 Analog Devices, Inc. All rights reserved.
### SPDX short identifier: ADIBSD
###############################################################################

# instantiate the base design
source $ad_hdl_dir/projects/common/zc706/zc706_system_bd.tcl

# load all the FIFO related proccesses
source $ad_hdl_dir/projects/common/zc706/zc706_plddr3_adcfifo_bd.tcl
source $ad_hdl_dir/projects/common/xilinx/dacfifo_bd.tcl
# NOTE: to swap the resources comment the two lines above, and uncomment to two line below
#source $ad_hdl_dir/projects/common/zc706/zc706_plddr3_dacfifo_bd.tcl
#source $ad_hdl_dir/projects/common/xilinx/adcfifo_bd.tcl

# the DAC FIFO has a 500KSMP depth - 1 Mbyte
set dac_fifo_address_width 15

# by default PLDDR is used (1 Gbyte), this varible should be ignored
set adc_fifo_address_width 15

source ../common/fmcomms11_bd.tcl
source $ad_hdl_dir/projects/scripts/adi_pd.tcl

set mem_init_sys_path [get_env_param ADI_PROJECT_DIR ""]mem_init_sys.txt;

#system ID
ad_ip_parameter axi_sysid_0 CONFIG.ROM_ADDR_BITS 9
ad_ip_parameter rom_sys_0 CONFIG.PATH_TO_FILE "[pwd]/$mem_init_sys_path"
ad_ip_parameter rom_sys_0 CONFIG.ROM_ADDR_BITS 9

sysid_gen_sys_init_file
