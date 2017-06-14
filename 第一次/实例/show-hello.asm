###################################################################
#
#  显示字符串 hello world，及数据存储结构
#
###################################################################
.text                    # 代码段 声明
.globl main              # globl指明程序的入口地址 main
main:                    # 入口地址 main
  la $a0, str                   # 取字符串地址 
  li $v0, 4                     # 4号 功能调用，输出字符串 
  syscall                       #系统调用

  li $v0, 10                    # 退出
  syscall                       # 系统调用

.data                           # 数据段 声明
  str:                          # 变量名称
       .asciiz "hello world\n"  # 字符串定义，.asciiz类型定义字符串，最后以0结尾的字符串 
  memory:                       # 变量名称
       .word 0xabcde080         # 字类型数据，32位
