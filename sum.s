.data 
  Entersize: .asciiz "Please enter number of elements: "
  EnterNumbers: .asciiz "Please enter the required numbers: "
  space: .asciiz "\n"
  result: .asciiz "Sum is "
  tinyspace: .asciiz " "
  arr: .word 5

.text

main:

#print enter the size of array message
la $a0, Entersize
li $v0, 4
syscall


#No. of elements
li $v0, 5
syscall
move $t0, $v0

#print empty line
la $a0, space
li $v0, 4
syscall

#print enter the numbers of array message
la $a0, EnterNumbers
li $v0, 4
syscall


#load address of array
la $s0, arr

#reading elments by Read subroutine
jal Read
 

#load address of array
la $s0, arr

jal disply

#print 2 empty lines
la $a0, space
li $v0, 4
syscall

la $a0, space
li $v0, 4
syscall

#print result of sum message
la $a0, result
li $v0, 4
syscall

#load address of array
la $s0, arr

jal sum

#################################

Read:

#counter
li $s1, 0

loopR: 
beq $s1, $t0, exit1

#input 1 element
li $v0, 5
syscall

sw $v0, 0($s0)

addi $s0, $s0, 4
addi $s1, $s1, 1

j loopR

exit1: jr $ra

#################################

disply:

#counter
li $s1, 0

loopD:
beq $s1, $t0, exit2

lw $a0, 0($s0)
li $v0, 1
syscall

la $a0, tinyspace
li $v0, 4
syscall

addi $s0, $s0, 4
addi $s1, $s1, 1

j loopD

exit2: jr $ra

#################################

sum:

#counter
li $s1, 0
#sum variable declaretion
li $s2, 0

loopS:
beq $s1, $t0, end

lw $t1, 0($s0)

add $s2, $s2, $t1

addi $s0, $s0, 4
addi $s1, $s1, 1

j loopS

end:
move $a0, $s2
li $v0, 1
syscall


li $v0, 10
syscall






