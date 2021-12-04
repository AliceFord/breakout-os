import subprocess
import binascii

objFile = "kernel.o"
outFile = "kernel.bin"

result = subprocess.run(['objdump', '-d', objFile], stdout=subprocess.PIPE)
for i, line in enumerate(result.stdout.decode('utf-8').split("\n")):
    if i > 6:
        if "<main>" in line:
            jmpAdd = line.split(" ")[0]
            print(jmpAdd)
            break

with open("boot3.asm", "w") as f:
    with open("boot3a.asm", "r") as infile:
        f.write("".join(infile.readlines()) + "\n")
        f.write("jmp $+2+0x" + jmpAdd + "\n")
        f.write("db 0x55" + "\n")
        f.write("db 0xAA" + "\n")
