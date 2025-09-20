#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate
# 修改 mt7981b-cudy-tr3000-v1.dts 中的 reg 值
DTS_FILE="target/linux/mediatek/dts/mt7981b-cudy-tr3000-v1.dts"

if [ -f "$DTS_FILE" ]; then
  sed -i 's/reg = <0x5c0000 0x4000000>;/reg = <0x5c0000 0x7000000>;/' "$DTS_FILE"
  echo "Successfully modified $DTS_FILE"
else
  echo "$DTS_FILE not found!"
fi
