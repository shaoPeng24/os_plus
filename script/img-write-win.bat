% count: 设置写入大小,默认将文件全部写入 %
% seek: 设置写入起始地址 %
% disk.vhd: 磁盘文件 %

set DISK1_NAME=disk1.vhd
@REM boot写入磁盘 0
dd if=boot.bin of=%DISK1_NAME% bs=512 conv=notrunc count=1
@REM loader写入磁盘 1-99
dd if=loader.bin of=%DISK1_NAME% bs=512 conv=notrunc seek=1
@REM kernel写入磁盘 100~
dd if=kernel.elf of=%DISK1_NAME% bs=512 conv=notrunc seek=100

@REM 填充磁盘 zero=512byte  ps:磁盘大小必须是512的整数倍。一个扇区512字节 
dd if=zero.vhd of=%DISK1_NAME% bs=512 conv=notrunc seek=2047