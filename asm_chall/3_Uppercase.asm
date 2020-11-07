INCLUDE Irvine32.inc
INCLUDE Macros.inc

.DATA
	s BYTE ?
.CODE
main PROC
	mWrite < "Nhap string: ", 0 >
	mov edx, offset s
	mov ecx, 33
	CALL ReadString
upper:
	mov al, [edx]
	cmp al, 0h
	je jmpout ;jump if al == 0
	cmp al, 'a'
	jb next_step ;jump if al < 'a'
	cmp al, 'z'
	ja next_step ;jump if al > 'z'
	sub al, 20h ;lowercase -> uppercase
	mov [edx], al
next_step:
	add edx, TYPE s
	jmp upper
jmpout:
	mov edx, offset s
	call writeString
	push 0
	call ExitProcess
main ENDP
END main
