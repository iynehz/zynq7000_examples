# MicroPhase Z7-Lite Ethernet Experiment

The board I am using is MicroPhase Z7-Lite board, which is among the cheapest
Zynq 7000 boards available on the Chinese market. It comes with some hidden
cost though, as it took me some effects to get its Ethernet work.
What's unusual with this board is that it has only a PL-side Realtek RTL8201
PHY, instead of a PS-side PHY which is more commonly seen on other Zynq boards.
And this 10/1000Base-T RTL8201 phy is kind of rare as of year 2024. And of
course the board does not have bsp, so user need to define the PHY in dts file.

There are generally 2 ways to access the PL-side PHY from PS side: one is to
via EMIO route the GMII interface to the PL-side PHY, the other is to use an
Ethernet IP on the PL side and access it via AXI. MicroPhase's official docs
and examples include an AXI based example. They surely got it work on
Vivado 2018.3. But that's old Vivado version. I have only Vivado 2024.1, which
is latest as of year 2024. And in the beginning I tried their example. It
has only the Vivado project source, and not the PetaLinux part likely because
PetaLinux uses some absolute paths and people generally believe a PetaLinux
project is not relocatable (although it's actually relocatable with some hacks).
And I just could not get it work on my Vivado 2024.1.

It turns out that u-boot and linux does not well support RTL8201 or more
generally this kind of very old 10/100Base-T PHY today. I am not sure but I guess
they did support it years back but somehow broke it as it's rarely used today.

So I turned to the EMIO approach. At the beginning ethernet does not work
neither in u-boot or in Linux. In u-boot it recognized the PHY, but dhcp, ping,
etc. simply did not work, with an error message looked like
`failed to set tx clock rate: 25000000`. In Linux it simply did not recognize
the PHY (`Could not attach PHY (-19)`), and thus could not create Linux device
for the PHY.

I searched Internet but did not find much helpful, and I had to dig into the
source of u-boot and linux.

The problem with u-boot is that, it failed to set the tx clock. Actually I don't
understand why that has to be done, as unlike 1000Base-T under 100Base-T ideally
can get the tx clock from the PHY which is external to MAC. My patch is to
force setting the tx clock. See the patch under directory
`petalinux/project-spec/meta-user/recipes-bsp/u-boot/files`

The Linux problem seemed to be that, the board's example dts is kind of old
style, and Linux when it sees the "compatible" string in the dts file it
checks against a hardcoded whitelist to decide if that's a PHY depending on
the string, which in my case looks like,

```
compatible = "realtek,rtl8201","ethernet-phy-id001c.c816";
```

So I had to whitelist that "realtek,rtl8201" to let Linux know that's a PHY.
See the patch under directory
`petalinux/project-spec/meta-user/recipes-kernel/linux/linux-xlnx`.

With my understanding today's Linux does not really need that compatible string,
and without that string it should be able to work like by reading the Ethernet
PHY ID from the PHY device. I haven't tried this though as I guess having not
the compatible string could break u-boot.

