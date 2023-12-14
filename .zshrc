#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down

plugins=(alias-finder  brew common-aliases copydir copyfile docker docker-compose dotenv encode64 extract git jira jsontools node npm npx nvm osx urltools vscode web-search z)

eval "$(pyenv init -)"

eval "$(direnv hook zsh)"
eval "$(starship init zsh)"

alias run="npm run"
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
alias podz="cd ios && arch -x86_64 pod install & cd .."
export PATH="/Users/bbarbin/.local/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="/usr/local/Cellar/postgresql@15/15.4/bin:$PATH"
export PYTHONPATH="$HOME/teamworks/api"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export GI_TYPELIB_PATH="/usr/local/lib/girepository-1.0"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
NODE_VERSION_PREFIX=v
NODE_VERSIONS=~/.nvm/versions/node
# pnpm
export PNPM_HOME="/Users/bbarbin/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# nvm
export NVM_DIR="/Users/bbarbin/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

autoload -U add-zsh-hook

load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc

# aws
export AWS_DEFAULT_PROFILE=AWSPowerUserAccess-520721845088

export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="/usr/local/opt/jpeg/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/bbarbin/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
