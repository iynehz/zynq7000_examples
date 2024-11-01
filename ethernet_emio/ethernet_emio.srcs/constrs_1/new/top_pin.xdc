set_property IOSTANDARD LVCMOS33 [get_ports {enet0_gmii_txd[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {enet0_gmii_txd[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {enet0_gmii_txd[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {enet0_gmii_txd[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {enet0_gmii_rxd[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {enet0_gmii_rxd[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {enet0_gmii_rxd[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {enet0_gmii_rxd[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports ENET0_GMII_RX_DV_0]
set_property IOSTANDARD LVCMOS33 [get_ports {ENET0_GMII_TX_EN_0[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports MDIO_ETHERNET_0_0_mdio_io]
set_property IOSTANDARD LVCMOS33 [get_ports MDIO_ETHERNET_0_0_mdc]
set_property IOSTANDARD LVCMOS33 [get_ports ENET0_GMII_RX_CLK_0]
set_property IOSTANDARD LVCMOS33 [get_ports ENET0_GMII_TX_CLK_0]

set_property PACKAGE_PIN K17 [get_ports ENET0_GMII_RX_CLK_0]
set_property PACKAGE_PIN L14 [get_ports ENET0_GMII_TX_CLK_0]
set_property PACKAGE_PIN K18 [get_ports ENET0_GMII_RX_DV_0]
set_property PACKAGE_PIN J14 [get_ports {enet0_gmii_rxd[0]}]
set_property PACKAGE_PIN K14 [get_ports {enet0_gmii_rxd[1]}]
set_property PACKAGE_PIN M18 [get_ports {enet0_gmii_rxd[2]}]
set_property PACKAGE_PIN M17 [get_ports {enet0_gmii_rxd[3]}]
set_property PACKAGE_PIN N16 [get_ports {ENET0_GMII_TX_EN_0[0]}]
set_property PACKAGE_PIN M14 [get_ports {enet0_gmii_txd[0]}]
set_property PACKAGE_PIN L15 [get_ports {enet0_gmii_txd[1]}]
set_property PACKAGE_PIN M15 [get_ports {enet0_gmii_txd[2]}]
set_property PACKAGE_PIN N15 [get_ports {enet0_gmii_txd[3]}]
set_property PACKAGE_PIN J15 [get_ports MDIO_ETHERNET_0_0_mdio_io]
set_property PACKAGE_PIN G14 [get_ports MDIO_ETHERNET_0_0_mdc]

set_property IOSTANDARD LVCMOS33 [get_ports FCLK_RESET0_N_0]
set_property PACKAGE_PIN H20 [get_ports FCLK_RESET0_N_0]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets ENET0_GMII_TX_CLK_0_IBUF]
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets ENET0_GMII_RX_CLK_0_IBUF]

set_property SLEW FAST [get_ports {enet0_gmii_txd[3]}]
set_property SLEW FAST [get_ports {enet0_gmii_txd[2]}]
set_property SLEW FAST [get_ports {enet0_gmii_txd[1]}]
set_property SLEW FAST [get_ports {enet0_gmii_txd[0]}]
set_property SLEW FAST [get_ports {ENET0_GMII_TX_EN_0[0]}]
set_property SLEW FAST [get_ports {MDIO_ETHERNET_0_0_mdio_io}]
set_property SLEW FAST [get_ports {MDIO_ETHERNET_0_0_mdc}]

#set_property SEVERITY {Warning} [get_drc_checks NSTD-1]
#set_property SEVERITY {Warning} [get_drc_checks RTSTAT-1]
#set_property SEVERITY {Warning} [get_drc_checks UCIO-1]