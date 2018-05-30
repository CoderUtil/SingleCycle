# 
# Synthesis run script generated by Vivado
# 

  set_param gui.test TreeTableDev
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1
set_property target_language Verilog [current_project]
set_param project.compositeFile.enableAutoGeneration 0
set_property default_lib xil_defaultlib [current_project]
read_verilog -library xil_defaultlib {
  D:/WorkEnvironment/Vivado/VivadoProject/SingleCycle/SingleCycle.srcs/sources_1/new/Extended.v
  D:/WorkEnvironment/Vivado/VivadoProject/SingleCycle/SingleCycle.srcs/sources_1/new/DataSelect_3choices_32bits.v
  D:/WorkEnvironment/Vivado/VivadoProject/SingleCycle/SingleCycle.srcs/sources_1/new/DataSelect_2choices_5bits.v
  D:/WorkEnvironment/Vivado/VivadoProject/SingleCycle/SingleCycle.srcs/sources_1/new/DataSelect_2choices_32bits.v
  D:/WorkEnvironment/Vivado/VivadoProject/SingleCycle/SingleCycle.srcs/sources_1/new/ControlUnit.v
  D:/WorkEnvironment/Vivado/VivadoProject/SingleCycle/SingleCycle.srcs/sources_1/new/ALU.v
  D:/WorkEnvironment/Vivado/VivadoProject/SingleCycle/SingleCycle.srcs/sources_1/new/PCAddIm.v
  D:/WorkEnvironment/Vivado/VivadoProject/SingleCycle/SingleCycle.srcs/sources_1/new/PCAddj.v
  D:/WorkEnvironment/Vivado/VivadoProject/SingleCycle/SingleCycle.srcs/sources_1/new/PC.v
  D:/WorkEnvironment/Vivado/VivadoProject/SingleCycle/SingleCycle.srcs/sources_1/new/PCAddFour.v
  D:/WorkEnvironment/Vivado/VivadoProject/SingleCycle/SingleCycle.srcs/sources_1/new/RegFile.v
  D:/WorkEnvironment/Vivado/VivadoProject/SingleCycle/SingleCycle.srcs/sources_1/new/RMWM.v
  D:/WorkEnvironment/Vivado/VivadoProject/SingleCycle/SingleCycle.srcs/sources_1/new/RW.v
  D:/WorkEnvironment/Vivado/VivadoProject/SingleCycle/SingleCycle.srcs/sources_1/new/Main.v
}
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir D:/WorkEnvironment/Vivado/VivadoProject/SingleCycle/SingleCycle.cache/wt [current_project]
set_property parent.project_dir D:/WorkEnvironment/Vivado/VivadoProject/SingleCycle [current_project]
catch { write_hwdef -file Main.hwdef }
synth_design -top Main -part xc7a35tcpg236-1
write_checkpoint Main.dcp
report_utilization -file Main_utilization_synth.rpt -pb Main_utilization_synth.pb
