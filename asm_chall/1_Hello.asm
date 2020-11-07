INCLUDE /Irvine/Irvine32.inc
INCLUDE /Irvine/Macros.inc

.DATA

.CODE
main PROC
	mWrite <"Hello World!", 13, 10, 0>
	exit
main ENDP
END main