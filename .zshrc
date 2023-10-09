source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down

plugins=(alias-finder  brew common-aliases copydir copyfile docker docker-compose dotenv encode64 extract git jira jsontools node npm npx nvm osx urltools vscode web-search z)

eval "$(pyenv init -)"
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"

alias brew86="arch -x86_64 brew"
alias up="cd .. && ls"
alias dcd="docker compose down --remove-orphans"
alias dcu="docker compose up -d"
alias dcl="docker compose logs --tail 20"
alias add="git add *"
alias commit="git commit -m"
alias checkout="git checkout"
alias clone="git clone"
alias fetch="git fetch --all"
alias merge="git merge"
alias push="git push"
alias pull="git pull"
alias rebase="git rebase"
