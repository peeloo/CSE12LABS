maxIncome:
#finds the total income from the file
#arguments:a0 contains the file record pointer array location (0x10040000 in our example) But your code MUST handle any address value
#a1:the number of records in the file
#return value a0:the total income (add up all the record incomes)
    #if empty file, return 0 for both a0, a1
    bnez a1, maxIncome_fileNotEmpty # maxIncome function
    li a0, 0
    ret
 maxIncome_fileNotEmpty:
    addi t0, a0, 4 #new value address
    li t1, 0 # counter
    li t2, 0 # max
    addi t3, a0, 0 # max address
    li t4, 0 # the counter * 4
    li t5, 8 # immediate 8
    addi t6, a0, 0 #base address
    #if no student code entered, a0 just returns 0x10040010 always ?
    maxCheck:
        mv a0, t0
        beq t1, a1, foundMax
    maxLoop:
        addi sp, sp, -32
        sw ra, 0(sp)
        sw a1, 4(sp)
        sw t0, 8(sp)
        sw t1, 12(sp)
        sw t3, 16(sp)
        sw t4, 20(sp)
        sw t5, 24(sp)
        sw t6, 28(sp)
        jal income_from_record
        lw t6, 28(sp)
        lw t5, 24(sp)
        lw t4, 20(sp)
        lw t3, 16(sp)
        lw t1, 12(sp)
        lw t0, 8(sp)
        lw a1, 4(sp)
        lw ra, 0(sp)
        addi sp, sp, 32
        bnez  t1, setMax #skip if not first iter
        addi t2, a0, 0 #if counter is 0, then make the max the first value we get
        setMax:
            blt a0, t2, maxUpdate 
            mv t2, a0 #make the bigger value the max
            add t3, t6, t4 #max address = counter * 4 + base address
    maxUpdate:
        addi t1, t1, 1
        mul t4, t1, t5 #register address relative to base (counter * 8)
        addi t0, t0, 8 #move up t0 by 2 register addresses
        j maxCheck
    foundMax:
        mv a0, t3
    ret
#######################end of maxIncome###############################################
