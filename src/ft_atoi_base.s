section	.data
	white_spaces db	" ", 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x00
	forbidden_base_char db " +-", 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x00
	symbol_count db "+-", 0x00

section	.note.GNU-stack

section	.text
	global	ft_atoi_base
	;tell NASM to use RIP-relative address instead of absolute address 
	extern	ft_strlen
	default	rel

; rdi: the string where searching the char
; rsi: the char to find
; return the address of the first occurence of the char or null if is not found
_strchr:
	push	rbp
	mov	rbp,	rsp
	mov	rdx,	-1
	mov	rax,	0
strchr_loop:
	inc	rdx
	cmp	byte [rdi+rdx], byte 0
	je	strchr_return
	cmp	byte [rdi+rdx],	sil
	jne	strchr_loop
	lea	rax,	[rdi+rdx]
strchr_return:
	mov	rsp,	rbp
	pop	rbp
	ret

; rdi: the string to check
; return 0 if there is no dupplicate char in the string
_check_dupplicate:
	push	rbp
	mov	rbp,	rsp
	mov	rax,	0
check_dupplicate_loop:
	cmp	[rdi],	byte 0
	je	check_dupplicate_return
	mov	sil,	byte [rdi]
	inc	rdi
	call	_strchr
	cmp	rax,	0
	je	check_dupplicate_loop
check_dupplicate_return:
	mov	rsp,	rbp
	pop	rbp
	ret

; rdi: the base to check
; return 0 if no forbidden char found in base
_check_forbidden_char:
	push	rbp
	mov	rbp,	rsp
	mov	rcx,	-1
check_forbidden_loop:
	inc	rcx
	mov	sil,	byte [rdi+rcx]
	cmp	sil,	0
	je	check_forbidden_return
	push	rdi
	lea	rdi,	forbidden_base_char
	call	_strchr
	pop	rdi
	cmp	rax,	0
	je	check_forbidden_loop
check_forbidden_return:
	mov	rsp,	rbp
	pop	rbp
	ret

; rdi: the base to check
; return 0 if the base is correct and anything else if not
_check_base:
	push	rbp
	mov	rbp,	rsp
	call	ft_strlen
	inc	rax
	cmp	rax,	3
	jb	check_base_return
	call	_check_forbidden_char
	cmp	rax,	0
	jne	check_base_return
	push	rdi
	call	_check_dupplicate
	pop	rdi
check_base_return:
	mov	rsp,	rbp
	pop	rbp
	ret

; rdi: the string where you want to count
; return the number of minus symbol in rdi
_count_minus_symbol:
	push	rbp
	mov	rbp,	rsp
	mov	sil,	'-'
	mov	rcx,	-1
	mov	rdx,	-1
count_minus_symbol_loop_inc:
	inc	rdx
count_minus_symbol_loop:
	inc	rcx
	cmp	byte [rdi+rcx],	0
	je	count_minus_symbol_return
	;;; stop searching if the current sign is not + or -
	push	rdi
	push	rsi
	push	rdx
	mov	sil,	byte [rdi+rcx]
	lea	rdi,	symbol_count
	call	_strchr
	pop	rdx
	pop	rsi
	pop	rdi
	cmp	rax,	0
	je	count_minus_symbol_return
	;;;
	cmp	byte [rdi+rcx], sil
	jne	count_minus_symbol_loop
	jmp	count_minus_symbol_loop_inc
count_minus_symbol_return:
	lea	rdi,	[rdi+rcx]
	mov	rax,	rdx
	mov	rsp,	rbp
	pop	rbp
	ret

; rdi: the char you want to get index in rsi base
; rsi: the base for check
; return the index of rdi in rsi or -1 if not in base
_get_index_in_base:
	push	rbp
	mov	rbp,	rsp
	mov	rax,	-1
get_index_in_base_loop:
	inc	rax
	cmp	byte [rsi+rax],	dil
	je	get_index_in_base_return
	cmp	byte [rsi+rax],	0
	jne	get_index_in_base_loop
	mov	rax,	-1
get_index_in_base_return:
	mov	rsp,	rbp
	pop	rbp
	ret	

; rdi: the string representation a the number to convert
; rsi: the base of the number to convert
; return the value in base 10 of rdi
_calculate_from_base:
	push	rbp
	mov	rbp,	rsp
	lea	rcx,	[rdi]
	lea	rdi,	[rsi]
	call	ft_strlen
	mov	r8,	-1
	mov	rdx,	rax
	mov	r9,	0
calculate_from_base_loop:
	inc	r8
	cmp	byte [rcx+r8],	0
	je	calculate_from_base_return
	mov	rdi,	[rcx+r8]
	call	_get_index_in_base
	cmp	rax,	-1
	je	calculate_from_base_return
	push	rax
	push	rdx
	mov	rax,	rdx
	mul	r9
	mov	r9,	rax
	pop	rdx
	pop	rax
	; inc	rax
	add	r9,	rax
	jmp	calculate_from_base_loop
calculate_from_base_return:
	mov	rax,	r9
	mov	rsp,	rbp
	pop	rbp
	ret

ft_atoi_base:
	push	rbp
	mov	rbp,	rsp
	push	rsi
	push	rdi
	mov	rdi,	rsi
	call	_check_base
	cmp	rax,	0
	jne	base_error
	pop	rdi
	call	_count_minus_symbol
	pop	rsi
	push	rbx
	; minus number in rbx
	mov	rbx,	rax
	call	_calculate_from_base
	push	rax
	mov	rax,	rbx
	mov	rdx,	0
	mov	rcx,	2
	div	rcx
	cmp	rdx,	0
	jne	retur_negative
	pop	rax
	pop	rbx
	mov	rsp,	rbp
	pop	rbp
	ret

retur_negative:
	pop	rax
	neg	rax
	pop	rbx
	mov	rsp,	rbp
	pop	rbp
	ret

base_error:
	mov	rax,	0
	mov	rsp,	rbp
	pop	rbp
	ret