/* 参考： https://ftp.gnu.org/old-gnu/Manuals/ld-2.9.1/html_chapter/ld_3.html */
SECTIONS
{
    . = 0x10000; /*大约64KB*/
	.text : {
		*(.text)
	} 

	.rodata : {
		*(.rodata)
	}

	.data : {
		*(.data)
	}
	.bss : {
		*(.bss)
	}
}
