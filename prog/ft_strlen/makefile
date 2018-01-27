# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbenneto <f.benneto@student.42.fr>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/01/27 13:38:57 by fbenneto          #+#    #+#              #
#    Updated: 2018/01/27 14:32:22 by fbenneto         ###   ########.fr        #
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
INC			= -I$(INC_DIR)

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


#########
# MACRO #
#########

NC		= "\\033[0m"
RED		= "\\033[31m"
GREEN	= "\\033[32m"
YELLOW	= "\\033[33m"
BLUE	= "\\033[34m"
MAJENTA	= "\\033[35m"
CYAN	= "\\033[36m"
BOLD	= "\\033[1m"
CHEK	= "✓"
OK		= "$(GREEN)$(CHEK)$(NC)"

########
# Rule #
########

all : $(NAME)

$(NAME) : $(OBJ_DIR) $(OBJ)
	@printf "[$(NAME): $@] make $(CYAN)binary$(NC)"
	@$(CC) $(CFLAGS) -o $@ $(OBJ)
	@printf "\t$(OK)\n"

$(OBJ_DIR) :
	@printf "[$(NAME): $@] make obj\n"
	@printf "\tcreating $(GREEN)folders$(NC)"
	@mkdir -p $@
	@printf "\t$(OK)\n"
	

$(OBJ_DIR)%.o : $(SRC_DIR)%.c $(INCLUDE)
	@printf "\tcompile $(MAJENTA)$@$(NC)"
	@$(CC) $(CFLAGS) -o $@ -c $< $(INC)
	@printf "\t$(OK)\n"
	

clean : $(OBJ_DIR)
	@printf "[$(NAME): $@] clean $(MAJENTA)obj file$(NC)"
	@rm -rf $<
	@printf "\t$(OK)\n"

fclean : clean
	@printf "[$(NAME): $@] clean $(CYAN)binary file$(NC)"
	@rm -f $(NAME)
	@printf "\t$(OK)\n"	

proper :
	@make -C ./ all
	@make -C ./ clean

re :
	@make -C ./ fclean
	@make -C ./ all

.PHONY: all re fclean clean proper
