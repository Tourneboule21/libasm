section	.data
	invalid_char db " -+", 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D
	nb_invalid equ $ - invalid_char
	white_space	db " ", 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D
	white_space_len equ $ - white_space

section	.text
	global	ft_atoi_base
	default rel

get_base_size:
	push	rbp
	mov	rbp,	rsp
	mov	rax,	0
_incr_length:
	cmp	[rdi+rax],	byte 0
	je	_return_length
	inc	rax
	jmp	_incr_length
_return_length:
	mov	rsp,	rbp
	pop	rbp
	ret

check_dupplicate_char_in_base:
	push	rbp
	mov	rbp,	rsp
	mov	rax,	0
_incr_check_char:
	cmp	[rdi+rax],	byte 0
	je	_nothing_dupplicate
	mov	rbx,	rax
	inc	rbx
_incr_cmp_char:
	cmp	byte [rdi+rbx],	byte 0
	je	_next_char
	mov	rdx,	[rdi+rbx]
	cmp	dl,	byte [rdi+rax]
	je	_find_dupplicate
_incr_jump:
	inc	rbx
	jmp	_incr_cmp_char
_next_char:
	inc	rax
	jmp	_incr_check_char

_nothing_dupplicate:
	mov	rax,	0
	mov	rsp,	rbp
	pop	rbp
	ret

_find_dupplicate:
	inc	rax
	mov	rsp,	rbp
	pop	rbp
	ret

check_forbidden_char_in_base:
	push	rbp
	mov	rbp,	rsp
	mov	rax,	0
	lea	rdx,	[invalid_char]
_go_next_char:
	mov	rbx,	0
_check_next:
	mov	cl,	byte [rdx+rbx]
	cmp	cl,	byte [rdi+rax]
	je	_find_forbidden
	inc	rbx
	cmp	rbx,	nb_invalid
	jne	_check_next
	inc	rax
	cmp	[rdi+rax],	byte 0
	jne	_go_next_char
	mov	rax,	0
	mov	rsp,	rbp
	pop	rbp
	ret
_find_forbidden:
	mov	rax,	-1
	mov	rsp,	rbp
	pop	rbp
	ret

skip_white_space:
	push	rbp
	mov	rbp,	rsp
	mov	rax,	0
	lea	rdx,	[white_space]
_get_next_char:
	mov	rbx,	0
	inc	rax
	cmp	[rdi+rax],	byte 0
	je	_no_more_white_space
_check_white_space:
	mov	cl,	byte [rdx+rbx]
	cmp	cl,	byte [rdi+rax]
	je	_get_next_char
	inc	rbx
	cmp	rbx,	white_space_len
	jne	_check_white_space
_no_more_white_space:
	add	rdi,	rax
	mov	rsp,	rbp
	pop	rbp
	ret

get_negative_sign_count:
	push	rbp
	mov	rbp,	rsp
	mov	rax,	0
	mov	rbx,	-1
_go_next_symbol:
	inc	rbx
	cmp	byte [rdi+rbx],	0
	je	_return_negative_count
	cmp	byte [rdi+rbx],	'-'
	jne	_is_not_a_sign
	inc	rax
	jmp	_go_next_symbol
_return_negative_count:
	add	rdi,	rbx
	mov	rsp,	rbp
	pop	rbp
	ret
_is_not_a_sign:
	cmp	byte [rdi+rbx],	'+'
	jne	_return_negative_count
	jmp	_go_next_symbol

ft_atoi_base:
	push	rbp
	mov	rbp,	rsp
	push	rdi
	mov	rdi,	rsi
	call	get_base_size
	cmp	rax,	2
	jl	_error
	push	rax
	call	check_dupplicate_char_in_base
	cmp	rax,	0
	jne	_error
	call	check_forbidden_char_in_base
	cmp	rax,	0
	jne	_error
	pop	rax
	pop	rdi
	push	rax
	call	skip_white_space
	pop	rax
	mov	rbx,	0
	mov	rcx,	rax
	call	get_negative_sign_count
	mov	rsp,	rbp
	pop	rbp
	ret

_error:
	mov	rax,	0
	mov	rsp,	rbp
	pop	rbp
	ret