# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    update_bashrc.sh                                   :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbenneto <fbenneto@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/08/14 15:20:03 by fbenneto          #+#    #+#              #
#    Updated: 2017/08/14 15:23:26 by fbenneto         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/usr/bin/env bash
bashrc=~/Documents/my_script/alias/bashrc
cat $bashrc
cp $bashrc ~/.bashrc
source ~/.bashrc
echo "DONE"
