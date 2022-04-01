.data
start:  .asciiz "\n Input N = "
last:  .asciiz "\n The result is "
out1:  .asciiz "\n N is not legal\n"
out2:  .asciiz "\n overflow\n"
empty:  .asciiz "  "
Hex:    .asciiz " 0Xxxxxxxxx\n"
buf:  .word 1,1
      .space 4096              #设定数组大小
      .text
main:   la $a0,start
        li $v0,4
        syscall               #输出start
        la $a0,buf
        move $a1,$a0   #$a1是地址  ==$s2
        li $v0,5
        syscall            #输入N
        addi $v0,$v0,-1
        move $a0,$v0        #$a0是计数器N   ==$s3
        bltz $a0,out_1
         move $t5,$a1
         move $t6,$a0
         li $s1,1
         jal FIB        #按要求存储数据
         addi $a3,$a0,0
         li  $a2,0
         la $a0,start
        li $v0,4
         syscall
         jal print         #按要求打印数据
         li $v0,10         #退出
         syscall          
FIB:    ble $t6,$s1,ret       #$t6<=1就返回
        addi $a2,$t5,4
        lw $t1,($t5)
        lw $t2,($a2)
        addu $a3,$t1,$t2  
        addi $t4,$0,-1        #f3=f1+f2
        subu $t3,$t4,$t1
        bltu $t3,$t2,out_2    #判断溢出
        sw $a3,4($a2)
        addi $t5,$t5,4
        addi $t6,$t6,-1
        b FIB
print:  bgt $a2,$a3,ret
        move $a0,$a2
        li $v0,1
        syscall     #打印下标
        la $a0,empty
        li $v0,4
        syscall     #空格
        lw $a0,($a1)
        li $v0,1
        syscall      #打印十进制数值
        la $a0,empty
        li $v0,4
        syscall    #空格
        lw $a0,($a1)
        addi $sp,$sp,-16
        sw $ra,12($sp)
        sw $a0,8($sp)
        sw $a2,4($sp) 
        sw $a1,($sp)      #用堆栈存储来保护寄存器中的值
        jal hex            #调用hex函数转换成十六进制
        lw $ra,12($sp)
        lw $a0,8($sp)
        lw $a2,4($sp)
        lw $a1,($sp)            #恢复相应寄存器的值
        addi $sp,$sp,16
        la $a0,Hex
        li $v0,4
        syscall                #输出转换好的的十六进制字符串
        addi $a1,$a1,4
        addi $a2,$a2,1
        b print      
hex:   la $a0, Hex	
       lw   $a1,8($sp)
      	li $a2, 7	    		#循环次数
     	addi $t1, $a0, 10   	 #从位置buf+10处开始存放16进制数
loop:	andi $t0, $a1, 0x0f   	#取a1的低4位
	srl $a1, $a1, 4    	#a1右移4位
	bge $t0, 10, char 	#t0大于等于10跳转到为A-F处理
	addi $t0, $t0, 0x30	#0的ASCII码为0x30，在原先基础上加0x30
      	b put
char:	addi $t0, $t0, 0x37   	#A的ASCII码为65，在原先基础上加(65-10)
put:	sb $t0, ($t1)     	#放置字符
	addi $t1, $t1, -1   	#放置位置前移一个字符
	addi $a2, $a2, -1   	#将循环次数减1
	bgez $a2, loop		#判断循环是否结束
       jr $ra
out_1:  la $a0,out1        #N非法
        li $v0,4
        syscall
        b out
out_2:  la  $a0,out2       #数值出现溢出
        li $v0,4
        syscall
        b out
ret:    jr $ra            #返回地址

out: li $v0,10             #退出
     syscall  

