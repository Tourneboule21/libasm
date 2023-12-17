.PHONY: clean fclean re

NAME	= ../test.out

CC	= gcc
CFLAGS	= -Wall -Wextra -g -fsanitize=address
LIB	=	../libasm.a

DEFINES	=  

HEADERS_PATH	=	../include

SRC	=	main.c

HEADERS	=	libasm.h

vpath %.c src
vpath %.h $(HEADERS_PATH)

BUILDIR	= .build
OBJS	= $(SRC:%.c=$(BUILDIR)/%.o)
DEPS	= $(SRC:%.c=$(BUILDIR)/%.d)

DEFLAGS	= $(foreach def, $(DEFINES), -D $(def))

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) -o $(NAME) $(OBJS) $(LIB)

-include $(DEPS)
$(BUILDIR)/%.o: %.c Makefile $(LIB)
	@mkdir -p $(BUILDIR)
	$(CC) -c -MMD $(CFLAGS) $(DEFLAGS) -I$(HEADERS_PATH) $< -o $@

clean:
	rm -rf $(BUILDIR)

fclean: clean
	rm -rf $(NAME)

re: fclean $(NAME)

.SECONDARY: $(OBJS)