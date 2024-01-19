	li s1, 0x000100000

        li s0, 0xABCDEFBA
        sw s0, 0(s1)
        lb   s0, 2(s1)