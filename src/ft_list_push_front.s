section	.note.GNU-stack

section	.text
	global	ft_list_push_front
	default	rel
	extern	malloc

ft_list_push_front:
	push	rbp
	mov	rbp,	rsp
	mov	rcx,	[rdi]
	lea	r8,	[rdi]
	mov	rdi,	16
	push	rcx
	push	rsi
	push	r8
	call	malloc wrt ..plt
	cmp	rax,	0
	je	return
	pop	r8
	pop	rsi
	pop	rcx
	mov	[rax],	rsi
	mov	[rax+8],	rcx
	mov	[r8],	rax
return:
	mov	rsp,	rbp
	pop	rbp
	ret