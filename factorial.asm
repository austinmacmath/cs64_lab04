# Factorial.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#

# Assembly (NON-RECURSIVE) version of:
#   int n, fn=1;
#   cout << "Enter the number:\n";
#   cin >> n;
#   for (int x = 2; x <= n; x++) {
#       fn = fn * x;
#   }
#   cout << "Factorial of " << x << " is:\n" << fn << "\n";
#
.data
	inputPrompt: .asciiz "Enter a number:\n"
	factorial: .asciiz "Factorial of "
	is: .asciiz " is:\n"

# Text Area (i.e. instructions)
.text
	main:
		# Prompt for input
		li $v0, 4
		la $a0, inputPrompt
		syscall

		# Load user input
		li $v0, 5
		syscall
		move $t0, $v0

		# Print factorial
		li $v0, 4
		la $a0, factorial
		syscall
		li $v0, 1
		move $a0, $t0
		syscall
		li $v0, 4
		la $a0, is
		syscall

		move $t1, $t0

		# check if input is 0
		bne $t1, $zero, myloop
		addi $t1, $t1, 1
		j exit


	myloop: 
		addi $t0, $t0, -1
		beq $t0, $zero, exit

		mult $t1, $t0
		mflo $t1
		j myloop


		

	exit:
		li $v0, 1
		move $a0, $t1
		syscall
		li $v0, 10
		syscall