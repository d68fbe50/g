###############################################################
#                                                             #
#  MAKEFILE for AIL development                               #             
#  13-Mar-91 John Miles                                       #
#                                                             #
#  Watcom/Rational version                                    #
#                                                             #
#  Execute with Microsoft (or compatible) MAKE                #
#                                                             #
###############################################################

#
# Driver installation/configuration program
#

setsound.exe: setsound.c \
           ..\ail.h   \
           ..\ail.lib \
           ..\dll.h   \
           ..\dllload.obj
   wcl386 /w9 /s /4r setsound.c ..\dllload.obj ..\ail.lib

#
# Example program: Digital mixing demo
#

sstest.exe: sstest.c  \
           ..\ail.h   \
           ..\ail.lib \
           ..\dll.h   \
           ..\dllload.obj
   wcl386 /w9 /s /d2 /4r sstest.c ..\dllload.obj ..\ail.lib

#
# Example program: Digital double-buffering
#

dbtest.exe: dbtest.c  \
           ..\ail.h   \
           ..\ail.lib \
           ..\dll.h   \
           ..\dllload.obj
   wcl386 /w9 /s /d2 /4r dbtest.c ..\dllload.obj ..\ail.lib

#
# Example program: Digital .VOC / .WAV file playback
#

digplay.exe: digplay.c  \
             ..\ail.h   \
             ..\ail.lib \
             ..\dll.h   \
             ..\dllload.obj
   wcl386 /w9 /s /d2 /4r digplay.c ..\dllload.obj ..\ail.lib

#
# Example program: XMIDI file player
#

xmiplay.exe: xmiplay.c  \
             ..\ail.h   \
             ..\ail.lib \
             ..\dll.h   \
             ..\dllload.obj
   wcl386 /s /w9 /d2 /4r xmiplay.c ..\dllload.obj ..\ail.lib

#
# Example program: XMIDI file player with digital MIDI effects option
#

xdigplay.exe: xdigplay.c \
             ..\ail.h    \
             ..\ail.lib  \
             ..\dll.h    \
             ..\dllload.obj
   wcl386 /s /w9 /d2 /4r xdigplay.c ..\dllload.obj ..\ail.lib

#
# Media Vision Pro Audio Spectrum digital audio driver
#

proaudio.dig: digpas.asm vdi_dig.inc
   ml /DMASM digpas.asm
   copy digpas.com proaudio.dig
   del digpas.com
   del digpas.obj

#
# Roland RAP-10 digital audio driver
#

rap10.dig: digrap10.asm vdi_dig.inc
   ml /DMASM digrap10.asm
   copy digrap10.com rap10.dig
   del digrap10.com
   del digrap10.obj

#
# Microsoft Windows Sound System digital audio driver
#

sndsys.dig: digssys.asm vdi_dig.inc
   ml /DMASM digssys.asm
   copy digssys.com sndsys.dig
   del digssys.com
   del digssys.obj

#
# General MIDI with Roland MPU-401-compatible interface XMIDI driver
#

mpu401.mdi: mdimpu.asm vdi_mdi.inc
   tasm /m /w+ /ml /dTASM mdimpu.asm 
   tlink /c /x mdimpu
   exe2bin mdimpu.exe mpu401.mdi
   del mdimpu.exe
   del mdimpu.obj

#
# MT-32 family with Roland MPU-401-compatible interface XMIDI driver
#

mt32mpu.mdi: mdiail2x.asm vdi_mdi.inc mt32.inc mpu401.inc
   tasm /m /w+ /ml /dMT32 /dMPU401 /dTASM mdiail2x.asm
   tlink /c /x mdiail2x
   exe2bin mdiail2x.exe mt32mpu.mdi
   del mdiail2x.exe
   del mdiail2x.obj

#
# Standard Ad Lib / generic OPL2 XMIDI driver
#

adlib.mdi: mdiail2x.asm vdi_mdi.inc yamaha.inc
   tasm /m /w+ /ml /dADLIBSTD /dTASM mdiail2x.asm
   tlink /c /x mdiail2x
   exe2bin mdiail2x.exe adlib.mdi
   del mdiail2x.exe
   del mdiail2x.obj

#
# Standard Sound Blaster XMIDI driver
#

sblaster.mdi: mdiail2x.asm vdi_mdi.inc yamaha.inc
   tasm /m /w+ /ml /dSBSTD /dTASM mdiail2x.asm
   tlink /c /x mdiail2x
   exe2bin mdiail2x.exe sblaster.mdi
   del mdiail2x.exe
   del mdiail2x.obj

#
# Sound Blaster Pro I XMIDI driver
#

sbpro1.mdi: mdiail2x.asm vdi_mdi.inc yamaha.inc
   tasm /m /w+ /ml /dSBPRO1 /dTASM mdiail2x.asm
   tlink /c /x mdiail2x
   exe2bin mdiail2x.exe sbpro1.mdi
   del mdiail2x.exe
   del mdiail2x.obj

#
# Sound Blaster Pro II XMIDI driver
#

sbpro2.mdi: mdiail2x.asm vdi_mdi.inc yamaha.inc
   tasm /m /w+ /ml /dSBPRO2 /dTASM mdiail2x.asm
   tlink /c /x mdiail2x
   exe2bin mdiail2x.exe sbpro2.mdi
   del mdiail2x.exe
   del mdiail2x.obj

#
# Pro Audio Spectrum (original 8-bit dual-YM3812) XMIDI driver
#

pas.mdi: mdiail2x.asm vdi_mdi.inc yamaha.inc
   tasm /m /w+ /ml /dPAS /dTASM mdiail2x.asm
   tlink /c /x mdiail2x
   exe2bin mdiail2x.exe pas.mdi
   del mdiail2x.exe
   del mdiail2x.obj

#
# Pro Audio Spectrum-Plus or -16 (OPL3-based) XMIDI driver
#

pasplus.mdi: mdiail2x.asm vdi_mdi.inc yamaha.inc
   tasm /m /w+ /ml /dPASOPL /dTASM mdiail2x.asm
   tlink /c /x mdiail2x
   exe2bin mdiail2x.exe pasplus.mdi
   del mdiail2x.exe
   del mdiail2x.obj

#
# Ad Lib Gold XMIDI driver
#

adlibg.mdi: mdiail2x.asm vdi_mdi.inc yamaha.inc
   tasm /m /w+ /ml /dADLIBG /dTASM mdiail2x.asm
   tlink /c /x mdiail2x
   exe2bin mdiail2x.exe adlibg.mdi
   del mdiail2x.exe
   del mdiail2x.obj

#
# Generic OPL3 XMIDI driver (Tandy VIS, etc.)
#

opl3.mdi: mdiail2x.asm vdi_mdi.inc yamaha.inc
   tasm /m /w+ /ml /dGENOPL3 /dTASM mdiail2x.asm
   tlink /c /x mdiail2x
   exe2bin mdiail2x.exe opl3.mdi
   del mdiail2x.exe
   del mdiail2x.obj

#
# Tandy 3-voice XMIDI driver
#

tandy.mdi: mdiail2x.asm vdi_mdi.inc spkr.inc
   tasm /m /w+ /ml /dTANDY /dTASM mdiail2x.asm
   tlink /c /x mdiail2x
   exe2bin mdiail2x.exe tandy.mdi
   del mdiail2x.exe
   del mdiail2x.obj

#
# IBM internal speaker XMIDI driver
#

pcspkr.mdi: mdiail2x.asm vdi_mdi.inc spkr.inc
   tasm /m /w+ /ml /dIBMPC /dTASM mdiail2x.asm
   tlink /c /x mdiail2x
   exe2bin mdiail2x.exe pcspkr.mdi
   del mdiail2x.exe
   del mdiail2x.obj

#
# Null XMIDI driver (used when sequencing without sound output is needed)
#

null.mdi: mdinull.asm vdi_mdi.inc
   tasm /m /w+ /ml /dTASM mdinull.asm
   tlink /c /x mdinull
   exe2bin mdinull.exe null.mdi
   del mdinull.exe
   del mdinull.obj
