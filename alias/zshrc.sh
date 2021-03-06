# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    zshrc.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbenneto <fbenneto@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/01/05 16:34:11 by fbenneto          #+#    #+#              #
#    Updated: 2018/04/14 09:52:53 by fbenneto         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#
# personal alias
#

export SCRIPT_DIR="/Users/fbenneto/script/"

alias vsc="open -a Visual\ Studio\ Code"
alias 42checker="bash ~/42FileChecker/42FileChecker.sh"
alias grademe="bash ~/Libftest/grademe.sh"
alias quote="bash $SCRIPT_DIR/script/quotilette.sh"
alias work="sh $SCRIPT_DIR/script/work.sh"
alias mscript="cd $SCRIPT_DIR"
alias groutine="bash $SCRIPT_DIR/script/groutine.sh"
alias norme="bash $SCRIPT_DIR/script/norminette.sh"
alias compilette="bash $SCRIPT_DIR/script/compilette.sh"
alias killtask="bash $SCRIPT_DIR/script/killtask.sh"
alias cl="clear"
alias sl="cd ~/sl && ./sl && cd -"
alias grot="groutine"
alias gitc="bash $SCRIPT_DIR/script/gitc.sh"
alias salias="cat $SCRIPT_DIR/alias/zshrc"
alias vi="vim"
alias emacs="vim"
alias gcc="clang"
alias temp="/opt/vc/bin/vcgencmd measure_temp"
alias evssh="eval \"$(ssh-agent -s)\""
alias ptop="bash $SCRIPT_DIR/script/top_name.sh"
alias maj="$SCRIPT_DIR/script/maj.bash"
alias search="bash $SCRIPT_DIR/script/search.bash"
alias clean="printf \"\e[2J\e[3J\e[0;0H\""
#
# Function
#

norme_grep()
{
	if [ $# -eq 0 ]
	then
		norme_grep srcs includes
	else
		printf "Norme in folder $*\n"
		norminette $* | grep -i -B 1 "Warning\|Error"
	fi
}

##
# personal export
#

export CDPATH="$HOME:$HOME/repo:/:.:.."
export USER="fbenneto"
export MAIL="fbenneto@student.42.fr"
export MAIL_GIT="firelight.flagboy@gmail.com"
export USER_GIT="FirelightFlagboy"
