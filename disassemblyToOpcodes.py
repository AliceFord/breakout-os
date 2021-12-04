import subprocess
import binascii

objFile = "kernel.o"
outFile = "kernel.bin"

writeOutFile = open(outFile, "wb")

result = subprocess.run(['objdump', '-d', objFile], stdout=subprocess.PIPE)
for i, line in enumerate(result.stdout.decode('utf-8').split("\n")):
    if i > 6:
        if line.startswith(" "):
            for i in range(7):
                opcode = line[6+i*3:8+i*3]
                if opcode != "  " and opcode != "":
                    writeOutFile.write(binascii.unhexlify(opcode))

writeOutFile.close()
