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
