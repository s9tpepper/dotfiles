[[ -f ~/.cargo/env ]] && . "$HOME/.cargo/env"

export KUBE_EDITOR="/opt/homebrew/bin/nvim"
export EDITOR="/opt/homebrew/bin/nvim"
export GROOVY_HOME="/usr/local/opt/groovy/libexec/"
export HELM_EXPERIMENTAL_OCI=1
export DATABASE_URL="/Users/s9tpepper/code/sergeant_apps/set_intro/production/intros.db"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export XDG_CONFIG_HOME="$HOME/.config"

# Stream DB
export DATABASE_URL=sqlite:///mnt/nas/documents/stream/database/intros.db

# Arch Dark Mode
export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE=Adwaita-Dark
