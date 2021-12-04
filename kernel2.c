void test() {
    char *VID_MEM = (char *)0xa0000;
    short x = 0;
    short y = 0;
    short colour = 0x08;
    for (int i = 0; i < 5; i++) {
        x++;
        y++;
        // if (x < 0 || x >= 200 || y < 0 || y >= 320)
        //     __asm__("hlt");
        VID_MEM[(y * 320) + x] = colour;
    }

    for (int i = 0; i < 5; i++) {
        __asm__("mov $0x00, %ah");
        __asm__("int $0x16");
        char scancode;
        __asm__("movb %%ah, %0" : "=r"(scancode));
        VID_MEM[10 * 320 + 10] = scancode;
    }
}

int main() {
    test();

    while (1);
}

