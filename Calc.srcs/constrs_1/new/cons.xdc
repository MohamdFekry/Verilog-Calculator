#Input buttons 
set_property PACKAGE_PIN W19 [get_ports T1]
set_property IOSTANDARD LVCMOS33 [get_ports T1]
set_property PACKAGE_PIN U18 [get_ports U1]
set_property IOSTANDARD LVCMOS33 [get_ports U1]
set_property PACKAGE_PIN T17 [get_ports T2]
set_property IOSTANDARD LVCMOS33 [get_ports T2]
set_property PACKAGE_PIN U17 [get_ports U2]
set_property IOSTANDARD LVCMOS33 [get_ports U2]

#operatioonal switches
set_property PACKAGE_PIN R2 [get_ports plus]
set_property IOSTANDARD LVCMOS33 [get_ports plus]
set_property PACKAGE_PIN T1 [get_ports minus]
set_property IOSTANDARD LVCMOS33 [get_ports minus]
set_property PACKAGE_PIN U1 [get_ports multiply]
set_property IOSTANDARD LVCMOS33 [get_ports multiply]
set_property PACKAGE_PIN W2 [get_ports divide]
set_property IOSTANDARD LVCMOS33 [get_ports divide]
set_property PACKAGE_PIN R3 [get_ports original]
set_property IOSTANDARD LVCMOS33 [get_ports original]

#rst
set_property PACKAGE_PIN V17 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]

#clk
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

#Outputs
set_property PACKAGE_PIN W7 [get_ports out[6]]
set_property IOSTANDARD LVCMOS33 [get_ports out[6]]

set_property PACKAGE_PIN W6 [get_ports out[5]]
set_property IOSTANDARD LVCMOS33 [get_ports out[5]]

set_property PACKAGE_PIN U8 [get_ports out[4]]
set_property IOSTANDARD LVCMOS33 [get_ports out[4]]

set_property PACKAGE_PIN V8 [get_ports out[3]]
set_property IOSTANDARD LVCMOS33 [get_ports out[3]]

set_property PACKAGE_PIN U5 [get_ports out[2]]
set_property IOSTANDARD LVCMOS33 [get_ports out[2]]

set_property PACKAGE_PIN V5 [get_ports out[1]]
set_property IOSTANDARD LVCMOS33 [get_ports out[1]]

set_property PACKAGE_PIN U7 [get_ports out[0]]
set_property IOSTANDARD LVCMOS33 [get_ports out[0]]

set_property PACKAGE_PIN V7 [get_ports dot]
set_property IOSTANDARD LVCMOS33 [get_ports dot]

#leds
set_property PACKAGE_PIN W4 [get_ports leds[3]]
set_property IOSTANDARD LVCMOS33 [get_ports leds[3]]

set_property PACKAGE_PIN V4 [get_ports leds[2]]
set_property IOSTANDARD LVCMOS33 [get_ports leds[2]]

set_property PACKAGE_PIN U4 [get_ports leds[1]]
set_property IOSTANDARD LVCMOS33 [get_ports leds[1]]

set_property PACKAGE_PIN U2 [get_ports leds[0]]
set_property IOSTANDARD LVCMOS33 [get_ports leds[0]]