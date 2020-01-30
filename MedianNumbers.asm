# MedianNumbers.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#

.data

	# TODO: Complete these declarations / initializations

	intro: .asciiz "Enter the next number:\n"

	median: .asciiz "Median: "

#Text Area (i.e. instructions)
.text

main:
	# 1st prompt
	li $v0, 4
	la $a0, intro
	syscall
	# User input -> $t1
	li $v0, 5
	syscall
	move $t1, $v0

	# 2nd prompt
	li $v0, 4
	la $a0, intro
	syscall
	# User intput -> $t2
	li $v0, 5
	syscall
	move $t2, $v0

	# 3rd prompt
	li $v0, 4
	la $a0, intro
	syscall
	# User input -> $t3
	li $v0, 5
	syscall
	move $t3, $v0

compare3:
	blt $t3, $t2, compare2 # branch if $t3 is less than $t2 or $t1
	blt $t3, $t1, compare2
	bge $t2, $t1, print2
	j print1

compare2:
	blt $t2, $t3, compare1
	blt $t2, $t1, compare1
	bge $t3, $t1, print3
	j print1

compare1:
	bge $t3, $t2, print3
	j print2

print1:
	li $v0, 4
	la $a0, median
	syscall
	li $v0, 1
	move $a0, $t1
	syscall
	j exit

print2:
	li $v0, 4
	la $a0, median
	syscall
	li $v0, 1
	move $a0, $t2
	syscall
	j exit

print3:
	li $v0, 4
	la $a0, median
	syscall
	li $v0, 1
	move $a0, $t3
	syscall
	j exit

exit:
	# TODO: Write code to properly exit a SPIM simulation
	li $v0, 10
	syscall
