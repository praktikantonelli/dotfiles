# config.nu
#
# Installed by:
# version = "0.107.0"

source ~/.cache/carapace/init.nu
$env.config.buffer_editor = "nvim"
$env.config.show_banner = false

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
source ~/.zoxide.nu
autostart_zellij

# aliases
alias cd = z # use zoxide as alternative cd command
alias gs = git status 
alias ga = git add .
alias gps = git push
alias gpl = git pull

def gcm [msg] {
  git commit -m $msg
}

def gcma [msg] {
  git add .
  git commit -m $msg
}

def autostart_zellij [] {
  if 'ZELLIJ' not-in ($env | columns) and (which zellij | is-not-empty) {
    if 'ZELLIJ_AUTO_ATTACH' in ($env | columns) and $env.ZELLIJ_AUTO_ATTACH == 'true' {
      zellij attach -c
    } else {
      zellij
    }

    if 'ZELLIJ_AUTO_EXIT' in ($env | columns) and $env.ZELLIJ_AUTO_EXIT == 'true' {
      exit
    }
  }
}
