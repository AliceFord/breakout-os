int main() {
    short *src = (short *)0xa0000;
    for (short i = 0; i < 0xfff; i++) {
        src[i] = 0xbbbb;
    }
    while (1);
}