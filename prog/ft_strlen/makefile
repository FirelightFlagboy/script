# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbenneto <f.benneto@student.42.fr>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/01/27 13:38:57 by fbenneto          #+#    #+#              #
#    Updated: 2018/01/27 13:59:52 by fbenneto         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#############
# Prog Name #
#############

NAME = strlen_bench

######
# CC #
######

CC = gcc
CFLAGS = -Wall -Werror -Wextra

###########
# Include #
###########

INC_DIR		= ./

INC_NAME	=\
	ft_strlen.h

INCLUDE		= $(addprefix $(INC_DIR), $(INC_NAME))
INC			= $(addprefix "-I", $(INCLUDE))

#######
# Src #
#######

SRC_DIR		= ./

SRC_NAME	=\
	ft_strlen.c\
	benchmark.c\
	main.c\
	strlen_nocom.c\
	strlen.c\

SRC			= $(addprefix $(SRC_DIR), $(SRC_NAME))

#######
# Obj #
#######

OBJ_DIR		= ./bin/
OBJ_NAME	= $(SRC_NAME:.c=.o)
OBJ			= $(addprefix $(OBJ_DIR),$(OBJ_NAME))

########
# Rule #
########

all : $(NAME)

$(NAME) : $(OBJ_DIR) $(OBJ)
	@printf "[$(NAME): $@] make binary"
	@$(CC) $(CFLAGS) -o $@ $(OBJ)

$(OBJ_DIR) :
	@printf "[$(NAME): $@] make obj"
	@mkdir -p $@

$(OBJ_DIR)%.o : $(SRC_DIR)%.c $(INCLUDE)
	@$(CC) $(CFLAGS) -o $@ -c $< $(INC)

clean : $(OBJ_DIR)
	@printf "[$(NAME): $@] clean obj file"
	@rm -rf $<

fclean : clean
	@printf "[$(NAME): $@] clean binary file"
	@rm -f $(NAME)

proper :
	@make -C ./ all
	@make -C ./ clean

re :
	@make -C ./ fclean
	@make -C ./ all

.PHONY: all re fclean clean proper
