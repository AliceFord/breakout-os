assembly:
	nasm boot3.asm -fbin -o boot.bin
	nasm kernelv1.asm -fbin -o kernel.bin
	python dodgy.py

real:
	/mnt/c/users/olive/Desktop/coding/os2/osb/opt/cross/bin/i686-elf-gcc -fno-pic -ffreestanding -nostdlib -lgcc -c -m16 kernel2.c -o kernel.o
	python3 superdodgy.py
	nasm boot3.asm -fbin -o boot.bin
	python3 disassemblyToOpcodes.py
	python dodgy2.py