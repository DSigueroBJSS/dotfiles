export JAVA_HOME="/usr/lib/jvm/java-8-openjdk"
export PYENV_ROOT="$HOME/.pyenv"
export NVM_DIR="$HOME/.nvm"
export PATH="$HOME/.rbenv/bin:$HOME/.tfenv/bin:$HOME/.local/bin:$PYENV_ROOT/bin:$PATH"

#########
# RBENV #
#########
if command -v rbenv 1>/dev/null 2>&1; then
	eval "$(rbenv init -)"
fi

#########
# PYENV #
#########
if command -v pyenv 1>/dev/null 2>&1; then
	eval "$(pyenv init -)"
fi


#######
# NVM #
#######
nvm () {
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion	
	nvm "$@"
}


# running nvm use if .nvmrc exists when accessing a directory
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
    NVM_DIRTY=true
  elif [[ $NVM_DIRTY = true ]]; then
    nvm use default
    NVM_DIRTY=false
  fi
}
add-zsh-hook chpwd load-nvmrc

# AWS ZSH completer
[[ -s aws_zsh_completer.zsh ]] && source aws_zsh_completer.zsh

# AWS Profile/auth/MFA functions
[[ -s $HOME/.aws/aws_functions.zsh ]] && source $HOME/.aws/aws_functions.zsh

# Git loves fzf
[[ -s $ZSH_CONFIG/fzf-git.zsh ]] && source $ZSH_CONFIG/fzf-git.zsh

