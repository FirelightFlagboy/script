# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbenneto <fbenneto@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/12/05 15:48:33 by fbenneto          #+#    #+#              #
#    Updated: 2017/12/05 15:51:17 by fbenneto         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ifneq ($(words $(MAKECMDGOALS)),1)
.DEFAULT_GOAL = all
%:
		@$(MAKE) $@ --no-print-directory -rRf $(firstword $(MAKEFILE_LIST))
else
ifndef ECHO
T := $(shell $(MAKE) $(MAKECMDGOALS) --no-print-directory \
      -nrRf $(firstword $(MAKEFILE_LIST)) \
      ECHO="COUNTTHIS" | grep -c "COUNTTHIS")

N := x
C = $(words $N)$(eval N := x $N)
ECHO = echo "`expr " [\`expr $C '*' 100 / $T\`" : '.*\(....\)$$'`%]"
endif

.PHONY: all clean

all: target
	@$(ECHO) All done

clean:
	@rm -f target *.c
	@$(ECHO) Clean done

target: a.c b.c c.c d.c e.c
	@$(ECHO) Linking $@
	@sleep 0.1
	@touch $@

%.c:
	@$(ECHO) Compiling $@
	@sleep 0.1
	@touch $@

endif
