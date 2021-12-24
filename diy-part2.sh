#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

#### 修改主机名字，把YOU-R4A修改你喜欢的就行（不能纯数字或者使用中文）
#sed -i '/uci commit system/i\uci set system.@system[0].hostname='PandoraBox'' package/lean/default-settings/files/zzz-default-settings

#### 版本号里显示一个自己的名字（ababwnq build $(TZ=UTC-8 date "+%Y.%m.%d") @ 这些都是后增加的）
#sed -i "s/OpenWrt /PandoraBox /g" package/lean/default-settings/files/zzz-default-settings

#### 稳定版修改R21xxx+自己的名字
sed -i 's/R21.12.1/https://github.com/FMJYY23/X86-64/g' package/lean/default-settings/files/zzz-default-settings

#### 64位5.4内核切换5.10
sed -i 's/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=5.10/g' target/linux/x86/Makefile

rm -rf  package/lean/luci-theme-argon-18.06

git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon-18.06

sed -i 's/"Frp 内网穿透"/"超级服务器外网穿透"/g' package/lean/luci-app-frpc/po/zh-cn/frp.po

sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' package/lean/luci-app-turboacc/po/zh-cn/turboacc.po
