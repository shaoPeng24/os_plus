set DISK1_NAME=disk1.vhd
% count: 设置写入大小,默认将文件全部写入 %
% seek: 设置写入起始地址 %

@REM boot写入磁盘
dd if=boot.bin of=%DISK1_NAME% bs=512 conv=notrunc count = 1
@REM loader写入磁盘
dd if=loader.bin of=%DISK1_NAME% bs=512 conv=notrunc seek=1
@REM kernel写入磁盘
dd if=kernel.elf of=%DISK1_NAME% bs=512 conv=notrunc seek=100
