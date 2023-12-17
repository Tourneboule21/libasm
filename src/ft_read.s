global	ft_read
extern	__errno_location

ft_read:
	push	rbp
	mov	rbp,	rsp
	mov	rax,	0
	syscall
	cmp	rax,	0
	jge	no_error
	mov	rbx,	rax
	xor	rbx,	0xffffffffffffffff
	inc	rbx
	call	__errno_location wrt ..plt
	mov	[rax],	rbx
	mov	rax,	-1
no_error:
	mov	rsp,	rbp
	pop	rbp
	ret