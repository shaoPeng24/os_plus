/**
 * 实模式下
 * 内存：0x500 - 0x7FFFF 1024KB 可以访问 大约2000个磁盘扇区大小 7c00 - 7FFFF大约500kB大小。
 * boot：  加载到 0x7c00  大小：0.5KB
 * loader：加载到 0x8000  大小：64KB
 * kernel：加载到 0x10000 大小：400KB可用
 
 * 1. 检测内存容量，正常的话会有两块内存  0-0.6M    1M-128M
 * 2. 进入保护模式(32位代码)
 * 3. 把kernel.elf 从磁盘 读取到1M内存处  大小500个扇区(250KB) .elf文件 描述代码、数据在内存中的位置。
 * 4. 
 */


/*---------------------16位代码-------------------------------------------*/
  	.code16
 	.text
 	.extern loader_entry   //函数声明
	.global _start
_start:
	jmp loader_entry      //loader的首行代码   



/*---------------------32位代码-------------------------------------------*/
	.code32
	.text
	.global protect_mode_entry //供外部调用
	.extern load_kernel
protect_mode_entry:
	// 重新加载所有的数据段描述符
	mov $16, %ax		// 16为数据段选择子
	mov %ax, %ds
    mov %ax, %ss
    mov %ax, %es
    mov %ax, %fs
    mov %ax, %gs

    // 长跳转进入到32位内核加载模式中
    jmp $8, $load_kernel


