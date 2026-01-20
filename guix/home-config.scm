(use-modules (gnu)
             (gnu home)
             (gnu home services shells))

(home-environment
  (packages (specifications->packages
            (list
              "git"
              "emacs"
              "eza"
              "fd"
              "universal-ctags"
              "mpv"
              "zoxide"
              "trash-cli"
              "delta"
              "gdb"
              "alacritty")))
  (services (list
              (service home-zsh-service-type
                       (home-zsh-configuration
                         (environment-variables '(("PROMPT" . "❬%F{13}%n%f❭ %f%F{13}図書館に%f %F{12}%d\n%f ")))
                         #;(aliases '(("cd" . "z") 
                                    ("ls" . "exa --icons") 
                                    ("tree" . "exa --tree --icons")
                                    ("cp" . "cp -iv")
                                    ("mv" . "mv -iv")
                                    ("rm" . "trash - v")))))))
  )
