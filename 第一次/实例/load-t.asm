#********************************************
#         将数据装入寄存器
#********************************************
.text                           # 代码段
.globl main                     # 程序从此开始

main:                           # 主程序

  lw $t0,memory                 # 从存储器中读取一个字的数据到寄存器中，整32位 WORD
  lh $t1,memory                 # 从存储器中读取半个字的数据到寄存器中，HALFWORD
  lb $t2,memory                 # 从存储器中读取一个字节的数据到寄存器中，字节符号扩展 BYTE
  lhu $t3,memory                # 半字（不带符号）装入 HALFWORD
  lbu $t4,memory                # 字节（不带符号）装入 BYTED

  lb  $s4,memory+1              #（取memory第二个单元数据）从存储器中读取一
                                # 个字节的数据到寄存器中，字节符号扩展 BYTE
  li $v0, 10                    # 退出
  syscall                       # 系统调用
  
.data                           # 数据段
  memory:                       # 变量名称
    .word 0xabcde080            # 数据定义-字（32位）
