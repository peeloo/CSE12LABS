Main:
	li a0, 3
	jal ra, odd_sum
	j end
odd_sum:
	li a1, 1
	li a2, 0
loop:
	add a2, a2, a1
	addi, a1, a1, 2
	addi a0, a0, -1
	bnez a0, loop
	mv a0, a2
	jalr zero, 0(ra)
end:

