## 介绍
1. 一个小型的操作系统
2. 相关理论和基础知识都很成熟
3. 做了较长的嵌入式开发工作，在嵌入式软件开发中比较重要的就是系统+协议栈
4. 目的：一方面通过实践加深对操作系统的理解，另一方面提高编程能力。
## 记录
- 
- 23/6/20: 内存段式存储完成，添加了异常和中断的处理函数。（1588行）
  1. 段式存储：逻辑地址->线性地址的映射。
  2. 内核读取a地址处指令过程：先根据cs段寄存器和GDT表的信息，获取到代码段在物理内存的起始地址(b)和长度(len),最终地址为a+b。完成逻辑地址(a)->线性地址(a+b)的转换。
  3. idt表：记录中断和异常的入口函数地址
  4. 异常：异常发生后，根据异常号从idt表中读取中断函数地址然后跳转执行。
  5. 异常返回必须以“iret”指令结尾，这样造成中断处理函数需要用汇编写，从汇编中再跳到c程序中执行。stm32中不需要，原因：LR寄存器的问题，具体略...。

- 23/6/5：工程创建完成，boot->loader->kernel 的跳转流程。
- `git ls-files | xargs wc -l`：统计工程文本行数 
## 参考
- 李述铜开源的DIY Linux_x86_os