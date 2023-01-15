org 7C00h

 start:
    cli              ;Disable interrupts (so that nothing distracts)
    xor ax, ax       ;Zero register ax
    mov ds, ax       ;Set dataSegment to zero address
    mov es, ax       ;Setting the es segment to address zero
    mov ss, ax       ;Set StackSegment to zero address
    mov sp, 07C00h   ;Point to the current top of the stack
    sti              ;Disable interrupts

  ;Cleaning screen
  mov ax, 3
  int 10h

  mov ah, 2h
  mov dh, 0 ; moving cursor
  mov dl, 0
  xor bh, bh
  int 10h

  ;Printing text 1
  mov ax, 1301h
  mov bp, message1
  mov cx, 11 ; length of the string
  mov bl, 02h ; color. 02 - green, 05 - purple
  int 10h

  ;Printing text 2
  mov dh, 1 ; moving cursor to line 1
  mov ax, 1301h
  mov bp, message2 ; name
  mov cx, 14 ; length of the string
  mov bl, 0Fh ; color
  int 10h

  ;Printing text 3
  mov dh, 2 ; moving cursor to line 2
  mov ax, 1301h
  mov bp, message3 ; name
  mov cx, 35 ; length of the string
  mov bl, 04h ; color
  int 10h

  ;Printing text 4 (root)
  mov dh, 3 ; moving cursor to line 3
  mov ax, 1301h
  mov bp, message4 ; name
  mov cx, 12 ; length of the string
  mov bl, 0Fh ; color
  int 10h

  readInput: ; reading input and writing it to console
    xor ax, ax
    int 16h
    mov ah, 0x0E
    int 10h

  jmp readInput
  jmp $

message1 db 'Hello Party',0
message2 db 'ObedOS loaded!',0
message3 db ' - github.com/KitenokGene/ObedOS - ',0
message4 db 'root@obed $ ',0

times 510 - ($ - $$) db 0 ;Filling the remaining bytes with zeros up to the 510th byte
db 0x55, 0xAA ;Boot Signature

; text colors are: 0 - black, 1 - blue, 2 - green, 3 - yellow, 4 - red, 5 - purple, 6 - brown, 7 - light gray, 8 - dark gray, 9 - light blue, A - light green, B - light yellow, C - light red, D - light purple, E - light brown, F - White