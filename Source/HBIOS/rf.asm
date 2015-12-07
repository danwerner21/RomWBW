;
;==================================================================================================
;   RAM FLOPPY DISK DRIVER
;==================================================================================================
;
;
;
RF_U0IO		.EQU	$A0
RF_U1IO		.EQU	$A4
;
; IO PORT OFFSETS
;
RF_DAT		.EQU	0
RF_AL		.EQU	1
RF_AH		.EQU	2
RF_ST		.EQU	3
;
;
;
RF_INIT:
	PRTS("RF: UNITS=$")
	LD	A,RFCNT
	CALL	PRTDECB
;
	XOR	A		; INIT SUCCEEDED
	RET			; RETURN
;
;
;
RF_DISPATCH:
	; VERIFY AND SAVE THE TARGET DEVICE/UNIT LOCALLY IN DRIVER
	LD	A,C		; DEVICE/UNIT FROM C
	AND	$0F		; ISOLATE UNIT NUM
	CP	2		; CHECK FOR MAX UNIT EXCEEDED
	LD	(RF_UNIT),A	; SAVE IT
	CALL	NC,PANIC	; PANIC IF TOO HIGH
;
	; DISPATCH ACCORDING TO DISK SUB-FUNCTION
	LD	A,B		; GET REQUESTED FUNCTION
	AND	$0F		; ISOLATE SUB-FUNCTION
	JP	Z,RF_SEEK	; SUB-FUNC 0: SEEK, USE HBIOS FOR NOW
	DEC	A
	JP	Z,RF_READ	; SUB-FUNC 1: READ
	DEC	A
	JP	Z,RF_WRITE	; SUB-FUNC 2: WRITE
	DEC	A
	JP	Z,RF_STATUS	; SUB-FUNC 3: STATUS
	DEC	A
	JP	Z,RF_RESET	; SUB-FUNC 4: RESET
	DEC	A
	JP	Z,RF_CAP	; SUB-FUNC 5: GET CAPACITY
	DEC	A
	JP	Z,RF_GEOM	; SUB-FUNC 6: GET GEOMETRY
	DEC	A
	JP	Z,RF_GETPAR	; SUB-FUNC 7: GET PARAMETERS
	DEC	A
	JP	Z,RF_SETPAR	; SUB-FUNC 8: SET PARAMETERS
	CALL	PANIC		; INVALID SUB-FUNCTION
;
;
;
RF_GETPAR:
	LD	A,C		; DEVICE/UNIT IS IN C
	ADD	A,MID_RF	; SET CORRECT MEDIA VALUE
	LD	E,A		; VALUE TO E
	XOR	A		; SIGNAL SUCCESS
	RET
;
;
;
RF_SETPAR:
	; NOT IMPLEMENTED
	XOR	A
	RET
;
;
;
RF_STATUS:
	XOR	A		; STATUS ALWAYS OK
	RET
;
;
;
RF_RESET:
	XOR	A		; ALWAYS OK
	RET
;
;
;
RF_CAP:
	LD	A,C		; DEVICE/UNIT IS IN C
	AND	$0F		; ISOLATE UNIT NUM
	CP	RFCNT		; CHECK FOR MAX UNIT EXCEEDED
	CALL	NC,PANIC	; PANIC IF TOO HIGH
;
	LD	DE,0
	LD	HL,$2000	; 8192 BLOCKS OF 512 BYTES
	XOR	A
	RET
;
;
;
RF_GEOM:
	; FOR LBA, WE SIMULATE CHS ACCESS USING 16 HEADS AND 16 SECTORS
	; RETURN HS:CC -> DE:HL, SET HIGH BIT OF D TO INDICATE LBA CAPABLE
	CALL	RF_CAP			; GET TOTAL BLOCKS IN DE:HL, BLOCK SIZE TO BC
	LD	L,H			; DIVIDE BY 256 FOR # TRACKS
	LD	H,E			; ... HIGH BYTE DISCARDED, RESULT IN HL
	LD	D,16 | $80		; HEADS / CYL = 16, SET LBA CAPABILITY BIT
	LD	E,16			; SECTORS / TRACK = 16
	XOR	A			; SIGNAL SUCCESS
	RET
;
;
;
RF_SEEK:
	BIT	7,D		; CHECK FOR LBA FLAG
	CALL	Z,HB_CHS2LBA	; CLEAR MEANS CHS, CONVERT TO LBA
	RES	7,D		; CLEAR FLAG REGARDLESS (DOES NO HARM IF ALREADY LBA)
	LD	BC,HSTLBA	; POINT TO LBA STORAGE
	CALL	ST32		; SAVE LBA ADDRESS
	XOR	A		; SIGNAL SUCCESS
	RET			; AND RETURN
;
;
;
RF_READ:
	LD	(RF_DSKBUF),HL	; SAVE DISK BUFFER ADDRESS
	CALL	RF_SETIO
	CALL	RF_SETADR
	LD	HL,(RF_DSKBUF)
	LD	B,0
	LD	A,(RF_IO)
	OR	RF_DAT
	LD	C,A
	INIR
	INIR
	XOR	A
	RET
;
;
;
RF_WRITE:
	LD	(RF_DSKBUF),HL	; SAVE DISK BUFFER ADDRESS
	CALL	RF_SETIO
	LD	A,(RF_IO)
	OR	RF_ST
	LD	C,A
	IN	A,(C)
	BIT	0,A			; CHECK WRITE PROTECT
	LD	A,1			; PREPARE TO RETURN FALSE (ERROR)
	RET	NZ			; WRITE PROTECTED!
	CALL	RF_SETADR
	LD	HL,(RF_DSKBUF)
	LD	B,0
	LD	A,(RF_IO)
	OR	RF_DAT
	LD	C,A
	OTIR
	OTIR
	XOR	A
	RET
;
;
;
RF_SETIO:
	LD	A,(RF_UNIT)	; GET DEVICE/UNIT
	AND	$0F		; ISOLATE UNIT NUM
	JR	NZ,RF_SETIO1
	LD	A,RF_U0IO
	JR	RF_SETIO3
RF_SETIO1:
	DEC	A
	JR	NZ,RF_SETIO2
	LD	A,RF_U1IO
	JR	RF_SETIO3
RF_SETIO2:
	CALL	PANIC		; INVALID UNIT
RF_SETIO3:
	LD	(RF_IO),A
	RET
;
;
;
RF_SETADR:
	LD	A,(RF_IO)
	OR	RF_AL
	LD	C,A
	LD	A,(HSTLBALO)
	OUT	(C),A
	LD	A,(HSTLBALO+1)
	INC	C
	OUT	(C),A
	RET
;
;
;
RF_IO	.DB	0
;
RF_UNIT		.DB	0
RF_DSKBUF	.DW	0