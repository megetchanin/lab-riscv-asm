

default: task.elf task.dump

task.elf : main.c
	riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 main.c -o task.elf

task.dump: task.elf
	riscv64-unknown-elf-objdump -D task.elf > task.dump

clean:
	rm -f task.elf
	rm -f task.dump
	
