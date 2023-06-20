/**
 * 内核初始化以及测试代码
 *
 */
#include "comm/boot_info.h"
#include "comm/cpu_instr.h"
#include "cpu/cpu.h"
#include "cpu/irq.h"
#include "dev/time.h"
#include "os_cfg.h"

static boot_info_t * init_boot_info;        // 启动信息

/* 入口 */

void kernel_init (boot_info_t * boot_info) {
    init_boot_info = boot_info;

    // 初始化CPU，再重新加载
    cpu_init();  // 内存访问初始化(GDT表)
    irq_init();  // 中断初始化(idt表)
    time_init();
}

void init_main(void) {
    //int a = 3 / 0;
    // irq_enable_global();
    for (;;) {}
}
