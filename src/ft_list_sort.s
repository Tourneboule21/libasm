section	.note.GNU-stack

section	.text
	global	ft_list_sort
	default	rel

ft_list_sort:
	push	rbp
	mov	rbp,	rsp
	mov	rsp,	rbp
	pop	rbp
	ret