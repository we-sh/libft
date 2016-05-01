# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: anouvel <adrien.nouvel@outlook.com>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/04/30 19:03:39 by anouvel           #+#    #+#              #
#    Updated: 2016/05/01 16:26:00 by anouvel          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# ---------------------------------------------------------------------------- #
# PROJECT DATA
# ---------------------------------------------------------------------------- #

NAME		=	libft.a

# ---------------------------------------------------------------------------- #

SRCS		=	ft_get_/get_next_line.c	\
				ft_ito_/ft_itoa.c		\
				ft_lst_/ft_lstnew.c		\
				ft_lst_/ft_lstdelone.c	\
				ft_lst_/ft_lstdel.c		\
				ft_lst_/ft_lstadd.c		\
				ft_lst_/ft_lstiter.c	\
				ft_lst_/ft_lstmap.c		\
				ft_mem_/ft_memalloc.c	\
				ft_mem_/ft_memdel.c		\
				ft_put_/ft_putchar.c	\
				ft_put_/ft_putchar_fd.c	\
				ft_put_/ft_putstr.c		\
				ft_put_/ft_putstr_fd.c	\
				ft_put_/ft_putnbr.c		\
				ft_put_/ft_putnbr_fd.c	\
				ft_put_/ft_putendl.c	\
				ft_put_/ft_putendl_fd.c	\
				ft_str_/ft_strnew.c		\
				ft_str_/ft_strdel.c		\
				ft_str_/ft_strclr.c		\
				ft_str_/ft_striter.c	\
				ft_str_/ft_striteri.c	\
				ft_str_/ft_strmap.c		\
				ft_str_/ft_strmapi.c	\
				ft_str_/ft_strequ.c		\
				ft_str_/ft_strnequ.c	\
				ft_str_/ft_strsub.c		\
				ft_str_/ft_strjoin.c	\
				ft_str_/ft_strser.c		\
				ft_str_/ft_strtrim.c	\
				ft_str_/ft_strsplit.c	\
				recodes/ft_memset.c		\
				recodes/ft_bzero.c		\
				recodes/ft_memcpy.c		\
				recodes/ft_memccpy.c	\
				recodes/ft_memmove.c	\
				recodes/ft_memchr.c		\
				recodes/ft_memcmp.c		\
				recodes/ft_strlen.c		\
				recodes/ft_strdup.c		\
				recodes/ft_strcpy.c		\
				recodes/ft_strncpy.c	\
				recodes/ft_strcat.c		\
				recodes/ft_strncat.c	\
				recodes/ft_strlcat.c	\
				recodes/ft_strchr.c		\
				recodes/ft_strrchr.c	\
				recodes/ft_strstr.c		\
				recodes/ft_strnstr.c	\
				recodes/ft_strcmp.c		\
				recodes/ft_strncmp.c	\
				recodes/ft_atoi.c		\
				recodes/ft_isalpha.c	\
				recodes/ft_isdigit.c	\
				recodes/ft_isalnum.c	\
				recodes/ft_isascii.c	\
				recodes/ft_isprint.c	\
				recodes/ft_toupper.c	\
				recodes/ft_tolower.c	\

# ---------------------------------------------------------------------------- #
# PROJECT CONFIGURATION
# ---------------------------------------------------------------------------- #

CFLAGS		=	\
				-g 								\
				-Wall -Wextra -Werror			\

# >>> REQUIRED FOR LIBRARIES >>> THINK ABOUT CHANGING THE *LIBS rules

CPPFLAGS	=	\
				-I $(DIRINC)					\

LDFLAGS		=	\

LDLIBS		=	\

# GLOBAL SETUP
AR			=	ar
CC			=	clang
RM			=	rm
MKDIR		=	mkdir
MAKE		=	make

DIRSRC		=	./srcs/
DIROBJ		=	./.objs/
DIRINC		=	./incs/
DIRLIB		=	./libs/

# EXTRA COLOR
C_DFL		=	\033[0m
C_GRA		=	\033[30m
C_RED		=	\033[31m
C_GRE		=	\033[32m
C_YEL		=	\033[33m
C_BLUE		=	\033[34m
C_MAG		=	\033[35m
C_CYA		=	\033[36m
C_WHI		=	\033[37m

# ============================================================================ #

# ---------------------------------------------------------------------------- #
# SOURCES NORMALIZATION
# ---------------------------------------------------------------------------- #

SRC			=	$(addprefix $(DIRSRC), $(SRCS))
OBJ			=	$(addprefix $(DIROBJ), $(notdir $(SRC:.c=.o)))

# ---------------------------------------------------------------------------- #
# RULES
# ---------------------------------------------------------------------------- #

all			:	libs $(NAME)
	@printf "$(C_GRE)[ $(NAME) ] [ %-6s ]$(C_DFL) build completed\n" "$(MAKE)"

$(NAME)		:	$(DIROBJ) $(OBJ)
	@printf "$(C_GRE)[ $(NAME) ] [ %-6s ]$(C_DFL) linking objects\n" "$(CC)"
	@$(AR) rc $(NAME) $(OBJ)
	@printf "$(C_GRE)[ $(NAME) ] [ %-6s ]$(C_DFL) index project\n" "ranlib"
	@ranlib $(NAME)

# ---------------------------------------------------------------------------- #
# CUSTOMISABLE RULES

libs		:

fcleanlibs	:

# ---------------------------------------------------------------------------- #

clean		:
	@printf "$(C_GRE)[ $(NAME) ] [ %-6s ]$(C_DFL) remove objects\n" "$(RM)"
	@$(RM) -rf $(DIROBJ)

fclean		:	fcleanlibs clean
	@printf "$(C_GRE)[ $(NAME) ] [ %-6s ]$(C_DFL) remove binaries\n" "$(RM)"
	@$(RM) -f $(NAME)

re			:	fclean all

$(DIROBJ)	:
	@$(MKDIR) -p $(DIROBJ)

depend		:
	@sed -e '/^#start/,/^end/d' Makefile > .mftmp && mv .mftmp Makefile
	@printf "#start\n\n" >> Makefile
	@$(foreach s, $(SRC),													\
		printf '$$(DIROBJ)'										>> Makefile	&& \
		$(CC) -MM $(s) $(CPPFLAGS)								>> Makefile	&& \
																			\
		printf '\t\t@printf "$$(C_GRE)[ $(NAME) ] '				>> Makefile && \
		printf '[ %%-6s ]$$(C_DFL) " "$(CC)"\n'					>> Makefile && \
		printf '\t\t@printf "compiling $(s)\\n"\n'				>> Makefile	&& \
																			\
		printf '\t\t@$$(CC) -c $(s) -o '						>> Makefile	&& \
		printf '$(addprefix $(DIROBJ), $(notdir $(s:.c=.o))) '	>> Makefile	&& \
		printf '$$(CPPFLAGS) $$(CFLAGS) \n\n'					>> Makefile	&& \
																			\
		printf "$(C_GRE)[ $(NAME) ] [ %-6s ]$(C_DFL) " "dep"				&& \
		printf "$(s) rule generated\n"										|| \
																			\
		(sed -e '/^#start/,$$d' Makefile > .mftmp && mv .mftmp Makefile		&& \
		printf "#start\n\n"										>> Makefile	&& \
		printf "$(C_RED)[ $(NAME) ] [ %-6s ]$(C_DFL) " "dep"				&& \
		printf "$(s) rule generation failed\n"								) \
	;)
	@printf "\n#end\n" >> Makefile

.PHONY	:	 libs

# ---------------------------------------------------------------------------- #
# AUTO-GENERATED SECTION - do not modify
# ---------------------------------------------------------------------------- #

#start

$(DIROBJ)get_next_line.o: srcs/ft_get_/get_next_line.c incs/get_next_line.h \
  incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/ft_get_/get_next_line.c\n"
		@$(CC) -c ./srcs/ft_get_/get_next_line.c -o ./.objs/get_next_line.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_itoa.o: srcs/ft_ito_/ft_itoa.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/ft_ito_/ft_itoa.c\n"
		@$(CC) -c ./srcs/ft_ito_/ft_itoa.c -o ./.objs/ft_itoa.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_lstnew.o: srcs/ft_lst_/ft_lstnew.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/ft_lst_/ft_lstnew.c\n"
		@$(CC) -c ./srcs/ft_lst_/ft_lstnew.c -o ./.objs/ft_lstnew.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_lstdelone.o: srcs/ft_lst_/ft_lstdelone.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/ft_lst_/ft_lstdelone.c\n"
		@$(CC) -c ./srcs/ft_lst_/ft_lstdelone.c -o ./.objs/ft_lstdelone.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_lstdel.o: srcs/ft_lst_/ft_lstdel.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/ft_lst_/ft_lstdel.c\n"
		@$(CC) -c ./srcs/ft_lst_/ft_lstdel.c -o ./.objs/ft_lstdel.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_lstadd.o: srcs/ft_lst_/ft_lstadd.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/ft_lst_/ft_lstadd.c\n"
		@$(CC) -c ./srcs/ft_lst_/ft_lstadd.c -o ./.objs/ft_lstadd.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_lstiter.o: srcs/ft_lst_/ft_lstiter.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/ft_lst_/ft_lstiter.c\n"
		@$(CC) -c ./srcs/ft_lst_/ft_lstiter.c -o ./.objs/ft_lstiter.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_lstmap.o: srcs/ft_lst_/ft_lstmap.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/ft_lst_/ft_lstmap.c\n"
		@$(CC) -c ./srcs/ft_lst_/ft_lstmap.c -o ./.objs/ft_lstmap.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_memalloc.o: srcs/ft_mem_/ft_memalloc.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/ft_mem_/ft_memalloc.c\n"
		@$(CC) -c ./srcs/ft_mem_/ft_memalloc.c -o ./.objs/ft_memalloc.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_memdel.o: srcs/ft_mem_/ft_memdel.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/ft_mem_/ft_memdel.c\n"
		@$(CC) -c ./srcs/ft_mem_/ft_memdel.c -o ./.objs/ft_memdel.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_putchar.o: srcs/ft_put_/ft_putchar.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/ft_put_/ft_putchar.c\n"
		@$(CC) -c ./srcs/ft_put_/ft_putchar.c -o ./.objs/ft_putchar.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_putchar_fd.o: srcs/ft_put_/ft_putchar_fd.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/ft_put_/ft_putchar_fd.c\n"
		@$(CC) -c ./srcs/ft_put_/ft_putchar_fd.c -o ./.objs/ft_putchar_fd.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_putstr.o: srcs/ft_put_/ft_putstr.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/ft_put_/ft_putstr.c\n"
		@$(CC) -c ./srcs/ft_put_/ft_putstr.c -o ./.objs/ft_putstr.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_putstr_fd.o: srcs/ft_put_/ft_putstr_fd.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/ft_put_/ft_putstr_fd.c\n"
		@$(CC) -c ./srcs/ft_put_/ft_putstr_fd.c -o ./.objs/ft_putstr_fd.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_putnbr.o: srcs/ft_put_/ft_putnbr.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/ft_put_/ft_putnbr.c\n"
		@$(CC) -c ./srcs/ft_put_/ft_putnbr.c -o ./.objs/ft_putnbr.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_putnbr_fd.o: srcs/ft_put_/ft_putnbr_fd.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/ft_put_/ft_putnbr_fd.c\n"
		@$(CC) -c ./srcs/ft_put_/ft_putnbr_fd.c -o ./.objs/ft_putnbr_fd.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_putendl.o: srcs/ft_put_/ft_putendl.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/ft_put_/ft_putendl.c\n"
		@$(CC) -c ./srcs/ft_put_/ft_putendl.c -o ./.objs/ft_putendl.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_putendl_fd.o: srcs/ft_put_/ft_putendl_fd.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/ft_put_/ft_putendl_fd.c\n"
		@$(CC) -c ./srcs/ft_put_/ft_putendl_fd.c -o ./.objs/ft_putendl_fd.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_strnew.o: srcs/ft_str_/ft_strnew.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/ft_str_/ft_strnew.c\n"
		@$(CC) -c ./srcs/ft_str_/ft_strnew.c -o ./.objs/ft_strnew.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_strdel.o: srcs/ft_str_/ft_strdel.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/ft_str_/ft_strdel.c\n"
		@$(CC) -c ./srcs/ft_str_/ft_strdel.c -o ./.objs/ft_strdel.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_strclr.o: srcs/ft_str_/ft_strclr.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/ft_str_/ft_strclr.c\n"
		@$(CC) -c ./srcs/ft_str_/ft_strclr.c -o ./.objs/ft_strclr.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_striter.o: srcs/ft_str_/ft_striter.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/ft_str_/ft_striter.c\n"
		@$(CC) -c ./srcs/ft_str_/ft_striter.c -o ./.objs/ft_striter.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_striteri.o: srcs/ft_str_/ft_striteri.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/ft_str_/ft_striteri.c\n"
		@$(CC) -c ./srcs/ft_str_/ft_striteri.c -o ./.objs/ft_striteri.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_strmap.o: srcs/ft_str_/ft_strmap.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/ft_str_/ft_strmap.c\n"
		@$(CC) -c ./srcs/ft_str_/ft_strmap.c -o ./.objs/ft_strmap.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_strmapi.o: srcs/ft_str_/ft_strmapi.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/ft_str_/ft_strmapi.c\n"
		@$(CC) -c ./srcs/ft_str_/ft_strmapi.c -o ./.objs/ft_strmapi.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_strequ.o: srcs/ft_str_/ft_strequ.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/ft_str_/ft_strequ.c\n"
		@$(CC) -c ./srcs/ft_str_/ft_strequ.c -o ./.objs/ft_strequ.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_strnequ.o: srcs/ft_str_/ft_strnequ.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/ft_str_/ft_strnequ.c\n"
		@$(CC) -c ./srcs/ft_str_/ft_strnequ.c -o ./.objs/ft_strnequ.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_strsub.o: srcs/ft_str_/ft_strsub.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/ft_str_/ft_strsub.c\n"
		@$(CC) -c ./srcs/ft_str_/ft_strsub.c -o ./.objs/ft_strsub.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_strjoin.o: srcs/ft_str_/ft_strjoin.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/ft_str_/ft_strjoin.c\n"
		@$(CC) -c ./srcs/ft_str_/ft_strjoin.c -o ./.objs/ft_strjoin.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_strser.o: srcs/ft_str_/ft_strser.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/ft_str_/ft_strser.c\n"
		@$(CC) -c ./srcs/ft_str_/ft_strser.c -o ./.objs/ft_strser.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_strtrim.o: srcs/ft_str_/ft_strtrim.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/ft_str_/ft_strtrim.c\n"
		@$(CC) -c ./srcs/ft_str_/ft_strtrim.c -o ./.objs/ft_strtrim.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_strsplit.o: srcs/ft_str_/ft_strsplit.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/ft_str_/ft_strsplit.c\n"
		@$(CC) -c ./srcs/ft_str_/ft_strsplit.c -o ./.objs/ft_strsplit.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_memset.o: srcs/recodes/ft_memset.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/recodes/ft_memset.c\n"
		@$(CC) -c ./srcs/recodes/ft_memset.c -o ./.objs/ft_memset.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_bzero.o: srcs/recodes/ft_bzero.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/recodes/ft_bzero.c\n"
		@$(CC) -c ./srcs/recodes/ft_bzero.c -o ./.objs/ft_bzero.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_memcpy.o: srcs/recodes/ft_memcpy.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/recodes/ft_memcpy.c\n"
		@$(CC) -c ./srcs/recodes/ft_memcpy.c -o ./.objs/ft_memcpy.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_memccpy.o: srcs/recodes/ft_memccpy.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/recodes/ft_memccpy.c\n"
		@$(CC) -c ./srcs/recodes/ft_memccpy.c -o ./.objs/ft_memccpy.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_memmove.o: srcs/recodes/ft_memmove.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/recodes/ft_memmove.c\n"
		@$(CC) -c ./srcs/recodes/ft_memmove.c -o ./.objs/ft_memmove.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_memchr.o: srcs/recodes/ft_memchr.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/recodes/ft_memchr.c\n"
		@$(CC) -c ./srcs/recodes/ft_memchr.c -o ./.objs/ft_memchr.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_memcmp.o: srcs/recodes/ft_memcmp.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/recodes/ft_memcmp.c\n"
		@$(CC) -c ./srcs/recodes/ft_memcmp.c -o ./.objs/ft_memcmp.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_strlen.o: srcs/recodes/ft_strlen.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/recodes/ft_strlen.c\n"
		@$(CC) -c ./srcs/recodes/ft_strlen.c -o ./.objs/ft_strlen.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_strdup.o: srcs/recodes/ft_strdup.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/recodes/ft_strdup.c\n"
		@$(CC) -c ./srcs/recodes/ft_strdup.c -o ./.objs/ft_strdup.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_strcpy.o: srcs/recodes/ft_strcpy.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/recodes/ft_strcpy.c\n"
		@$(CC) -c ./srcs/recodes/ft_strcpy.c -o ./.objs/ft_strcpy.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_strncpy.o: srcs/recodes/ft_strncpy.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/recodes/ft_strncpy.c\n"
		@$(CC) -c ./srcs/recodes/ft_strncpy.c -o ./.objs/ft_strncpy.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_strcat.o: srcs/recodes/ft_strcat.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/recodes/ft_strcat.c\n"
		@$(CC) -c ./srcs/recodes/ft_strcat.c -o ./.objs/ft_strcat.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_strncat.o: srcs/recodes/ft_strncat.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/recodes/ft_strncat.c\n"
		@$(CC) -c ./srcs/recodes/ft_strncat.c -o ./.objs/ft_strncat.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_strlcat.o: srcs/recodes/ft_strlcat.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/recodes/ft_strlcat.c\n"
		@$(CC) -c ./srcs/recodes/ft_strlcat.c -o ./.objs/ft_strlcat.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_strchr.o: srcs/recodes/ft_strchr.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/recodes/ft_strchr.c\n"
		@$(CC) -c ./srcs/recodes/ft_strchr.c -o ./.objs/ft_strchr.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_strrchr.o: srcs/recodes/ft_strrchr.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/recodes/ft_strrchr.c\n"
		@$(CC) -c ./srcs/recodes/ft_strrchr.c -o ./.objs/ft_strrchr.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_strstr.o: srcs/recodes/ft_strstr.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/recodes/ft_strstr.c\n"
		@$(CC) -c ./srcs/recodes/ft_strstr.c -o ./.objs/ft_strstr.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_strnstr.o: srcs/recodes/ft_strnstr.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/recodes/ft_strnstr.c\n"
		@$(CC) -c ./srcs/recodes/ft_strnstr.c -o ./.objs/ft_strnstr.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_strcmp.o: srcs/recodes/ft_strcmp.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/recodes/ft_strcmp.c\n"
		@$(CC) -c ./srcs/recodes/ft_strcmp.c -o ./.objs/ft_strcmp.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_strncmp.o: srcs/recodes/ft_strncmp.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/recodes/ft_strncmp.c\n"
		@$(CC) -c ./srcs/recodes/ft_strncmp.c -o ./.objs/ft_strncmp.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_atoi.o: srcs/recodes/ft_atoi.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/recodes/ft_atoi.c\n"
		@$(CC) -c ./srcs/recodes/ft_atoi.c -o ./.objs/ft_atoi.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_isalpha.o: srcs/recodes/ft_isalpha.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/recodes/ft_isalpha.c\n"
		@$(CC) -c ./srcs/recodes/ft_isalpha.c -o ./.objs/ft_isalpha.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_isdigit.o: srcs/recodes/ft_isdigit.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/recodes/ft_isdigit.c\n"
		@$(CC) -c ./srcs/recodes/ft_isdigit.c -o ./.objs/ft_isdigit.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_isalnum.o: srcs/recodes/ft_isalnum.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/recodes/ft_isalnum.c\n"
		@$(CC) -c ./srcs/recodes/ft_isalnum.c -o ./.objs/ft_isalnum.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_isascii.o: srcs/recodes/ft_isascii.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/recodes/ft_isascii.c\n"
		@$(CC) -c ./srcs/recodes/ft_isascii.c -o ./.objs/ft_isascii.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_isprint.o: srcs/recodes/ft_isprint.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/recodes/ft_isprint.c\n"
		@$(CC) -c ./srcs/recodes/ft_isprint.c -o ./.objs/ft_isprint.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_toupper.o: srcs/recodes/ft_toupper.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/recodes/ft_toupper.c\n"
		@$(CC) -c ./srcs/recodes/ft_toupper.c -o ./.objs/ft_toupper.o $(CPPFLAGS) $(CFLAGS) 

$(DIROBJ)ft_tolower.o: srcs/recodes/ft_tolower.c incs/libft.h
		@printf "$(C_GRE)[ libft.a ] [ %-6s ]$(C_DFL) " "clang"
		@printf "compiling ./srcs/recodes/ft_tolower.c\n"
		@$(CC) -c ./srcs/recodes/ft_tolower.c -o ./.objs/ft_tolower.o $(CPPFLAGS) $(CFLAGS) 


#end