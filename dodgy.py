bootloader = "boot.bin"
kernel = "kernelv1.bin"

with open(bootloader, "rb") as boot, open(kernel, "rb") as ker:
    boot_data = boot.read()
    ker_data = ker.read()

    with open("os.bin", "wb") as img:
        img.write(boot_data)
        #img.write(b"\x00" * 8)
        img.write(ker_data)
