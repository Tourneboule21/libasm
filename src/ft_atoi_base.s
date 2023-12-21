section	.data
	white_spaces db	" ", 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x00
	forbidden_base_char db " +-", 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x00

section	.text
	global	ft_atoi_base
	;tell NASM to use RIP-relative address instead of absolute address 
	default	rel
	extern	ft_strlen

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

ft_atoi_base:
	push	rbp
	mov	rbp,	rsp
	mov	rdi,	rsi
	call	_check_base
	mov	rsp,	rbp
	pop	rbp
	ret