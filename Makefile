assembly:
	nasm boot3.asm -fbin -o boot.bin
	nasm kernelv1.asm -fbin -o kernel.bin
	python dodgy.py

real:
	nasm boot3.asm -fbin -o boot.bin
	/mnt/c/users/olive/Desktop/coding/os2/osb/opt/cross/bin/i686-elf-gcc -ffreestanding -nostdlib -lgcc -c -m16 kernel2.c -o kernel.o
	python3 disassemblyToOpcodes.py
	python dodgy2.py