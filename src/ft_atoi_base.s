section	.data
	invalid_char db " -+", 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D
	nb_invalid equ $ - invalid_char

section	.text
	global	ft_atoi_base

_get_base_size:
	push	rbp
	mov	rbp,	rsp
	mov	rax,	0
incr_length:
	cmp	[rdi+rax],	byte 0
	je	return_length
	inc	rax
	jmp	incr_length
return_length:
	mov	rsp,	rbp
	pop	rbp
	ret

_check_forbidden_char_in_base:
	push	rbp
	mov	rbp,	rsp
	mov	rax,	0
incr_check_char:
	cmp	[rdi+rax],	byte 0
	je	nothing_forbidden
	mov	rbx,	rax
	inc	rbx
incr_cmp_char:
	cmp	byte [rdi+rbx],	byte 0
	je	next_char
	mov	rdx,	[rdi+rbx]
	cmp	dl,	byte [rdi+rax]
	je	find_forbidden
incr_jump:
	inc	rbx
	jmp	incr_cmp_char
next_char:
	inc	rax
	jmp	incr_check_char

nothing_forbidden:
	mov	rax,	0
	mov	rsp,	rbp
	pop	rbp
	ret

find_forbidden:
	inc	rax
	mov	rsp,	rbp
	pop	rbp
	ret

ft_atoi_base:
	push	rbp
	mov	rbp,	rsp
	mov	rdi,	rsi
	call	_get_base_size
	cmp	rax,	2
	jl	error
	push	rax
	call	_check_forbidden_char_in_base
	cmp	rax,	0
	jne	error
	pop	rax
	mov	rsp,	rbp
	pop	rbp
	ret

error:
	mov	rax,	0
	mov	rsp,	rbp
	pop	rbp
	ret