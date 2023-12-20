.PHONY: clean fclean re test test_fclean all

NAME	= libasm.a

DBFLAGS	= -g

CC	=	nasm

LIB	=	ar rcs

SRC	=	ft_strcpy.s \
		ft_strlen.s \
		ft_write.s \
		ft_read.s \
		ft_strcmp.s \
		ft_strdup.s \
		ft_atoi_base.s

TARGET	=	elf64

TEST_DIR	=	test

vpath %.s src

BUILDIR	= .build
OBJS	= $(SRC:%.s=$(BUILDIR)/%.o)

$(NAME): $(OBJS)
	$(LIB) $(NAME) $(OBJS)

$(BUILDIR)/%.o: %.s Makefile
	@mkdir -p $(BUILDIR)
	$(CC) $(DBFLAGS) -f $(TARGET) $< -o $@

clean:
	rm -rf $(BUILDIR)
	make clean -C $(TEST_DIR)

fclean: clean
	rm -rf $(NAME)
	make fclean -C $(TEST_DIR)

re: fclean $(NAME)

all: $(NAME) test

test:
	make -C $(TEST_DIR)

.SECONDARY: $(OBJS)