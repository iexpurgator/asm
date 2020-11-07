INCLUDE Irvine32.inc
INCLUDE Macros.inc

.DATA
	s BYTE 258 DUP (?)
	chr BYTE 17 DUP (?)
	sz_c DWORD 0
	count DWORD 0
	cnt DWORD 0
	i DWORD 0
	arr DWORD 101 DUP (-1)

.CODE
output proc
	mov	eax, count
	call WriteDec
	mWrite < 13, 10, 0 >
	lea esi, arr
	mov ecx, eax
	print_arr:
		mov eax, [esi]
		call WriteDec
		mWrite < " ", 0 >
		add esi, 4
	loop print_arr
	ret
output endp
input proc
	mWrite < "S = ", 0 >
	mov edx, offset s
	mov ecx, 258
	call ReadString
	mov esi, edx
	mWrite < "C = ", 0 >
	mov edx, offset chr
	mov ecx, 17
	call ReadString
	mov edi, edx
	mov sz_c, eax
	ret
input endp

.CODE
main PROC
call input
loop_main:
	add i, 1
	mov al, [esi]
	mov [esi], al
	cmp al, 0h
	je output ;if al == '\0' jump Show
	mov bl, [edi]
	mov [edi], bl
	mov ecx, sz_c
	sub ecx, 1
	cmp al, bl
	je loop_cmp ;jumps to loop_cmp if the Zero Flag is set 1 (ZF = 1)
	jne not_equal ;if al != bl jump not_equal (ZF = 0)

loop_cmp:
	add cnt, 1 ;cnt++
	;fix when size chr == 1
	mov eax, sz_c
	cmp eax, 1h
	je check ;size chr == 1
	add i, 1
	inc edi ;forward pointer [edi] by 1
	inc esi ;forward pointer [esi] by 1
	mov al, [esi]
	mov [esi], al
	mov bl, [edi]
	mov [edi], bl
	cmp al, bl
	jne break ;if al != bl jump break
loop loop_cmp; loop
	add cnt, 1 ;cnt++
	mov eax, cnt
	cmp eax, sz_c
	je check ;if sz_c == cnt jump check
	mov edi, offset chr ;set poiter to start
	inc esi ;forward pointer[esi] by 1
	jmp loop_main
not_equal:
	mov eax, cnt
	cmp eax, 0h
	jne rst ;if cnt != 0 jump rst
	mov edi, offset chr ;set poiter to start
	inc esi ;forward pointer [esi] by 1
	jmp loop_main
break:
	sub i, 1
	mov cnt, 0
	mov edi, offset chr ;set poiter to start
	jmp loop_main
check:
	lea edi, arr ;(load effective address) put arr address into EDI
	mov ecx, count
	add count, 1 ;count++
	L1:
		mov al, [edi]
		cmp al, -1
		je add_arr
		add edi, 4
	loop L1
	add_arr:
	mov eax, i
	sub eax, sz_c
	mov [edi], eax
	mov eax, [edi]
rst:
	mov cnt, 0 ;set cnt to 0
	jmp not_equal
	push 0
	call ExitProcess
main ENDP
END main
