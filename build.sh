#!/bin/bash

args="-j$(nproc --all) \
	O=out \
	ARCH=arm64 \
	CLANG_TRIPLE=aarch64-linux-gnu- \
	CROSS_COMPILE=/home/lllgts/clang13/bin/aarch64-linux-gnu- \
	CC=/home/lllgts/clang/clang-r450784e/bin/clang \
	CROSS_COMPILE_ARM32=/home/lllgts/clang13/bin/arm-linux-gnueabi- "
	make ${args} polaris_defconfig
	make ${args}

echo "桜 已经编译完成啦!"
echo "Sakura kernel has been compiled successfully! "
echo "                                              "

echo "呐，这次编译的桜内核版本号是多少呢~ ："
echo "Sakura's version is ? :"
read name
echo "                          "
echo "啊，我知道了，是$name对叭"
echo "ah,I know,it's '$name' ,right?"
echo "                            "

echo "打包内核ing "
echo "Packing the kernel..."

rm -rf anykernel3/Image.gz-dtb
cp out/arch/arm64/boot/Image.gz-dtb anykernel3
cd anykernel3
rm *.zip
zip -q -r Sakura-$name.zip *

echo "                          "
echo "打包完成啦！快刷入试试吧！"
echo "Packing done "

echo "                                  "
echo "内核刷入包在anykernel目录里面的说 "
echo "Packed zip has been placed in anykernel3/ "
echo "                                          "

echo "嗯...我看看...文件名是 Sakura-$name.zip "
echo "Let me see...the file name is Sakura-$name.zip "
echo "                                                "
