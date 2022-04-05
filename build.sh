#!/bin/bash

args="-j$(nproc --all) \
	O=out \
	ARCH=arm64 \
	CLANG_TRIPLE=aarch64-linux-gnu- \
	CROSS_COMPILE=/home/lllgts/clang13/bin/aarch64-linux-gnu- \
	CC=/home/lllgts/clang/clang-r445002/bin/clang \
	CROSS_COMPILE_ARM32=/home/lllgts/clang13/bin/arm-linux-gnueabi- "
	make ${args} polaris_defconfig
	make ${args}

echo "桜 已经编译完成啦!"
echo "Sakura kernel has been compiled successfully! "

echo "打包内核ing "

echo "Packing the kernel..."

rm -rf anykernel3/Image.gz-dtb
cp out/arch/arm64/boot/Image.gz-dtb anykernel3
cd anykernel3
rm -rf Sakura-kernel.zip
zip -q -r Sakura-kernel.zip *

echo "打包完成啦！快刷入试试吧！"

echo "Packing done "

echo "内核刷入包在anykernel目录里面的说 "

echo "Packed zip has been placed in anykernel3/ "


echo "嗯...我看看...文件名是 Sakura-kernel.zip "

echo "Let me see...the file name is Sakura-kernel.zip "
