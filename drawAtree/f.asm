;=================== Speaker ======================
Speaker	MACRO  DI,  BX      ;  DI = frequency, BX¬°ªø«×
	LOCAL  Dur, SpkrOn
	;= 8253 Timer2 =
	MOV    AX,  0B6H
	OUT    43H, AL     ;  Timer2 control
	MOV    DX,  000FH
	MOV    AX,  8F80H  ;  2.60GHz
	DIV    DI          	
	OUT    42H, AL     ;  LowByte(Quo)    
	MOV    AL,  AH
	OUT    42H, AL     ;  HighByte(Quo)
	;= 8255 =
	IN     AL,  61H
	MOV    AH,  AL
	OR     AL,  03H    ;  Speaker On
	OUT    61H, AL     ;  Timer2  On
Dur:	MOV    CX,  23636
SpkrOn:	LOOP   SpkrOn
	DEC    BX
	JNZ    Dur
	MOV    AL,  AH
	OUT    61H, AL      
	ENDM

;============ Screen Function ==================
Set	MACRO row,column
	mov AH,02H
	mov DH,row
	mov DL,column
	INT 10H
	ENDM

Write	MACRO page,ascii,color,count
	mov AH,09H
	mov BH,page
	mov AL,ascii
	mov BL,color
	mov CX,count
	INT 10H
	ENDM

SetMode	MACRO mode
	mov AH,00H
	mov AL,mode
	INT 10H
	ENDM



CodeSg	SEGMENT
	ASSUME CS:CodeSg
	ORG	0100H

Main:	JMP     Load
OldInt9	DD	?
NewInt9	PROC
	PUSH	AX	
	MOV	AH,02H		;Get KBD
	INT	16H		;Status
	TEST	AL,00001000B	;Alt
	JZ	Over2	
	IN	AL,60H
	CMP	AL,44H		;F10 key
	JNE	Over

;================ Screen ====================
	SetMode 03H

	Set 2,20
	Write 0,32,11100110B,1
        Set 3,21
        Write 0,32,11100110B,1
        Set 4,20
        Write 0,32,11100110B,1
        Set 3,20
        Write 0,32,11100110B,1
        Set 3,19
        Write 0,32,11100110B,1
	Set 5,20
        Write 0,32,00100010B,1
        Set 6,20
        Write 0,32,00100010B,1
        Set 6,21
        Write 0,32,00100010B,1
        Set 6,19
        Write 0,32,00100010B,1
        Set 7,20
        Write 0,32,00100010B,1
        Set 7,21
        Write 0,32,00100010B,1
        Set 7,22
        Write 0,32,00100010B,1
        Set 7,19
        Write 0,32,00100010B,1
        Set 7,18
	Write 0,32,00100010B,1
	Set 8,20
	Write 0,32,00100010B,1
	Set 8,21
	Write 0,32,00100010B,1
	Set 8,22
	Write 0,32,00100010B,1
	Set 8,23
	Write 0,32,11011001B,1
	Set 8,19
	Write 0,32,00100010B,1
	Set 8,18
	Write 0,32,00100010B,1
	Set 8,17
	Write 0,32,01010101B,1
	Set 9,20
	Write 0,32,00100010B,1
	Set 9,21
	Write 0,32,00100010B,1
	Set 9,22
	Write 0,32,00100010B,1
	Set 9,23
	Write 0,32,00100010B,1
	Set 9,24
	Write 0,32,00100010B,1
	Set 9,19
	Write 0,32,11011001B,1
	Set 9,18
	Write 0,32,00100010B,1
	Set 9,17
	Write 0,32,00100010B,1
	Set 9,16
	Write 0,32,00100010B,1
	Set 10,15
	Write 0,32,00100010B,1
	Set 10,16
	Write 0,32,00100010B,1
	Set 10,17
	Write 0,32,00100010B,1
	Set 10,18
	Write 0,32,00100010B,1
	Set 10,19
	Write 0,32,00100010B,1
	Set 10,20
	Write 0,32,00100010B,1
	Set 10,21
	Write 0,32,00100010B,1
             Set 10,22
             Write 0,32,00100010B,1
             Set 10,23
             Write 0,32,01010101B,1
             Set 10,24
             Write 0,32,00100010B,1
             Set 10,25
             Write 0,32,00100010B,1
             Set 11,20
             Write 0,32,11011001B,1
             Set 11,21
             Write 0,32,00100010B,1
             Set 11,22
             Write 0,32,00100010B,1
             Set 11,19
             Write 0,32,11011001B,1
             Set 11,18
             Write 0,32,00100010B,1
             Set 12,20
             Write 0,32,00100010B,1
             Set 12,21
             Write 0,32,00100010B,1
             Set 12,22
             Write 0,32,00100010B,1
             Set 12,23
             Write 0,32,00100010B,1
             Set 12,19
             Write 0,32,10110001B,1
             Set 12,18
             Write 0,32,00100010B,1
             Set 12,17
             Write 0,32,00100010B,1
             Set 13,20
             Write 0,32,00100010B,1
             Set 13,21
             Write 0,32,00100010B,1
             Set 13,22
             Write 0,32,00100010B,1
             Set 13,23
             Write 0,32,00100010B,1
             Set 13,24
             Write 0,32,00100010B,1
             Set 13,19
             Write 0,32,00100010B,1
             Set 13,18
             Write 0,32,00100010B,1
             Set 13,17
             Write 0,32,00100010B,1
             Set 13,16
             Write 0,32,00100010B,1
             Set 14,20
             Write 0,32,00100010B,1
             Set 14,21
             Write 0,32,00100010B,1
             Set 14,22
             Write 0,32,00100010B,1
             Set 14,23
             Write 0,32,00100010B,1
             Set 14,24
             Write 0,32,10110001B,1
             Set 14,25
             Write 0,32,10110001B,1
             Set 14,19
             Write 0,32,00100010B,1
             Set 14,18
             Write 0,32,00100010B,1
             Set 14,17
             Write 0,32,00100010B,1
             Set 14,16
             Write 0,32,00100010B,1
             Set 14,15
             Write 0,32,00100010B,1
             Set 15,20
             Write 0,32,00100010B,1
             Set 15,21
             Write 0,32,00100010B,1
             Set 15,22
             Write 0,32,01010101B,1
             Set 15,23
             Write 0,32,00100010B,1
             Set 15,24
             Write 0,32,10110001B,1
             Set 15,26
             Write 0,32,00100010B,1
             Set 15,25
             Write 0,32,10110001B,1
             Set 15,19
             Write 0,32,00100010B,1
             Set 15,18
             Write 0,32,00100010B,1
             Set 15,17
             Write 0,32,00100010B,1
             Set 15,16
             Write 0,32,00100010B,1
             Set 15,15
             Write 0,32,10110001B,1
             Set 15,14
             Write 0,32,01010101B,1
             Set 16,20
             Write 0,32,00100010B,1
             Set 16,21
             Write 0,32,00100010B,1
             Set 16,22
             Write 0,32,00100010B,1
             Set 16,23
             Write 0,32,00100010B,1
             Set 16,24
             Write 0,32,00100010B,1
             Set 16,26
             Write 0,32,00100010B,1
             Set 16,25
             Write 0,32,00100010B,1
             Set 16,27
             Write 0,32,00100010B,1
             Set 16,19
             Write 0,32,01010101B,1
             Set 16,18
             Write 0,32,00100010B,1
             Set 16,17
             Write 0,32,10110001B,1
             Set 16,16
             Write 0,32,00100010B,1
             Set 16,15
             Write 0,32,00100010B,1
             Set 16,14
             Write 0,32,00100010B,1
             Set 16,13
             Write 0,32,01010101B,1


             Set 17,19
             Write 0,32,01000010B,1
             Set 17,20
             Write 0,32,01000010B,1
             Set 17,21
             Write 0,32,01000010B,1
             Set 18,19
             Write 0,32,01000010B,1
             Set 18,20
             Write 0,32,01000010B,1
             Set 18,21
             Write 0,32,01000010B,1
             Set 19,19
             Write 0,32,01000010B,1
             Set 19,20
             Write 0,32,01000010B,1
             Set 19,21
             Write 0,32,01000010B,1
             Set 20,19
             Write 0,32,01000010B,1
             Set 20,20
             Write 0,32,01000010B,1
             Set 20,21
             Write 0,32,01000010B,1
;============================================ 
        jmp     Over2	
	mov	AH,4CH
	int	21H
Over:	in	AL,60H
	cmp	AL,43H		; F9 key
	JNE	Over2

;=============== Speaker ====================
        mov      DI,659
        mov      BX,18000
        Speaker  DI,BX
        mov      DI,523
        mov      BX,18000
        Speaker  DI,BX
        mov      DI,659
        mov      BX,18000
        Speaker  DI,BX
        mov      DI,523
        mov      BX,18000
        Speaker  DI,BX
        mov      DI,659
        mov      BX,18000
        Speaker  DI,BX
        mov      DI,784
        mov      BX,18000
        Speaker  DI,BX
        mov      DI,784
        mov      BX,18000
        Speaker  DI,BX


;================= END ==========================
Over2:	POP	AX
	JMP	CS:OldInt9
NewInt9	ENDP
	ASSUME CS:CodeSg,DS:CodeSg
Load	PROC	
	push	CS
	pop	DS

;================ Get Interrupt Vector ======================
	MOV	AH,35H	
	MOV	AL,09H
	INT	21H
	MOV	WORD PTR OldInt9,BX
	MOV	WORD PTR OldInt9+2,ES

;================ Set Interrupt Vector to CS':IP' ===========
	MOV	AH,25H	
	MOV	AL,09H
	MOV	DX,OFFSET NewInt9
	INT	21H
	MOV	DX,(OFFSET Load-OFFSET CodeSg)
	ADD	DX,15
	MOV	CL,4

;================ Set TSR ===================================
	SHR	DX,CL	; DX=[(Load-CodeSg)+15] / 16
	MOV	AH,31H	; Terminate and Stay Resi.
	INT	21H
Load	ENDP
CodeSg	ENDS
	END		Main
