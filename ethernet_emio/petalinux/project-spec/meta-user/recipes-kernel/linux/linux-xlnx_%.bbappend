FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " file://bsp.cfg"
KERNEL_FEATURES:append = " bsp.cfg"
SRC_URI += "file://user_2024-08-28-19-10-00.cfg \
            file://0001-add-realtek-rtl8201-to-mdio-compatible-whitelist.patch \
            "

