.PHONY: clean fclean re test test_fclean

NAME	= libasm.a

CC	=	nasm

LIB	=	ar rcs

SRC	=	ft_write.s \
		ft_read.s

TARGET	=	elf64

TEST_DIR	=	test

vpath %.s src

BUILDIR	= .build
OBJS	= $(SRC:%.s=$(BUILDIR)/%.o)

$(NAME): $(OBJS)
	$(LIB) $(NAME) $(OBJS)

$(BUILDIR)/%.o: %.s Makefile
	@mkdir -p $(BUILDIR)
	$(CC) -f $(TARGET) $< -o $@

clean:
	rm -rf $(BUILDIR)
	make clean -C $(TEST_DIR)

fclean: clean
	rm -rf $(NAME)
	make fclean -C $(TEST_DIR)

re: fclean $(NAME)

test:
	make -C $(TEST_DIR)

.SECONDARY: $(OBJS)