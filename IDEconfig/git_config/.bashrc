# === PATH para mis scripts personalizados ===
export PATH="$PATH:/c/Users/Pedro/Documents/claude-commit"

# === Alias opcional para git ccommit ===
alias cc='
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  claude-commit
else
  echo "⚠️ No estás dentro de un repositorio Git."
fi'


# Some good standards, which are not used if the user
# creates his/her own .bashrc/.bash_profile

# --show-control-chars: help showing Korean or accented characters
alias _='sudo '
alias abrir=xdg-open
alias ..='cd ..'
alias aguf='sudo apt update && apt full-upgrade -y'
alias c=xclip
alias cll=clear
alias cls=clear
alias col='ls -sh1'
alias del='rm -rf *'
alias gad='git add .'
alias gb='git branch'
alias gcb='git checkout -b'
alias gcm='git commit -m'
alias gco='git checkout'
alias uemail='git config --global user.email "99pedrodresch@gmail.com"'
alias ugithub='git config --global user.name "dreschpedro"'
alias ugitlab='git config --global user.name "pedro.dresch"'
alias gd='git diff'
alias gf='git fetch'
alias gm='git merge'
alias gp='git push'
alias gpl='git pull'
alias gst='git status'
alias grev='git revert'
alias grh='git reset'
alias gs='git switch'
alias pas='php artisan serve'
alias l='ls -lah'
alias la='ls -lAh'
alias lsh='ls -sh'
alias ll='ls -l'
alias ls='ls -F --color=auto --show-control-chars'
alias lsa='ls -lah'
alias lss='colorls --sd --gs'
alias md='mkdir -p'
alias nrd='npm run dev'
alias ns='npm start'
alias rebz='source ~/.zshrc'
alias rebb='source ~/.bashrc'
alias tree3='cmd //c tree //f'
alias v='xclip -o'
alias serv='py manage.py runserver'
alias sd='--settings=config.settings.development'
alias sp='--settings=config.settings.production'
alias dps='docker-compose ps --format "table {{.Name}}\t{{.Image}}\t{{.Service}}\t{{.Ports}}"'
alias c='xclip -i'
alias v='xclip -o'
alias choco_ssh='ssh -p 65002 u914212490@62.72.62.165'
alias faka='ssh -i ~/.ssh/google_compute_engine karismasia10@34.125.184.192'
alias woka='ssh -i ~/.ssh/google_compute_engine karismasia10@34.118.45.244'
alias dopu='docker build -t cruznegradev/mariosaave:1.0.3 . 
docker push cruznegradev/mariosaave:1.0.3'
alias amelie='ssh -p 65002 u334216874@149.62.37.201'
alias crowdfonding='ssh devops@72.60.70.170'

case "$TERM" in
xterm*)
	# The following programs are known to require a Win32 Console
	# for interactive usage, therefore let's launch them through winpty
	# when run inside `mintty`.
	for name in node ipython php php5 psql python2.7
	do
		case "$(type -p "$name".exe 2>/dev/null)" in
		''|/usr/bin/*) continue;;
		esac
		alias $name="winpty $name.exe"
	done
	;;
esac




# ########################################
# git-prompt.sh

if test -f /etc/profile.d/git-sdk.sh
then
	TITLEPREFIX=SDK-${MSYSTEM#MINGW}
else
	TITLEPREFIX=$MSYSTEM
fi

if test -f ~/.config/git/git-prompt.sh
then
	. ~/.config/git/git-prompt.sh
else
	PS1='\[\033]0;$PWD\007\]' # set window title
	PS1="$PS1"'\n'                 # new line
	PS1="$PS1"'\[\033[32m\]'       # change to green
	#PS1="$PS1"'\u@\h '             # user@host<space>
	PS1="$PS1"'\[\033[35m\]'       # change to purple
	#PS1="$PS1"'$MSYSTEM '          # show MSYSTEM (MINGW64)
	#PS1="$PS1"'\[\033[33m\]'       # change to brownish yellow
	PS1="$PS1"'\w'                 # current working directory
	if test -z "$WINELOADERNOEXEC"
	then
		GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
		COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
		COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
		COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
		if test -f "$COMPLETION_PATH/git-prompt.sh"
		then
			. "$COMPLETION_PATH/git-completion.bash"
			. "$COMPLETION_PATH/git-prompt.sh"
			PS1="$PS1"'\[\033[36m\]'  # change color to cyan
			PS1="$PS1"'`__git_ps1`'   # bash function
		fi
	fi
	PS1="$PS1"'\[\033[0m\]'        # change color
	PS1="$PS1"'\n'                 # new line
	PS1="$PS1"'$ '                 # prompt: always $
fi

MSYS2_PS1="$PS1"               # for detection by MSYS2 SDK's bash.basrc

# Evaluate all user-specific Bash completion scripts (if any)
if test -z "$WINELOADERNOEXEC"
then
	for c in "$HOME"/bash_completion.d/*.bash
	do
		# Handle absence of any scripts (or the folder) gracefully
		test ! -f "$c" ||
		. "$c"
	done
fi
