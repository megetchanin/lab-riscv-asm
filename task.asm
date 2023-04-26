.data
N:
.word 4
M:
.word 6
matrix:
.word 1, 2, 3, 4
.word 5, 6, 7, 8
.word -1, -3, 8, 3
.word 5, 1, 2, 1
.word -8, -9, 4, -10
.word 2, 3, 4, 5
result:
.word 0

.text

main:
la a2, N
la a3, M
la a4, matrix
la a5, result
call process
la a2, N
la a3, result
call print
call exit

print:
lw t1, 0(a2)

addi t2, x0, 0
print_cycle:
addi a0, x0, 1 # print_int ecall
lw a1, 0(a3)
ecall

addi a0, x0, 11 # print_char ecall
addi a1, x0, 32
ecall

addi t2, t2, 1
addi a3, a3, 4
# blt t2, t1, print_cycle
ret

exit:
addi a0, x0, 10
ecall

process:
lw t1, 0(a2) # N
lw t2, 0(a3) # M
lw t0, 0(a5) # min_value

addi t4, x0, 0 # column pointer

init:
addi t5, x0, 0 # result to save
addi t3, x0, 0 # column element number

cycle:
lw t6, 0(a4) # load value from array
addi a4, a4, 16 # increment array pointer
add t5, t5, t6 # count sum
addi t3, t3, 1
blt t3, t2, cycle

bgt t4, x0, comparing
addi t0, t5, 0
j incr_column

comparing:
blt t5, t0, store
j incr_column

store:
sw t4, 0(a5) # save result to resulting array
addi t0, t5, 0

incr_column:
addi t4, t4, 1

return_cycle:
addi a4, a4, -16
addi t3, t3, -1
bgt t3, x0, return_cycle

addi a4, a4, 4
blt t4, t1, init
ret