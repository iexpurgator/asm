INCLUDE Irvine32.inc
INCLUDE Macros.inc

.DATA
	a BYTE 21 DUP(?)
	b BYTE 21 DUP(?)
	apb BYTE 22 DUP(?)

.CODE
main PROC
	mWrite < "Nhap a: ", 0 >
	mov edx, offset a
	mov ecx, 21
	CALL ReadString
	mov ebx, eax
	add edx, eax
	dec edx
	push edx
	mWrite < "Nhap b: ", 0 >
	mov edx, offset b
	mov ecx, 21
	CALL ReadString
	add edx, eax
	dec edx
	push edx
; compare length number && set esi is big number, edi is small number
; after read edx = offset b
	cmp eax, ebx
	jl a_big_than_b	;a > b
	pop esi
	pop edi
	jmp assigned_value
	a_big_than_b:
	pop edi
	pop esi
assigned_value:
	mov edx, offset apb
	mov eax, 0		; set the carry value = 0
	push eax		; save the carry value
	mov eax, 0
	mov ebx, 0
sum_two_num:
	mov al, [edi]
	mov bl, [esi]
	cmp al, 0h
	je finish_small_num
	sub al, 30h		; char to int
	sub bl,	30h		; char to int
	add bl, al
	pop eax			; get the carry value
	add bl, al
	cmp bl, 09h		; compare sum with 9
	jg over1		; if sum > 9 jump to over1
	mov eax, 0h		; else set carry value = 0
	push eax		; save the carry value
	add_continue:	; after process sum
	add bl, 30h
	mov [edx], bl	; move sum to string answer
	inc edx
	dec edi
	dec esi
	jmp sum_two_num
over1:			; when sum > 9
	sub bl, 0ah	; sum = sum - 10
	mov eax, 1h	; set carry value = 1
	push eax	; save carry value
	jmp add_continue
finish_small_num:	; same sum_two_num
	mov bl, [esi]
	cmp bl, 0h
	je finish_apb
	sub bl, 30h
	pop eax
	add bl, al
	cmp bl, 09h
	jg over2
	mov eax, 0h
	push eax
	add_continue2:
	add bl, 30h
	mov [edx], bl
	inc edx
	dec esi
	jmp finish_small_num
over2:			; same over1
	sub bl, 0ah
	mov eax, 1h
	push eax
	jmp add_continue2
finish_apb:
; check over length big num
; same over1 and over2
	pop eax
	cmp al, 0h
	je is_zero
	add al, 30h
	mov [edx], al
	mov eax, 0h
	is_zero:
; reverse string
	mov edx, offset apb
	call StrLength
	mov esi, edx	; esi points to start
	add edx, eax	; after ReadString return eax is StringLength
	dec edx			; edi points to end
reverse:
	cmp esi, edx	; compare esi with edi
	jge end_reverse ; if esi >= edx then jump to print
	mov bl, [esi]
	mov al, [edx]
	mov [esi], al
	mov [edx], bl
	inc esi	; update forward pointer by 1
	dec edx	; update backward pointer by 1
	jmp reverse
end_reverse:
	mWrite < "a + b = ", 0 >
	mov edx, offset apb
	call writeString
	push 0
	call ExitProcess
main ENDP
END main
