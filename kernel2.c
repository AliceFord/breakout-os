/** Screen **/

// void drawBoxes() {
//     char *VID_MEM = (char *)0xa0000;
//     for (short row = 0; row < 14; row++) {
//         for (short col = 0; col < 8; col++) {
//             for (short i = 0; i < 20; i++) {
//                 for (short j = 0; j < 5; j++) {
//                     VID_MEM[(col * 320 * 8 + row * 20) + j * 320 + i + row + 12 + 5 * 320] = 0xaa;
//                 }
//             }
//         }
//     }
//     return;
// }

// void drawPaddle() {
//     char *VID_MEM = (char *)0xa0000;
//     for (short i = 0; i < 20; i++) {
//         for (short j = 0; j < 2; j++) {
//             VID_MEM[i + j * 320 + 165 * 320 + 150] = 0xaa;
//         }
//     }
// }

// void setPixel() {
//     char colour = 0x00;
//     __asm__("movb %0, %%dh" : : "r"(colour));
//     short x = 0;
//     char *VID_MEM = (char *)0xa0000;
//     short y = 0;
//     for (int i = 0; i < 5; i++) {
//         x++;
//         y++;
//         if (x < 0 || x >= 200 || y < 0 || y >= 320)
//             __asm__("hlt");
//         VID_MEM[(y * 320) + x] = colour;
//     }
// }

/** Keyboard **/

// char getKeyboardInput() {
//     char scancode;
//     __asm__("mov $0x00, %ah");
//     __asm__("int $0x16");
//     __asm__("movb %%ah, %0" : "=r"(scancode));
//     return scancode;
// }

/** Main **/

int main() {
    char *VID_MEM = (char *)0xa0000;
    for (short row = 0; row < 14; row++) {
        for (short col = 0; col < 8; col++) {
            for (short i = 0; i < 20; i++) {
                for (short j = 0; j < 5; j++) {
                    VID_MEM[(col * 320 * 8 + row * 20) + j * 320 + i + row + 12 + 5 * 320] = 0xaa;
                }
            }
        }
    }

    for (short i = 0; i < 20; i++) {
        for (short j = 0; j < 2; j++) {
            VID_MEM[i + j * 320 + 165 * 320 + 150] = 0xaa;
        }
    }

    for (short i = 0; i < 4; i++) {
        for (short j = 0; j < 4; j++) {
            VID_MEM[i + j * 320 + 150 * 320 + 150] = 0xaa;
        }
    }
    
    short ball_x = 150;
    short ball_y = 150;

    short prev_ball_x = 150;
    short prev_ball_y = 150;

    while (1) { // Game loop
        for (int i = 0; i < 170000; i++) {
            __asm__("outb %%al, $0x0" : : "a"(0x80));
        }

        for (short i = 0; i < 4; i++) {
            for (short j = 0; j < 4; j++) {
                VID_MEM[i + j * 320 + prev_ball_y * 320 + prev_ball_x] = 0x00;
                VID_MEM[i + j * 320 + ball_y * 320 + ball_x] = 0xaa;
            }
        }
        prev_ball_y = ball_y;
        ball_y--;
    }

    

    while (1);
}

