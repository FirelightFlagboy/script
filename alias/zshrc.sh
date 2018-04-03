# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    zshrc.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbenneto <fbenneto@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/01/05 16:34:11 by fbenneto          #+#    #+#              #
#    Updated: 2018/04/03 10:07:33 by fbenneto         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#
# personal alias
#

alias vsc="open -a Visual\ Studio\ Code"
alias 42checker="bash ~/42FileChecker/42FileChecker.sh"
alias grademe="bash ~/Libftest/grademe.sh"
alias quote="bash ~/script/script/quotilette.sh"
alias work="sh ~/script/script/work.sh"
alias mscript="cd ~/script"
alias groutine="bash ~/script/script/groutine.sh"
alias norme="bash ~/script/script/norminette.sh"
alias compilette="bash ~/script/script/compilette.sh"
alias killtask="bash ~/script/script/killtask.sh"
alias cl="clear"
alias sl="cd ~/sl; ./sl; cd -"
alias grot="groutine"
alias gitc="bash ~/script/script/gitc.sh"
alias salias="cat ~/script/alias/zshrc"
alias vi="vim"
alias emacs="vim"
alias gcc="clang"
alias temp="/opt/vc/bin/vcgencmd measure_temp"
alias evssh="eval \"$(ssh-agent -s)\""
alias ptop="bash ~/script/script/top_name.sh"
alias maj="~/script/script/maj.bash"
alias search="bash ~/script/script/search.bash"
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
