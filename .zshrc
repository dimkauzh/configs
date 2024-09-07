# Path
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.local/go/bin
export PATH=$PATH:/usr/lib/ioquake3
export PATH=$PATH:~/bin
export PATH=$PATH:/opt/foobillardplus/bin
export PATH=$PATH:~/Github/vpn-cli/bin

# App environment variables
export GOPATH=~/.local/go
export GOMODCACHE=~/.local/go/pkg/mod
export ZED_WINDOW_DECORATIONS=server

# Themes
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_STYLE_OVERRIDE=qt5ct-style
export GTK_THEME=Gruvbox-Dark-Soft
export TERM=xterm-256color

# Different folders
alias circuitpy="cd /run/media/$USER/CIRCUITPY/"

# Neovim
alias neovim="nvim"
alias vim="nvim"
alias vi="nvim"

# Scripts
alias vencord='sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"'
alias pclean='sudo yay -Rns $(yay -Qdtq) ; paccache -rvk0 ; yay -Scca'
alias update-theme='sudo bash -c '\''echo -e "#panel {\n    margin-left: 325px;\n    margin-right: 325px;\n    border-radius: 15px 15px 0px 0px;\n}\n$(cat /usr/share/themes/Gruvbox-Dark-Soft/cinnamon/cinnamon.css)" > /usr/share/themes/Gruvbox-Dark-Soft/cinnamon/cinnamon.css'\'''

# Oh-My-Posh
eval "$(starship init zsh)"

# Neovim config setup
nvim-config() {
    local current_dir=$(pwd)
    cd ~/.config/nvim
    nvim
    cd "$current_dir"
}

# Github folder setup with inline completion
project() {
    if [ -z "$1" ]; then
        cd ~/projects/ || return
    elif [[ "$1" == http* || "$1" == git@* ]]; then
        repo_url="$1"
        repo_name=$(basename "$repo_url" .git)
        dest_dir=~/projects/"$repo_name"

        if [ -d "$dest_dir" ]; then
            echo "Directory '$dest_dir' already exists. Pulling latest changes."
            cd "$dest_dir" || return
            git pull || return
        else
            echo "Cloning repository into '$dest_dir'."
            git clone "$repo_url" "$dest_dir" || return
            cd "$dest_dir" || return
        fi
    else
        cd ~/projects/$1 || return
    fi
}



# Enable completion for the github function
if autoload -Uz compinit && compinit; then
    compdef '_files -W ~/projects/' project
fi

# Bash-completion (Zsh equivalent)
if [ -f /usr/share/zsh/functions/Completion ]; then
    autoload -Uz compinit
    compinit
elif [ -f /etc/zsh_completion ]; then
    . /etc/zsh_completion
fi

# Terminal Title
autoload -Uz add-zsh-hook
function set_terminal_title {
    echo -ne "\033]0;${PWD##*/}\007"
}
add-zsh-hook chpwd set_terminal_title
set_terminal_title

# ZSH history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt share_history
setopt append_history
