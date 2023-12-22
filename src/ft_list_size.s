section	.note.GNU-stack

section	.text
	global	ft_list_size
	default	rel

ft_list_size:
	push	rbp
	mov	rbp,	rsp
	mov	rax,	0
list_size_loop:
	cmp	rdi,	0
	je	return
	inc	rax
	mov	rdi,	[rdi+8]
	jmp	list_size_loop
return:
	mov	rsp,	rbp
	pop	rbp
	ret