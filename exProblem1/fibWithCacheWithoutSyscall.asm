.text
main:
 li $a0,6
 la $s1,memolist
 jal fib
 
fib:
 addi $sp,$sp,-16
 sw $t4,12($sp)
 sw $t3,8($sp)
 sw $ra, 4($sp)
 sw $a0, 0($sp)
 
 

 beq $a0,0,zero
 
 beq $a0,1,one
 
 sll $t0,$a0,2
 add $t0,$s1,$t0
 addi $t1,$zero,1
 lw $s2,0($t0)   #memolist[n]
 
 ble $t1,$s2,nonzero
 j other
 


other:
 addi $a0,$a0,-1
 jal fib
 addi $t3,$v0,0  #计算f(n-1)
 
 addi $a0,$a0,-1
 jal fib
 addi $t4,$v0,0  #计算f(n-2)
 add $v0,$t3,$t4
 
 lw $a0,0($sp)
 lw $ra,4($sp)
 lw $t3,8($sp)
 lw $t4,12($sp)
 addi $sp,$sp,16
 

 
 jr $ra
zero:
 addi $v0,$zero,0
 addi $sp,$sp,16
 jr $ra
one:
 addi $v0,$zero,1
 addi $sp,$sp,16
 jr $ra
nonzero:
 addi $v0,$s2,0
 addi $sp,$sp,16
 jr $ra
.data
 memolist:
  .space  400