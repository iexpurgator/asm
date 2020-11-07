INCLUDE Irvine32.inc
INCLUDE Macros.inc

.DATA
	s BYTE 100 DUP(?)

.CODE
main PROC
	mWrite < "    Nhap string: ", 0 >
	mov edx, offset s
	mov ecx, 100
	CALL ReadString
	mov esi, edx	;esi points to start
	add edx, eax
	dec edx			;edx points to end
reverse:
	cmp esi, edx	;compare esi with edi
	jge reversed ;if esi >= edx then jump to print
	mov bl, [esi]
	mov al, [edx]
	mov [esi], al
	mov [edx], bl
	inc esi ;&esi++
	dec edx	;&edx--
	jmp reverse
reversed:
	mWrite < "String Reversed: ", 0 >
	mov edx, offset s
	call writeString
	push 0
	call ExitProcess
main ENDP
END main
