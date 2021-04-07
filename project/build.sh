ZYBO_BOARD=Zybo-Z7-10  # Zybo, Zybo-Z7-10, or Zybo-Z7-20

patch -u Petalinux-Zybo/$ZYBO_BOARD/project-spec/meta-user/recipes-bsp/device-tree/files/system-user.dtsi -i system-user.dtsi.patch
cp --verbose petalinux_config Petalinux-Zybo/$ZYBO_BOARD/project-spec/configs/config

cd Petalinux-Zybo/$ZYBO_BOARD/

petalinux-util --webtalk off
petalinux-build --verbose
petalinux-package --boot --force --fsbl images/linux/zynq_fsbl.elf --fpga images/linux/system_wrapper.bit --u-boot
