ENTRY(__start__);
OUTPUT(i386pe);

SECTIONS
{
    __kernelbase = 0x520;
    . = __kernelbase;

    .text : SUBALIGN(4) {
        *(.text.st);
        *(.text);
    }

    .data : 
        SUBALIGN(4) {
        __data_start = .;
        *(.rdata*);
        *(.data);
        __data_end = .;
        __bss_start = .;
        *(COMMON);
        *(.bss);
        __bss_end = .;
    }
}