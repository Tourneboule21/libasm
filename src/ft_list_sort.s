section	.note.GNU-stack

section	.text
	global	ft_list_sort
	default	rel

ft_list_sort:
	push	rbp
	mov	rbp,	rsp
	mov	rdx,	[rdi]	; save address of the first node
sort_loop:
	mov	rcx,	0
	push	rdi
	push	rsi
	mov	rdi,	[rdi]	; t_list** begin -> t_list* begin
	mov	rax,	rsi
	mov	rsi,	[rdi+8]	; begin->next
	mov	r8,	rdi
	mov	rdi,	[rdi]	; begin->value (value: int*)
	mov	rdi,	[rdi]	; *value
	mov	r9,	rsi
	mov	rsi,	[rsi]	; next->value (value: int*)
	mov	rsi,	[rsi]	; *value
	push	rcx
	push	r8
	push	r9
	push	rsp	; align the stack pointer by pushing 8 more byte, if not, stack pointer wont by a multiple of 16 so call printf or other c function can crash
	call	rax
	pop	rsp	; remove the top of the stack used only for alignement
	pop	r9
	pop	r8
	pop	rcx
	pop	rsi
	pop	rdi
	cmp	rax,	0
	jnz	swap_value
	mov	rsp,	rbp
	pop	rbp
	ret

swap_value:
	inc	rcx
	push	rbx
	push	r12
	mov	rbx,	[r8]
	mov	r12,	[r9]
	mov	[r8],	r12
	mov	[r9],	rbx
	pop	r12
	pop	rbx
	jmp	sort_loop

