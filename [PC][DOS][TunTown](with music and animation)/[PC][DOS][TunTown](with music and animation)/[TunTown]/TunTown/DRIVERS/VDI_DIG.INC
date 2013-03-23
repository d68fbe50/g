;лллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
;лл                                                                        лл
;лл  VDI_DIG.INC                                                           лл
;лл                                                                        лл
;лл  IBM Audio Interface Library Version 3.X                               лл
;лл                                                                        лл
;лл  Standard function library for Vendor Device Interface digital sound   лл
;лл  drivers                                                               лл
;лл                                                                        лл
;лл  Version 1.00 of 29-Mar-94: Initial version for AIL 3.0                лл
;лл          1.01 of 17-May-94: 16-bit DMA mask I/O address problem fixed  лл
;лл          1.02 of 20-Jul-94: DMA buffers now external to driver segment лл
;лл          1.12 of 21-Aug-94: Added C language specifier to MODEL        лл
;лл                             Added dev_name field to VDI_HDR            лл
;лл          1.13 of 20-Nov-94: Added DIG_DUAL_DMA option                  лл
;лл                                                                        лл
;лл  Author: John Miles                                                    лл
;лл                                                                        лл
;лл  8086 ASM source compatible with MASM or TASM                          лл
;лл                                                                        лл
;лллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
;лл                                                                        лл
;лл  Copyright (C) 1994-1995 Miles Design, Inc.                            лл
;лл                                                                        лл
;лл  Miles Design, Inc.                                                    лл
;лл  8301 Elander Drive                                                    лл
;лл  Austin, TX 78750                                                      лл
;лл                                                                        лл
;лл  (512) 345-2642 / FAX (512) 338-9630 / BBS (512) 454-9990              лл
;лл                                                                        лл
;лллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

                ;
                ;Preamble code for Microsoft/Borland assemblers
                ;

                IFDEF MASM

                OPTION SCOPED
                .MODEL TINY,C

                ELSE

                MODEL TINY,C
                LOCALS __   
                JUMPS       

                ENDIF

                ;
                ;Standard equates/definitions
                ;

FALSE           equ 0
TRUE            equ 1

DIG_SIGN        equ 00000001h
DIG_ORDER       equ 00000002h
DIG_POLARITY    equ 00000004h
DIG_SPLIT       equ 00000008h
DIG_BUFF_SERVE  equ 00000010h
DIG_DUAL_DMA    equ 00000020h
DIG_RECORD      equ 00008000h

IO_PARMS        STRUC
IP_IO_ADDR      dw ?
IP_IRQ          dw ?
IP_DMA_8        dw ?
IP_DMA_16       dw ?
IP_reserved     dd ?
                dd ?
                dd ?
                dd ?
IO_PARMS        ENDS

MODE            STRUC
min_phys_rate   dw ?
nom_phys_rate   dw ?
max_phys_rate   dw ?

min_half_size   dw ?
max_half_size   dw ?

mode_flags      dd ?
MODE            ENDS

                .CODE

;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
;лл                                                                         лл
;лл VDI Driver Header Table (VDI_HDR)                                       лл
;лл                                                                         лл
;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

                ;
                ;Driver identification string must appear as bytes 0-7 in
                ;driver image
                ;

                db 'AIL3DIG',26

                ;
                ;Driver version
                ;

driver_version  dd 0113h

                ;
                ;I/O configuration
                ;

common_configs  dw ?
                dw ?

num_configs     dw ?

env_name        dw ?
                dw ?

IO_ADDR         dw ?                            ;IO_PARMS structure for
IRQ             dw ?                            ;driver -- explicit variables
DMA_8           dw ?                            ;used for MASM/TASM 
DMA_16          dw ?                            ;addressing compatibility
IO_reserved     dd 4 dup (?)

                ;
                ;Service rate in Hz if > 0, else no service required
                ;

service_rate    dw ?

busy            dw ?

                ;
                ;Driver number for this driver must appear as bytes 10-11
                ;in driver image
                ;
                ;(Initialized at load time)
                ;

driver_num      dw ?

                ;
                ;Vector to INT 66H function dispatcher must appear as 
                ;bytes 8-9 in driver image
                ;

                dw OFFSET INT66H_dispatch

                ;
                ;Vector to previous INT 66H handler in chain must appear as
                ;bytes 12-15 in driver image
                ;
                ;(Initialized at load time)
                ;

previous_ISR    dd ?

                ;
                ;Scratch workspace for communication between API and 
                ;VDI layers
                ;

scratch         db 128 dup (?)

                ;
                ;Device ASCII name field (V1.12 and higher)
                ;

dev_name        db DEVICE_NAME,0
                db 80-($-OFFSET dev_name) dup (0)

;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
;лл                                                                         лл
;лл Miscellaneous data                                                      лл
;лл                                                                         лл
;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

                ;
                ;Common function list for 300H-306H inclusive
                ;

DRV_fn_list     dw OFFSET FN_300H
                dw OFFSET FN_301H
                dw OFFSET FN_302H
                dw OFFSET FN_303H
                dw OFFSET FN_304H
                dw OFFSET FN_305H
                dw OFFSET FN_306H
end_DRV_list    LABEL WORD

                ;
                ;.DIG function list for 400H-405H inclusive
                ;

DIG_fn_list     dw OFFSET FN_400H
                dw OFFSET FN_401H
                dw OFFSET FN_402H
                dw OFFSET FN_403H
                dw OFFSET FN_404H
                dw OFFSET FN_405H
end_DIG_list    LABEL WORD

caller_AX       dw ?                    ;Copies of input/output variables
caller_BX       dw ?
caller_CX       dw ?
caller_DX       dw ?
caller_SI       dw ?
caller_DI       dw ?

                ;
                ;DMA register I/O addresses for channels 0-7
                ;(except 4)
                ;

DMAC_page       db 087h,083h,081h,082h
                db   -1,08bh,089h,08ah

DMAC_addr       db 000h,002h,004h,006h
                db   -1,0c4h,0c8h,0cch

DMAC_cnt        db 001h,003h,005h,007h
                db   -1,0c6h,0cah,0ceh

DMAC_mask       db 00ah,00ah,00ah,00ah
                db   -1,0d4h,0d4h,0d4h

DMAC_mode       db 00bh,00bh,00bh,00bh
                db   -1,0d6h,0d6h,0d6h

DMAC_FF         db 00ch,00ch,00ch,00ch
                db   -1,0d8h,0d8h,0d8h

                ;
                ;DMAMODE_ variables needed by DMAC_ routines
                ;

DMAMODE_REC_OS  equ 44h                 ;One-shot DMA recording
DMAMODE_PLAY_OS equ 48h                 ;One-shot DMA playback
DMAMODE_REC_AI  equ 54h                 ;Auto-init DMA recording
DMAMODE_PLAY_AI equ 58h                 ;Auto-init DMA playback

DMA_channel     dw ?                    ;DMA channel in use (0-7)
DMA_mode        dw ?                    ;DMAMODE from equates above
DMA_buffer      dd ?                    ;DMA buffer address in seg:off format
DMA_cnt         dw ?                    ;DMA byte count-1 (0-65535 = 1-65536)

;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
;лл                                                                         лл
;лл  Function: INT66H_dispatch                                              лл
;лл                                                                         лл
;лл   Purpose: INT 66H function dispatcher for .DIG driver                  лл
;лл                                                                         лл
;лл Call with: Function-dependent registers                                 лл
;лл                                                                         лл
;лл   Returns: Function-dependent registers                                 лл
;лл                                                                         лл
;лл      Uses: All registers preserved (except returned values)             лл
;лл                                                                         лл
;лл     Notes: Called externally via INT 66H                                лл
;лл                                                                         лл
;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

INT66H_dispatch PROC

                cmp ax,300h             ;pass control to former INT 66H
                jb __pass               ;handler if not .DIG function 
                cmp ax,4ffh
                ja __pass

                cmp bx,cs:driver_num    ;pass control to former INT 66H
                jne __pass              ;handler if BX != driver_num

                cli                     ;disable interrupts by default

                cmp cs:busy,0           ;return immediately if re-entrant call
                jne __return            ;or end-of-DMA ISR active

                inc cs:busy             ;set semaphore to prevent reentry

                push bp
                push es
                push ds

                push cs                 ;access CS: data via DS: and ES:
                push cs
                pop ds
                pop es

                cld

                mov caller_AX,ax        ;save caller registers for access
                mov caller_BX,bx        ;and possible modification by
                mov caller_CX,cx        ;function handlers
                mov caller_DX,dx
                mov caller_SI,si
                mov caller_DI,di

                mov caller_AX,-1        ;assume function not supported

                mov si,OFFSET DRV_fn_list
                sub ax,300h
                cmp ax,((end_DRV_list - DRV_fn_list) / 2)
                jb __do_call

                mov si,OFFSET DIG_fn_list
                sub ax,100h
                cmp ax,((end_DIG_list - DIG_fn_list) / 2)
                jae __exit

__do_call:      mov bx,ax
                add bx,bx
                call WORD PTR [bx][si]

__exit:         mov ax,caller_AX        ;restore (possibly modified)
                mov bx,caller_BX        ;caller registers
                mov cx,caller_CX
                mov dx,caller_DX
                mov si,caller_SI
                mov di,caller_DI
                
                pop ds
                pop es
                pop bp
                
                dec cs:busy

__return:       iret

__pass:         cmp WORD PTR cs:[previous_ISR],0
                jne __call_prev
                cmp WORD PTR cs:[previous_ISR+2],0
                je __return
                
__call_prev:    jmp cs:[previous_ISR]   ;call previous ISR if not NULL

INT66H_dispatch ENDP

;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
;лл                                                                         лл
;лл  Function: DIG_init                                                     лл
;лл                                                                         лл
;лл   Purpose: Initializes common driver variables; performs far pointer    лл
;лл            fixups based on driver CS: value                             лл
;лл                                                                         лл
;лл Call with: Nothing                                                      лл
;лл                                                                         лл
;лл   Returns: Nothing                                                      лл
;лл                                                                         лл
;лл      Uses: All registers                                                лл
;лл                                                                         лл
;лл     Notes: Must be called prior to any other VDI functions              лл
;лл                                                                         лл
;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

DIG_init        PROC

                ;
                ;DST
                ;

                mov active_buffer,-1

                ;
                ;VDI_HDR
                ;

                mov common_configs+2,cs
                mov env_name+2,cs

                ret

DIG_init        ENDP

;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
;лл                                                                         лл
;лл  Function: DMAC_disable                                                 лл
;лл                                                                         лл
;лл   Purpose: Masks DMA channel, inhibiting DMA transfers                  лл
;лл                                                                         лл
;лл Call with: DMA_channel                                                  лл
;лл                                                                         лл
;лл   Returns: Nothing                                                      лл
;лл                                                                         лл
;лл      Uses: All registers                                                лл
;лл                                                                         лл
;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

DMAC_disable    PROC

                mov bx,DMA_channel      ;BX indexes DMAC register tables
                mov dh,0                ;DH = 0 for DMAC register port access

                mov ax,bx              
                and ax,11b
                or ax,100b              ;AX = (channel & 3) | "set mask bit"

                mov dl,DMAC_mask[bx]
                out dx,al
                
                ret

DMAC_disable    ENDP

;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
;лл                                                                         лл
;лл  Function: DMAC_enable                                                  лл
;лл                                                                         лл
;лл   Purpose: Unmasks DMA channel, enabling DMA transfers                  лл
;лл                                                                         лл
;лл Call with: DMA_channel                                                  лл
;лл                                                                         лл
;лл   Returns: Nothing                                                      лл
;лл                                                                         лл
;лл      Uses: All registers                                                лл
;лл                                                                         лл
;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

DMAC_enable     PROC

                mov bx,DMA_channel      ;BX indexes DMAC register tables
                mov dh,0                ;DH = 0 for DMAC register port access

                mov ax,bx              
                and ax,11b              ;AX = (channel & 3), "set mask bit"=0

                mov dl,DMAC_mask[bx]
                out dx,al
                
                ret

DMAC_enable     ENDP

;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
;лл                                                                         лл
;лл  Function: DMAC_program                                                 лл
;лл                                                                         лл
;лл   Purpose: Program DMA controller to perform transfer from lower 1MB    лл
;лл            based on previously selected mode and channel                лл
;лл                                                                         лл
;лл Call with: DMA_channel = DMA channel in use (0-7)                       лл
;лл            DMA_mode    = Selected DMAMODE type for transfer             лл
;лл            DMA_buffer  = DMA buffer address in segment:offset format    лл
;лл            DMA_cnt     = DMA byte count-1 (0-65535 = 1-65536 bytes)     лл
;лл                                                                         лл
;лл   Returns: Nothing                                                      лл
;лл                                                                         лл
;лл      Uses: All registers                                                лл
;лл                                                                         лл
;лл     Notes: DMA transfer may be enabled by subsequent call to            лл
;лл            DMAC_enable                                                  лл
;лл                                                                         лл
;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

DMAC_program    PROC

                pushf                   ;disable IRQs
                cli

                call DMAC_disable       ;mask DMA channel

                mov bx,DMA_channel      ;BX indexes DMAC register tables
                mov dh,0                ;DH = 0 for DMAC register port access

                mov al,0                ;generate IOW to clear FF toggle state
                mov dl,DMAC_FF[bx]
                out dx,al

                mov ax,WORD PTR DMA_buffer+2
                mov cx,0
                REPT 4
                shl ax,1                ;set DMA page and address based on
                rcl cx,1                ;segment:offset pointer to buffer
                ENDM
                add ax,WORD PTR DMA_buffer
                adc cx,0                ;AX = addr, CX = page

                mov si,DMA_cnt          ;SI = # of bytes to transfer - 1

                cmp bx,4                
                jb __write_DMAC         ;16-bit channel?

                shr cx,1                ;yes, convert address, page, and len
                rcr ax,1                ;to 16-bit, 128K/page format
                shl cx,1

                add si,1                ;get # of bytes to transfer (w/carry)
                rcr si,1                ;divide to obtain 16-bit word count
                dec si                  ;subtract 1 for zero-based DMA count

__write_DMAC:   mov dl,DMAC_addr[bx]    ;set DMA address word (bits 0-15)
                out dx,al
                mov al,ah
                out dx,al

                mov ax,si               ;set DMA transfer count
                mov dl,DMAC_cnt[bx]         
                out dx,al
                mov al,ah
                out dx,al
                
                mov al,cl               ;set DMA page byte (bits 16-23)
                mov dl,DMAC_page[bx]    
                out dx,al

                mov ax,bx
                and ax,11b
                or ax,DMA_mode          ;AX = (channel & 3) | mode
                mov dl,DMAC_mode[bx]
                out dx,al
                
                popf                    ;restore IRQ state
                ret

DMAC_program    ENDP

;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
;лл                                                                         лл
;лл  Function: ASC_val                                                      лл
;лл                                                                         лл
;лл   Purpose: Returns value of positive integer represented as ASCII       лл
;лл            string terminated with 0 or space                            лл
;лл                                                                         лл
;лл Call with: AX = Number base (2-16)                                      лл
;лл            BX = Offset of string in scratch[] array                     лл
;лл                                                                         лл
;лл   Returns: AX = Value of number, or -1 if invalid input                 лл
;лл            BX = Offset of first character after end of string           лл
;лл                                                                         лл
;лл      Uses: All registers                                                лл
;лл                                                                         лл
;лл     Notes: Used by function 303H (Parse Environment Variable)           лл
;лл            Skips leading whitespace                                     лл
;лл                                                                         лл
;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

ASC_val         PROC
                LOCAL base

                mov base,ax

                dec bx                  ;skip leading whitespace
__skip_l_ws:    inc bx
                mov cl,scratch[bx]
                cmp cl,' '
                je __skip_l_ws
                cmp cl,0                ;string is blank, exit w/failure
                je __bad

                mov ax,0                ;AX = accumulated value
                mov cx,0                ;CL = character input

__fetch:        mov cl,scratch[bx]      ;fetch character from string
                cmp cl,0                ;exit if end of string
                je __exit
                cmp cl,' '
                je __exit
                
                cmp cl,'0'              ;test for digits 0-9
                jl __bad
                cmp cl,'9'
                jle __num

                cmp cl,'a'              ;convert to uppercase and test for
                jb __uc                 ;characters A-F
                sub cl,'a'-'A'
__uc:           cmp cl,'F'
                jg __bad
                cmp cl,'A'
                jl __bad                ;reject if not in [0-9,A-F]

                sub cl,'A'              ;translate 'A'-'F' to 10-15
                add cl,10
                jmp __calc

__num:          sub cl,'0'              ;translate '0'-'9' to 0-9

__calc:         mul base                ;shift accumulator left...
                add ax,cx               ;...and add new digit
                inc bx
                jmp __fetch             ;fetch next digit

__bad:          mov ax,-1
__exit:         ret

ASC_val         ENDP


;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
;лл                                                                         лл
;лл  Function: VBL_sync_wait                                                лл
;лл                                                                         лл
;лл   Purpose: System- and CPU-independent delay                            лл
;лл            Waits for leading edge of vertical blanking signal           лл
;лл                                                                         лл
;лл Call with: AX = Number of vertical refresh periods to delay             лл
;лл                                                                         лл
;лл                 0: No delay                                             лл
;лл                 1: 0-20 millisecond delay                               лл
;лл                 2: 10-40 millisecond delay                              лл
;лл                 3: 20-60 millisecond delay ...                          лл
;лл                                                                         лл
;лл            Delay times are best/worst cases, and depend on CRT scan     лл
;лл            frequency and beam position at time of call                  лл
;лл                                                                         лл
;лл   Returns: Nothing                                                      лл
;лл                                                                         лл
;лл      Uses: All registers preserved                                      лл
;лл                                                                         лл
;лл     Notes: Suitable for use on systems equipped with CGA/EGA/VGA/XGA    лл
;лл            and compatible video hardware                                лл
;лл                                                                         лл
;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

VBL_sync_wait   PROC

                push cx
                push ax
                push dx
                push ds

                mov cx,ax
                jcxz __exit

                mov ax,40h              ;wait n VBL periods (14 ms/period min, 
                mov ds,ax               ;requires CGA/EGA/VGA/XGA video)

                mov dx,ds:[63h]         ;get CRTC Address register location
                add dl,6                ;get CRTC Status register location

__sync_1:       in al,dx                ;if in blanking interval, wait for
                test al,8               ;start of refresh
                jz __sync_1             

__sync_2:       in al,dx                ;if in refresh, wait for start of
                test al,8               ;blanking interval
                jnz __sync_2

                loop __sync_1

__exit:         pop ds
                pop dx
                pop ax
                pop cx

                ret
VBL_sync_wait   ENDP

;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
;лл                                                                         лл
;лл  Function: IRQ_hook                                                     лл
;лл                                                                         лл
;лл   Purpose: Enables IRQs on desired channel and installs ISR             лл
;лл                                                                         лл
;лл Call with: AX = IRQ channel 0-15                                        лл
;лл            DX = offset of ISR in driver code segment                    лл
;лл                                                                         лл
;лл   Returns: DX:BX = previous ISR address                                 лл
;лл            CX    = previous contents of PIC mask registers              лл
;лл                                                                         лл
;лл      Uses: All registers                                                лл
;лл                                                                         лл
;лл     Notes: This function returns all data necessary to completely       лл
;лл            restore the status and ISR address of the selected IRQ       лл
;лл            channel.  These values should be preserved and passed to     лл
;лл            IRQ_unhook prior to driver termination.                      лл
;лл                                                                         лл
;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

IRQ_hook        PROC
                LOCAL channel
                LOCAL old_ISR_s,old_ISR_o

                pushf                   ;make sure IRQs are disabled when
                cli                     ;modifying IDT

                mov channel,ax

                mov bx,ax               ;index interrupt vector for IRQ
                cmp bx,8
                jb __calc_vect
                add bx,60h              ;index slave PIC vectors if IRQ > 7
__calc_vect:    add bx,8
                shl bx,1
                shl bx,1

                push es
                mov ax,0                ;DS:BX -> real-mode IDT entry
                mov es,ax
                mov ax,es:[bx]          ;get address of former ISR
                mov cx,es:[bx+2]
                mov old_ISR_o,ax
                mov old_ISR_s,cx
                mov es:[bx],dx          ;set up new ISR
                mov es:[bx+2],cs
                pop es

                mov cx,channel          ;get PIC mask value for selected IRQ
                mov bx,1
                shl bx,cl

                cmp channel,8           ;if IRQ >= 8, make sure IRQ 2 cascade
                jb __build_mask         ;is enabled
                or bx,100b              
__build_mask:   not bx                  ;(0 in IRQ mask position, others 1)

                in al,0a1h              ;enable hardware interrupts from DSP,
                mov ch,al               ;saving previous PIC mask values in CL
                and al,bh               ;(PIC 0) and CH (PIC 1)
                out 0a1h,al

                in al,21h
                mov cl,al
                and al,bl
                out 21h,al

                mov dx,old_ISR_s        ;return previous ISR address in DX:BX
                mov bx,old_ISR_o

                popf                    ;restore IRQ status
                ret

IRQ_hook        ENDP

;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
;лл                                                                         лл
;лл  Function: IRQ_unhook                                                   лл
;лл                                                                         лл
;лл   Purpose: Restores IRQ channel status                                  лл
;лл                                                                         лл
;лл Call with: AX    = IRQ channel 0-15                                     лл
;лл            DX:BX = address of previous ISR as returned from IRQ_hook    лл
;лл            CX    = previous status of PIC mask registers                лл
;лл                                                                         лл
;лл   Returns: Nothing                                                      лл
;лл                                                                         лл
;лл      Uses: All registers                                                лл
;лл                                                                         лл
;лл     Notes: The status bit and ISR for the given IRQ are restored        лл
;лл            based on the input variable values.  No other PIC status     лл
;лл            bits are altered.                                            лл
;лл                                                                         лл
;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

IRQ_unhook      PROC
                LOCAL channel,PICmask

                pushf                   ;make sure IRQs are disabled when
                cli                     ;modifying IDT
                            
                mov channel,ax
                mov PICmask,cx

                mov si,ax               ;index interrupt vector for IRQ
                cmp si,8
                jb __calc_vect
                add si,60h              ;index slave PIC vectors if IRQ > 7
__calc_vect:    add si,8
                shl si,1
                shl si,1

                push es
                mov ax,0                ;DS:BX -> real-mode IDT entry
                mov es,ax
                mov es:[si],bx          ;restore former ISR
                mov es:[si+2],dx
                pop es

                mov cx,channel          ;BX = PIC mask value for selected IRQ
                mov bx,1
                shl bx,cl               ;(1 in IRQ mask position, others 0)

                cmp channel,8           ;if IRQ >= 8, make sure IRQ 2 cascade
                jb __isolate_bit        ;is restored
                or bx,100b              

__isolate_bit:  mov cx,PICmask          
                and cx,bx               ;CX = isolated bit from old PIC

                not bx                  ;turn BX into AND mask to isolate bit
                
                in al,0a1h
                and al,bh
                or al,ch
                out 0a1h,al

                in al,21h
                and al,bl
                or al,cl
                out 21h,al

                popf                    ;restore IRQ status
                ret

IRQ_unhook      ENDP

;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
;лл                                                                         лл
;лл  Function: IRQ_validate                                                 лл
;лл                                                                         лл
;лл   Purpose: Tests for spurious or invalid IRQ signals                    лл
;лл                                                                         лл
;лл Call with: IRQ variable in VDI_HDR = interrupt #                        лл
;лл                                                                         лл
;лл   Returns: Carry set if IRQ valid                                       лл
;лл                                                                         лл
;лл      Uses: All registers preserved                                      лл
;лл                                                                         лл
;лл     Notes: On many IBM AT-compatible systems, spurious IRQ 7 signals    лл
;лл            frequently occur.   This function should be called at        лл
;лл            the beginning of the sound ISR to reject these false IRQs.   лл
;лл                                                                         лл
;лл            If IRQ_validate returns with the carry flag clear, the ISR   лл
;лл            should IRET immediately, without processing or acknowledging лл
;лл            the interrupt                                                лл
;лл                                                                         лл
;лл            Does not require valid DS register                           лл
;лл                                                                         лл
;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

IRQ_validate    PROC
                
                push ax

                cmp cs:IRQ,7            ;(spurious IRQs occur only on IRQ 7)
                stc
                jne __exit 

                mov al,1011b            ;OCW3: read ISR 
                out 20h,al              ;(Intel Peripheral Components, 1991,
                in al,20h               ; p. 3-188)

                shl al,1                ;set C = bit 7 (IRQ 7) of ISR register

__exit:         pop ax
                ret

IRQ_validate    ENDP

;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
;лл                                                                         лл
;лл  Function: IRQ_acknowledge                                              лл
;лл                                                                         лл
;лл   Purpose: Acknowledges the current IRQ                                 лл
;лл                                                                         лл
;лл Call with: IRQ variable in VDI_HDR = interrupt #                        лл
;лл                                                                         лл
;лл   Returns: Nothing                                                      лл
;лл                                                                         лл
;лл      Uses: All registers preserved                                      лл
;лл                                                                         лл
;лл     Notes: This routine must be called prior to returning from a        лл
;лл            sound ISR.  It sends an end-of-interrupt (EOI) signal to     лл
;лл            the Programmable Interrupt Controller (PIC) device, to       лл
;лл            prepare for subsequent interrupts.                           лл
;лл                                                                         лл
;лл            It is not necessary (or advisable) to call IRQ_acknowledge   лл
;лл            if the IRQ_validate function (above) returns with C=0        лл
;лл                                                                         лл
;лл            Does not require valid DS register                           лл
;лл                                                                         лл
;ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

IRQ_acknowledge PROC

                push ax

                mov al,20h              ;send EOI to PIC
                cmp cs:IRQ,8            ;clear PIC1 first if IRQ >= 8
                jb __master
                out 0a0h,al
__master:       out 20h,al

                pop ax
                ret

IRQ_acknowledge ENDP
