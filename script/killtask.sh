# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    killtask.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbenneto <fbenneto@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/12/05 13:25:54 by fbenneto          #+#    #+#              #
#    Updated: 2017/12/05 13:26:17 by fbenneto         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/usr/bin/env bash

ps -W | grep -i $1 | awk '{print $1}' | while read line; do echo $line | xargs kill -f; done;
