;
;==================================================================================================
;   ROMWBW 2.X CONFIGURATION DEFAULTS FOR RCBUS Z180 CPU
;==================================================================================================
;
; THIS FILE CONTAINS THE FULL SET OF DEFAULT CONFIGURATION SETTINGS FOR THE PLATFORM
; INDICATED ABOVE. THIS FILE SHOULD *NOT* NORMALLY BE CHANGED.	INSTEAD, YOU SHOULD
; OVERRIDE ANY SETTINGS YOU WANT USING A CONFIGURATION FILE IN THE CONFIG DIRECTORY
; UNDER THIS DIRECTORY.
;
; THIS FILE CAN BE CONSIDERED A REFERENCE THAT LISTS ALL POSSIBLE CONFIGURATION SETTINGS
; FOR THE PLATFORM.
;
#DEFINE PLATFORM_NAME "RCBus", " [", CONFIG, "]"
;
#INCLUDE "hbios.inc"
;
PLATFORM	.EQU	PLT_RCZ180	; PLT_[SBC|ZETA|ZETA2|N8|MK4|UNA|RCZ80|RCZ180|EZZ80|SCZ180|DYNO|RCZ280|MBC|RPH|Z80RETRO]
CPUFAM		.EQU	CPU_Z180	; CPU FAMILY: CPU_[Z80|Z180|Z280]
BIOS		.EQU	BIOS_WBW	; HARDWARE BIOS: BIOS_[WBW|UNA]
BATCOND		.EQU	FALSE		; ENABLE LOW BATTERY WARNING MESSAGE
HBIOS_MUTEX	.EQU	FALSE		; ENABLE REENTRANT CALLS TO HBIOS (ADDS OVERHEAD)
USELZSA2	.EQU	TRUE		; ENABLE FONT COMPRESSION
TICKFREQ	.EQU	50		; DESIRED PERIODIC TIMER INTERRUPT FREQUENCY (HZ)
;
BOOT_TIMEOUT	.EQU	-1		; AUTO BOOT TIMEOUT IN SECONDS, -1 TO DISABLE, 0 FOR IMMEDIATE
BOOT_DELAY	.EQU	0		; FIXED BOOT DELAY IN SECONDS PRIOR TO CONSOLE OUTPUT
;
CPUSPDCAP	.EQU	SPD_FIXED	; CPU SPEED CHANGE CAPABILITY SPD_FIXED|SPD_HILO
CPUSPDDEF	.EQU	SPD_HIGH	; CPU SPEED DEFAULT SPD_UNSUP|SPD_HIGH|SPD_LOW
CPUOSC		.EQU	18432000	; CPU OSC FREQ IN MHZ
INTMODE		.EQU	2		; INTERRUPTS: 0=NONE, 1=MODE 1, 2=MODE 2, 3=MODE 3 (Z280)
DEFSERCFG	.EQU	SER_115200_8N1	; DEFAULT SERIAL LINE CONFIG (SEE STD.ASM)
;
RAMSIZE		.EQU	512		; SIZE OF RAM IN KB (MUST MATCH YOUR HARDWARE!!!)
ROMSIZE		.EQU	512		; SIZE OF ROM IN KB (MUST MATCH YOUR HARDWARE!!!)
ROMSIZE_CHK	.EQU	0		; ROMSIZE VALUE VERIFICATION (0=DISABLED)
MEMMGR		.EQU	MM_Z180		; MEMORY MANAGER: MM_[SBC|Z2|N8|Z180|Z280|MBC|RPH]
RAMLOC		.EQU	19		; START OF RAM AS POWER OF 2 (2^N) IN PHYSICAL ADDRESS SPACE
RAMBIAS		.EQU	(1 << (RAMLOC - 10))	; OFFSET OF START OF RAM IN PHYSICAL ADDRESS SPACE
MPGSEL_0	.EQU	$78		; Z2 MEM MGR BANK 0 PAGE SELECT REG (WRITE ONLY)
MPGSEL_1	.EQU	$79		; Z2 MEM MGR BANK 1 PAGE SELECT REG (WRITE ONLY)
MPGSEL_2	.EQU	$7A		; Z2 MEM MGR BANK 2 PAGE SELECT REG (WRITE ONLY)
MPGSEL_3	.EQU	$7B		; Z2 MEM MGR BANK 3 PAGE SELECT REG (WRITE ONLY)
MPGENA		.EQU	$7C		; Z2 MEM MGR PAGING ENABLE REGISTER (BIT 0, WRITE ONLY)
;
Z180_BASE	.EQU	$C0		; Z180: I/O BASE ADDRESS FOR INTERNAL REGISTERS
Z180_CLKDIV	.EQU	1		; Z180: CHK DIV: 0=OSC/2, 1=OSC, 2=OSC*2
Z180_MEMWAIT	.EQU	0		; Z180: MEMORY WAIT STATES (0-3)
Z180_IOWAIT	.EQU	1		; Z180: I/O WAIT STATES TO ADD ABOVE 1 W/S BUILT-IN (0-3)
Z180_TIMER	.EQU	TRUE		; Z180: ENABLE Z180 SYSTEM PERIODIC TIMER
;
RTCIO		.EQU	$0C		; RTC LATCH REGISTER ADR
;
KIOENABLE	.EQU	FALSE		; ENABLE ZILOG KIO SUPPORT
KIOBASE		.EQU	$80		; KIO BASE I/O ADDRESS
;
CTCENABLE	.EQU	FALSE		; ENABLE ZILOG CTC SUPPORT
CTCDEBUG	.EQU	FALSE		; ENABLE CTC DRIVER DEBUG OUTPUT
CTCBASE		.EQU	$88		; CTC BASE I/O ADDRESS
CTCTIMER	.EQU	FALSE		; ENABLE CTC PERIODIC TIMER
;
EIPCENABLE	.EQU	FALSE		; EIPC: ENABLE Z80 EIPC (Z84C15) INITIALIZATION
;
SKZENABLE	.EQU	FALSE		; ENABLE SERGEY'S Z80-512K FEATURES
;
WDOGMODE	.EQU	WDOG_NONE	; WATCHDOG MODE: WDOG_[NONE|EZZ80|SKZ]
;
FPENABLE	.EQU	FALSE		; ENABLES FRONT PANEL SWITCHES
FPBASE		.EQU	$00		; FRONT PANEL I/O PORT BASE ADDRESS
DIAGENABLE	.EQU	TRUE		; ENABLES OUTPUT TO 8 BIT LED DIAGNOSTIC PORT
DIAGPORT	.EQU	$00		; DIAGNOSTIC PORT ADDRESS
DIAGDISKIO	.EQU	TRUE		; ENABLES DISK I/O ACTIVITY ON DIAGNOSTIC LEDS
DIAGLVL		.EQU	DL_CRITICAL	; ERROR LEVEL REPORTING
;
LEDENABLE	.EQU	FALSE		; ENABLES STATUS LED (SINGLE LED)
LEDMODE		.EQU	LEDMODE_STD	; LEDMODE_[STD|RTC]
LEDPORT		.EQU	$0E		; STATUS LED PORT ADDRESS
LEDDISKIO	.EQU	TRUE		; ENABLES DISK I/O ACTIVITY ON STATUS LED
;
DSKYENABLE	.EQU	FALSE		; ENABLES DSKY (DO NOT COMBINE WITH PPIDE)
;
BOOTCON		.EQU	0		; BOOT CONSOLE DEVICE
CRTACT		.EQU	FALSE		; ACTIVATE CRT (VDU,CVDU,PROPIO,ETC) AT STARTUP
VDAEMU		.EQU	EMUTYP_ANSI	; VDA EMULATION: EMUTYP_[TTY|ANSI]
VDAEMU_SERKBD	.EQU	$FF		; VDA EMULATION: SERIAL KBD UNIT #, OR $FF FOR HW KBD
ANSITRACE	.EQU	1		; ANSI DRIVER TRACE LEVEL (0=NO,1=ERRORS,2=ALL)
PPKTRACE	.EQU	1		; PPK DRIVER TRACE LEVEL (0=NO,1=ERRORS,2=ALL)
KBDTRACE	.EQU	1		; KBD DRIVER TRACE LEVEL (0=NO,1=ERRORS,2=ALL)
PPKKBLOUT	.EQU	KBD_US		; PPK KEYBOARD LANGUAGE: KBD_[US|DE]
KBDKBLOUT	.EQU	KBD_US		; KBD KEYBOARD LANGUAGE: KBD_[US|DE]
MKYENABLE	.EQU	FALSE		; MSX 5255 PPI KEYBOARD COMPATIBLE DRIVER (REQUIRES TMS VDA DRIVER)
MKYKBLOUT	.EQU	KBD_US		; KBD KEYBOARD LANGUAGE: KBD_[US|DE]
;
DSRTCENABLE	.EQU	TRUE		; DSRTC: ENABLE DS-1302 CLOCK DRIVER (DSRTC.ASM)
DSRTCMODE	.EQU	DSRTCMODE_STD	; DSRTC: OPERATING MODE: DSRTC_[STD|MFPIC]
DSRTCCHG	.EQU	FALSE		; DSRTC: FORCE BATTERY CHARGE ON (USE WITH CAUTION!!!)
;
DS1501RTCENABLE	.EQU	FALSE		; DS1501RTC: ENABLE DS-1501 CLOCK DRIVER (DS1501RTC.ASM)
DS1501RTC_BASE	.EQU	$50		; DS1501RTC: I/O BASE ADDRESS
;
BQRTCENABLE	.EQU	FALSE		; BQRTC: ENABLE BQ4845 CLOCK DRIVER (BQRTC.ASM)
BQRTC_BASE	.EQU	$50		; BQRTC: I/O BASE ADDRESS
;
INTRTCENABLE	.EQU	FALSE		; ENABLE PERIODIC INTERRUPT CLOCK DRIVER (INTRTC.ASM)
;
RP5RTCENABLE	.EQU	FALSE		; RP5C01 RTC BASED CLOCK (RP5RTC.ASM)
;
HTIMENABLE	.EQU	FALSE		; ENABLE SIMH TIMER SUPPORT
SIMRTCENABLE	.EQU	FALSE		; ENABLE SIMH CLOCK DRIVER (SIMRTC.ASM)
;
DS7RTCENABLE	.EQU	FALSE		; DS7RTC: ENABLE DS-1307 I2C CLOCK DRIVER (DS7RTC.ASM)
DS7RTCMODE	.EQU	DS7RTCMODE_PCF	; DS7RTC: OPERATING MODE: DS7RTC_[PCF]
;
DUARTENABLE	.EQU	FALSE		; DUART: ENABLE 2681/2692 SERIAL DRIVER (DUART.ASM)
DUARTCNT	.EQU	1		; DUART: NUMBER OF CHIPS TO DETECT (1-2)
DUART0BASE	.EQU	$A0		; DUART 0: BASE ADDRESS OF CHIP
DUART0ACFG	.EQU	DEFSERCFG	; DUART 0A: SERIAL LINE CONFIG
DUART0BCFG	.EQU	DEFSERCFG	; DUART 0B: SERIAL LINE CONFIG
DUART1BASE	.EQU	$40		; DUART 1: BASE ADDRESS OF CHIP
DUART1ACFG	.EQU	DEFSERCFG	; DUART 1A: SERIAL LINE CONFIG
DUART1BCFG	.EQU	DEFSERCFG	; DUART 1B: SERIAL LINE CONFIG
;
UARTENABLE	.EQU	TRUE		; UART: ENABLE 8250/16550-LIKE SERIAL DRIVER (UART.ASM)
UARTOSC		.EQU	1843200		; UART: OSC FREQUENCY IN MHZ
UARTINTS	.EQU	FALSE		; UART: INCLUDE INTERRUPT SUPPORT UNDER IM1/2/3
UARTCFG		.EQU	DEFSERCFG | SER_RTS	; UART: LINE CONFIG FOR UART PORTS
UARTSBC		.EQU	FALSE		; UART: AUTO-DETECT SBC/ZETA ONBOARD UART
UARTSBCFORCE	.EQU	FALSE		; UART: FORCE DETECTION OF SBC UART (FOR SIMH)
UARTCAS		.EQU	FALSE		; UART: AUTO-DETECT ECB CASSETTE UART
UARTMFP		.EQU	FALSE		; UART: AUTO-DETECT MF/PIC UART
UART4		.EQU	FALSE		; UART: AUTO-DETECT 4UART UART
UARTRC		.EQU	TRUE		; UART: AUTO-DETECT RC UART
UARTDUAL	.EQU	FALSE		; UART: AUTO-DETECT DUAL UART
;
ASCIENABLE	.EQU	TRUE		; ASCI: ENABLE Z180 ASCI SERIAL DRIVER (ASCI.ASM)
ASCIINTS	.EQU	TRUE		; ASCI: INCLUDE INTERRUPT SUPPORT UNDER IM1/2/3
ASCISWAP	.EQU	FALSE		; ASCI: SWAP CHANNELS
ASCIBOOT	.EQU	0		; ASCI: REBOOT ON RCV CHAR (0=DISABLED)
ASCI0CFG	.EQU	DEFSERCFG	; ASCI 0: SERIAL LINE CONFIG
ASCI1CFG	.EQU	DEFSERCFG	; ASCI 1: SERIAL LINE CONFIG
;
Z2UENABLE	.EQU	FALSE		; Z2U: ENABLE Z280 UART SERIAL DRIVER (Z2U.ASM)
;
ACIAENABLE	.EQU	FALSE		; ACIA: ENABLE MOTOROLA 6850 ACIA DRIVER (ACIA.ASM)
;
SIOENABLE	.EQU	TRUE		; SIO: ENABLE ZILOG SIO SERIAL DRIVER (SIO.ASM)
SIODEBUG	.EQU	FALSE		; SIO: ENABLE DEBUG OUTPUT
SIOBOOT		.EQU	0		; SIO: REBOOT ON RCV CHAR (0=DISABLED)
SIOCNT		.EQU	2		; SIO: NUMBER OF CHIPS TO DETECT (1-2), 2 CHANNELS PER CHIP
SIO0MODE	.EQU	SIOMODE_RC	; SIO 0: CHIP TYPE: SIOMODE_[STD|RC|SMB|ZP|Z80R]
SIO0BASE	.EQU	$80		; SIO 0: REGISTERS BASE ADR
SIO0ACLK	.EQU	7372800		; SIO 0A: OSC FREQ IN HZ, ZP=2457600/4915200, RC/SMB=7372800
SIO0ACFG	.EQU	SER_115200_8N1	; SIO 0A: SERIAL LINE CONFIG
SIO0ACTCC	.EQU	-1		; SIO 0A: CTC CHANNEL 0=A, 1=B, 2=C, 3=D, -1 FOR NONE
SIO0BCLK	.EQU	7372800		; SIO 0B: OSC FREQ IN HZ, ZP=2457600/4915200, RC/SMB=7372800
SIO0BCFG	.EQU	SER_115200_8N1	; SIO 0B: SERIAL LINE CONFIG
SIO0BCTCC	.EQU	-1		; SIO 0B: CTC CHANNEL 0=A, 1=B, 2=C, 3=D, -1 FOR NONE
SIO1MODE	.EQU	SIOMODE_RC	; SIO 1: CHIP TYPE: SIOMODE_[STD|RC|SMB|ZP|Z80R]
SIO1BASE	.EQU	$84		; SIO 1: REGISTERS BASE ADR
SIO1ACLK	.EQU	7372800		; SIO 1A: OSC FREQ IN HZ, ZP=2457600/4915200, RC/SMB=7372800
SIO1ACFG	.EQU	SER_115200_8N1	; SIO 1A: SERIAL LINE CONFIG
SIO1ACTCC	.EQU	-1		; SIO 1A: CTC CHANNEL 0=A, 1=B, 2=C, 3=D, -1 FOR NONE
SIO1BCLK	.EQU	7372800		; SIO 1B: OSC FREQ IN HZ, ZP=2457600/4915200, RC/SMB=7372800
SIO1BCFG	.EQU	SER_115200_8N1	; SIO 1B: SERIAL LINE CONFIG
SIO1BCTCC	.EQU	-1		; SIO 1B: CTC CHANNEL 0=A, 1=B, 2=C, 3=D, -1 FOR NONE
;
XIOCFG		.EQU	DEFSERCFG	; XIO: SERIAL LINE CONFIG
;
VDUENABLE	.EQU	FALSE		; VDU: ENABLE VDU VIDEO/KBD DRIVER (VDU.ASM)
CVDUENABLE	.EQU	FALSE		; CVDU: ENABLE CVDU VIDEO/KBD DRIVER (CVDU.ASM)
GDCENABLE	.EQU	FALSE		; GDC: ENABLE 7220 GDC VIDEO/KBD DRIVER (GDC.ASM)
TMSENABLE	.EQU	FALSE		; TMS: ENABLE TMS9918 VIDEO/KBD DRIVER (TMS.ASM)
TMSMODE		.EQU	TMSMODE_MSX	; TMS: DRIVER MODE: TMSMODE_[SCG|N8|MBC|MSX|MSX9958|MSXKBD|COLECO]
TMSTIMENABLE	.EQU	FALSE		; TMS: ENABLE TIMER INTERRUPTS (REQUIRES IM1)
VGAENABLE	.EQU	FALSE		; VGA: ENABLE VGA VIDEO/KBD DRIVER (VGA.ASM)
;
MDENABLE	.EQU	TRUE		; MD: ENABLE MEMORY (ROM/RAM) DISK DRIVER (MD.ASM)
MDROM		.EQU	TRUE		; MD: ENABLE ROM DISK
MDRAM		.EQU	TRUE		; MD: ENABLE RAM DISK
MDTRACE		.EQU	1		; MD: TRACE LEVEL (0=NO,1=ERRORS,2=ALL)
MDFFENABLE	.EQU	FALSE		; MD: ENABLE FLASH FILE SYSTEM
;
FDENABLE	.EQU	FALSE		; FD: ENABLE FLOPPY DISK DRIVER (FD.ASM)
FDMODE		.EQU	FDMODE_RCWDC	; FD: DRIVER MODE: FDMODE_[DIO|ZETA|ZETA2|DIDE|N8|DIO3|RCSMC|RCWDC|DYNO|EPFDC|MBC]
FDCNT		.EQU	2		; FD: NUMBER OF FLOPPY DRIVES ON THE INTERFACE (1-2)
FDTRACE		.EQU	1		; FD: TRACE LEVEL (0=NO,1=FATAL,2=ERRORS,3=ALL)
FDMEDIA		.EQU	FDM144		; FD: DEFAULT MEDIA FORMAT FDM[720|144|360|120|111]
FDMEDIAALT	.EQU	FDM720		; FD: ALTERNATE MEDIA FORMAT FDM[720|144|360|120|111]
FDMAUTO		.EQU	TRUE		; FD: AUTO SELECT DEFAULT/ALTERNATE MEDIA FORMATS
;
RFENABLE	.EQU	FALSE		; RF: ENABLE RAM FLOPPY DRIVER
;
IDEENABLE	.EQU	FALSE		; IDE: ENABLE IDE DISK DRIVER (IDE.ASM)
IDETRACE	.EQU	1		; IDE: TRACE LEVEL (0=NO,1=ERRORS,2=ALL)
IDECNT		.EQU	1		; IDE: NUMBER OF IDE INTERFACES TO DETECT (1-3), 2 DRIVES EACH
IDE0MODE	.EQU	IDEMODE_RC	; IDE 0: DRIVER MODE: IDEMODE_[DIO|DIDE|MK4|RC]
IDE0BASE	.EQU	$10		; IDE 0: IO BASE ADDRESS
IDE0DATLO	.EQU	$00		; IDE 0: DATA LO PORT FOR 16-BIT I/O
IDE0DATHI	.EQU	$00		; IDE 0: DATA HI PORT FOR 16-BIT I/O
IDE0A8BIT	.EQU	TRUE		; IDE 0A (MASTER): 8 BIT XFER
IDE0B8BIT	.EQU	TRUE		; IDE 0B (MASTER): 8 BIT XFER
IDE1MODE	.EQU	IDEMODE_NONE	; IDE 1: DRIVER MODE: IDEMODE_[DIO|DIDE|MK4|RC]
IDE1BASE	.EQU	$00		; IDE 1: IO BASE ADDRESS
IDE1DATLO	.EQU	$00		; IDE 1: DATA LO PORT FOR 16-BIT I/O
IDE1DATHI	.EQU	$00		; IDE 1: DATA HI PORT FOR 16-BIT I/O
IDE1A8BIT	.EQU	TRUE		; IDE 1A (MASTER): 8 BIT XFER
IDE1B8BIT	.EQU	TRUE		; IDE 1B (MASTER): 8 BIT XFER
IDE2MODE	.EQU	IDEMODE_NONE	; IDE 2: DRIVER MODE: IDEMODE_[DIO|DIDE|MK4|RC]
IDE2BASE	.EQU	$00		; IDE 2: IO BASE ADDRESS
IDE2DATLO	.EQU	$00		; IDE 2: DATA LO PORT FOR 16-BIT I/O
IDE2DATHI	.EQU	$00		; IDE 2: DATA HI PORT FOR 16-BIT I/O
IDE2A8BIT	.EQU	TRUE		; IDE 2A (MASTER): 8 BIT XFER
IDE2B8BIT	.EQU	TRUE		; IDE 2B (MASTER): 8 BIT XFER
;
PPIDEENABLE	.EQU	FALSE		; PPIDE: ENABLE PARALLEL PORT IDE DISK DRIVER (PPIDE.ASM)
PPIDETRACE	.EQU	1		; PPIDE: TRACE LEVEL (0=NO,1=ERRORS,2=ALL)
PPIDECNT	.EQU	1		; PPIDE: NUMBER OF PPI CHIPS TO DETECT (1-3), 2 DRIVES PER CHIP
PPIDE0BASE	.EQU	$20		; PPIDE 0: PPI REGISTERS BASE ADR
PPIDE0A8BIT	.EQU	FALSE		; PPIDE 0A (MASTER): 8 BIT XFER
PPIDE0B8BIT	.EQU	FALSE		; PPIDE 0B (SLAVE): 8 BIT XFER
PPIDE1BASE	.EQU	$00		; PPIDE 1: PPI REGISTERS BASE ADR
PPIDE1A8BIT	.EQU	FALSE		; PPIDE 1A (MASTER): 8 BIT XFER
PPIDE1B8BIT	.EQU	FALSE		; PPIDE 0B (SLAVE): 8 BIT XFER
PPIDE2BASE	.EQU	$00		; PPIDE 2: PPI REGISTERS BASE ADR
PPIDE2A8BIT	.EQU	FALSE		; PPIDE 2A (MASTER): 8 BIT XFER
PPIDE2B8BIT	.EQU	FALSE		; PPIDE 0B (SLAVE): 8 BIT XFER
;
SDENABLE	.EQU	FALSE		; SD: ENABLE SD CARD DISK DRIVER (SD.ASM)
SDMODE		.EQU	SDMODE_MT	; SD: DRIVER MODE: SDMODE_[JUHA|N8|CSIO|PPI|UART|DSD|MK4|SC|MT|PIO|USR]
SDPPIBASE	.EQU	$60		; SD: BASE I/O ADDRESS OF PPI FOR PPI MODDE
SDCNT		.EQU	2		; SD: NUMBER OF SD CARD DEVICES (1-2), FOR DSD/SC/MT ONLY
SDTRACE		.EQU	1		; SD: TRACE LEVEL (0=NO,1=ERRORS,2=ALL)
SDCSIOFAST	.EQU	FALSE		; SD: ENABLE TABLE-DRIVEN BIT INVERTER IN CSIO MODE
SDMTSWAP	.EQU	FALSE		; SD: SWAP THE LOGICAL ORDER OF THE SPI PORTS OF THE MT011
;
PRPENABLE	.EQU	FALSE		; PRP: ENABLE ECB PROPELLER IO BOARD DRIVER (PRP.ASM)
PRPSDENABLE	.EQU	TRUE		; PRP: ENABLE PROPIO DRIVER SD CARD SUPPORT
PRPSDTRACE	.EQU	1		; PRP: SD CARD TRACE LEVEL (0=NO,1=ERRORS,2=ALL)
PRPCONENABLE	.EQU	TRUE		; PRP: ENABLE PROPIO DRIVER VIDEO/KBD SUPPORT
;
PPPENABLE	.EQU	FALSE		; PPP: ENABLE ZETA PARALLEL PORT PROPELLER BOARD DRIVER (PPP.ASM)
;
HDSKENABLE	.EQU	FALSE		; HDSK: ENABLE SIMH HDSK DISK DRIVER (HDSK.ASM)
;
PIOENABLE	.EQU	FALSE		; PIO: ENABLE ZILOG PIO DRIVER (PIO.ASM)
PIOCNT		.EQU	2		; PIO: NUMBER OF CHIPS TO DETECT (1-2), 2 CHANNELS PER CHIP
PIO0BASE	.EQU	$B8		; PIO 0: REGISTERS BASE ADR
PIO1BASE	.EQU	$BC		; PIO 1: REGISTERS BASE ADR
;
LPTENABLE	.EQU	FALSE		; LPT: ENABLE CENTRONICS PRINTER DRIVER (LPT.ASM)
;
PIO_4P		.EQU	FALSE		; PIO: ENABLE PARALLEL PORT DRIVER FOR ECB 4P BOARD
PIO_ZP		.EQU	FALSE		; PIO: ENABLE PARALLEL PORT DRIVER FOR ECB ZILOG PERIPHERALS BOARD (PIO.ASM)
PIO_SBC		.EQU	FALSE		; PIO: ENABLE PARALLEL PORT DRIVER FOR 8255 CHIP
;
UFENABLE	.EQU	FALSE		; UF: ENABLE ECB USB FIFO DRIVER (UF.ASM)
;
SN76489ENABLE	.EQU	FALSE		; SN: ENABLE SN76489 SOUND DRIVER
AUDIOTRACE	.EQU	FALSE		; ENABLE TRACING TO CONSOLE OF SOUND DRIVER
SN7CLK		.EQU	3579545		; SN: PSG CLOCK FREQ, ASSUME MSX STD
SNMODE		.EQU	SNMODE_RC	; SN: DRIVER MODE: SNMODE_[NONE|RC|VGM]
;
AY38910ENABLE	.EQU	FALSE		; AY: ENABLE AY-3-8910 / YM2149 SOUND DRIVER
AY_CLK		.EQU	1789772		; AY: PSG CLOCK FREQ, ASSUME MSX STD
AYMODE		.EQU	AYMODE_RCZ180	; AY: DRIVER MODE: AYMODE_[SCG|N8|RCZ80|RCZ180|MSX|LINC|MBC]
;
SPKENABLE	.EQU	FALSE		; SPK: ENABLE RTC LATCH IOBIT SOUND DRIVER (SPK.ASM)
;
DMAENABLE	.EQU	FALSE		; DMA: ENABLE DMA DRIVER (DMA.ASM)
DMABASE		.EQU	$E0		; DMA: DMA BASE ADDRESS
DMAMODE		.EQU	DMAMODE_Z180	; DMA: DMA MODE (NONE|ECB|Z180|Z280|RC|MBC)
;
YM2612ENABLE	.EQU	FALSE		; YM2612: ENABLE YM2612 DRIVER (MUTE STUB)
VGMBASE		.EQU	$C0		; YM2612: BASE ADDRESS FOR VGM BOARD (YM2612/SN76469s/CTC)
