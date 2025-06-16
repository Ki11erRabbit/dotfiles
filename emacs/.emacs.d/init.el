(eval-and-compile
  (require 'package)
  (setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
                           
                           ("melpa" . "https://melpa.org/packages/")))
  (package-initialize)
  ;; i always fetch the archive contents on startup and during compilation, which is slow
  (package-refresh-contents)
  (unless (package-installed-p 'use-package)
    (package-install 'use-package))
  (require 'use-package)
  ;; i don't really know why this isn't the default...
  (setf use-package-always-ensure t))

(add-to-list 'default-frame-alist '(font . "JetBrainsMono Nerd Font"))
(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font" :height 120)

;(load "~/.emacs.d/koka.el")

(tool-bar-mode -1)
(menu-bar-mode -1)
(if (boundp 'fringe-mode)
    (fringe-mode -1))
(if (boundp 'scroll-bar-mode)
    (scroll-bar-mode -1))

(xterm-mouse-mode)
(setq mouse-wheel-progressive-speed nil)
(setq focus-follows-mouse "auto-raise")
(setq mouse-autoselect-window 't)

(add-hook 'prog-mode-hook
          'display-line-numbers-mode)

(setq evil-want-keybinding nil)
(setq-default indent-tabs-mode nil)
(defun my-c-mode-common-hook ()
 ;; my customizations for all of c-mode, c++-mode, objc-mode, java-mode
 (c-set-offset 'substatement-open 0)
 ;; other customizations can go here

 (setq c++-tab-always-indent t)
 (setq c-basic-offset 4)                  ;; Default is 2
 (setq c-indent-level 4)                  ;; Default is 2

 (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
 (setq tab-width 4)
 (setq indent-tabs-mode nil)  ; use spaces only if nil
 )

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)


(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(use-package all-the-icons-nerd-fonts
  :after all-the-icons)

(use-package auctex
  :ensure t
  :defer t
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)
  (setq TeX-PDF-mode t)
  (bind-keys :map evil-normal-state-map
	     :prefix "SPC"
             :prefix-map preview-map
	     ("l p" . preview-buffer)))

(use-package dired-rsync
  :bind (:map dired-mode-map
	      ("C-x d" . dired-rsync)))

(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package bind-key)

(use-package browse-kill-ring)

(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t)
  (setq centaur-tabs-set-icons t)
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward))

(use-package company
  :ensure t
  :hook (after-init . global-company-mode))

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package company-auctex
  :ensure t
  :after company
  :after auctex
  :hook (LaTeX-mode . company-auctex-init))

(use-package cdlatex
  :ensure t
  :hook (LaTeX-mode . turn-on-cdlatex))

;(quelpa '(copilot
;	  :fetcher github
;	  :repo "copilot-emacs/copilot.el"
;	  :branch "main"
;	  :files ("*.el")))
;(require 'copilot)
;(add-hook 'prog-mode-hook 'copilot-mode)
;(define-key copilot-completion-map (kbd "C-<tab>") 'copilot-accept-completion)

(use-package dap-mode
        :ensure t
        :config
        (setq dap-auto-configure-features '(sessions locals controls tooltip))
        ;(require 'dap-java)
        (require 'dap-python)
        (setq dap-python-debugger 'debugpy)
        (require 'dap-gdb)
        (setq dap-gdb-debug-program '("rust-gdb" "-i" "dap"))
        (require 'dap-dlv-go))


(use-package drag-stuff
  :config
  (drag-stuff-global-mode 1)
  (drag-stuff-define-keys))

(use-package deadgrep
  :ensure t
  :bind ("<f4>" . deadgrep))

(use-package diff-hl
  :config
  (global-diff-hl-mode))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :config (column-number-mode 1)
  :custom
  (doom-modeline-height 30)
  (doom-modeline-window-width-limit nil)
  (doom-modeline-buffer-file-name-style 'truncate-with-project)
  (doom-modeline-enable-word-count t)
  (doom-modeline-buffer-modification-icon t)
  (doom-modeline-time t)
  (doom-modeline-vcs-max-length 50))

;(use-package doom-themes
;  :ensure t
;  :config
;  (doom-themes-org-config)
;  (doom-themes-visual-bell-config))

(use-package catppuccin-theme)

(use-package evil
  :init
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump t)
  (setq evil-want-C-w-scroll t)
  (setq evil-want-C-w-in-emacs-state t)
  (setq evil-want-C-w-delete t)
  (setq evil-want-Y-yank-to-eol t)
  (setq evil-undo-system 'undo-fu)
  :config
  (evil-mode 1)
  (evil-select-search-module 'evil-search-module 'evil-search))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package evil-org
  :after org
  :hook (org-mode . evil-org-mode)
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package esh-autosuggest
  :ensure t
  :after esh
  :config
  (eshell-mode . esh-autosuggest-mode))

(use-package evil-nerd-commenter)

;(use-package dashboard
;  :ensure t
;  :config
;  :(dashboard-setup-startup-hook))

(use-package golden-ratio
  :ensure t
  :hook (after-init . golden-ratio-mode)
  :custom
  (golden-ratio-exclude-modes '(occur-mode)))

(use-package indent-guide
  :ensure t
  :hook (prog-mode . indent-guide-mode))

(use-package lispyville
  :hook (emacs-lisp-mode . lispyville-mode)
  :hook (scheme-mode . lispyville-mode)
  :hook (racket-mode . lispyville-mode)
  :hook (lisp-mode . lispyville-mode)
  :hook (clojure-mode . lispyville-mode)
  :config
  (lispyville-set-key-theme '(operators c-w additional)))


(use-package ligature
  :config
  (ligature-set-ligatures 'prog-mode '("--" "---" "==" "===" "!=" "!==" "=!="
                              "=:=" "=/=" "<=" ">=" "&&" "&&&" "&=" "++" "+++" "***" ";;" "!!"
                              "??" "???" "?:" "?." "?=" "<:" ":<" ":>" ">:" "<:<" "<>" "<<<" ">>>"
                              "<<" ">>" "||" "-|" "_|_" "|-" "||-" "|=" "||=" "##" "###" "####"
                              "#{" "#[" "]#" "#(" "#?" "#_" "#_(" "#:" "#!" "#=" "^=" "<$>" "<$"
                              "$>" "<+>" "<+" "+>" "<*>" "<*" "*>" "</" "</>" "/>" "<!--" "<#--"
                              "-->" "->" "->>" "<<-" "<-" "<=<" "=<<" "<<=" "<==" "<=>" "<==>"
                              "==>" "=>" "=>>" ">=>" ">>=" ">>-" ">-" "-<" "-<<" ">->" "<-<" "<-|"
                              "<=|" "|=>" "|->" "<->" "<~~" "<~" "<~>" "~~" "~~>" "~>" "~-" "-~"
                              "~@" "[||]" "|]" "[|" "|}" "{|" "[<" ">]" "|>" "<|" "||>" "<||"
                              "|||>" "<|||" "<|>" "..." ".." ".=" "..<" ".?" "::" ":::" ":=" "::="
                              ":?" ":?>" "//" "///" "/*" "*/" "/=" "//=" "/==" "@_" "__" "???"
                              "<:<" ";;;"))
  (global-ligature-mode t))


(use-package lsp-haskell
  :ensure t
  :hook (haskell-mode . lsp)
  :hook (haskell-literate-mode . lsp))

(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (python-mode . lsp)
         (haskell-mode . lsp)
         (c-mode . lsp)
         (c++-mode . lsp)
         (rust-mode . lsp)
         (racket-mode . lsp)
         (zig-mode . lsp)
         (nix-mode . lsp)
         (go-mode . lsp)
         (idris-mode . lsp)
         (lua-mode . lsp)
         (koka-mode . lsp)
	 (proof-general . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-sideline-show-hover t)
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-doc-show-with-cursor t)
  (setq lsp-ui-sideline-show-symbol t))

(use-package magit)

(use-package nerd-icons)

(use-package org)

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package quelpa)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package rainbow-mode
  :hook (prog-mode . rainbow-mode))

(use-package solaire-mode
  :ensure t
  :hook (after-init . solaire-global-mode)
  :config
  (push '(treemacs-window-background-face . solaire-default-face) solaire-mode-remap-alist)
  (push '(treemacs-hl-line-face . solaire-hl-line-face) solaire-mode-remap-alist))

(use-package spacious-padding
  :ensure t
  :hook (after-init . spacious-padding-mode))

(use-package sudo-edit
  :config
  (bind-keys :map evil-normal-state-map
	     :prefix "SPC"
	     :prefix-map sudo-edit-map
	     ("s e" . sudo-edit)))


(use-package treemacs
  :ensure t
  :bind ("<f5>" . treemacs)
  :custom
  (treemacs-is-never-other-window t)
  :hook
  (treemacs-mode . treemacs-project-follow-mode))

(use-package undo-fu)

(use-package vertico-posframe
  :ensure t
  :custom
  (vertico-posframe-parameters
   '((left-fringe . 8)
     (right-fringe . 8))))

(vertico-posframe-mode)

(use-package vterm
  :ensure t
  :custom
  (vterm-max-scrollback 100000))

(use-package which-key
    :config
    (which-key-mode))


(use-package python-mode)
(use-package haskell-mode)
(use-package rust-mode)
(use-package racket-mode)
(use-package zig-mode)
(use-package nix-mode)
(use-package go-mode)
(use-package idris-mode)
(use-package lua-mode)
(use-package proof-general)
(use-package nix-mode :mode "\\.nix\\'")


(add-hook 'text-mode-hook 'context-menu-mode)
(add-hook 'prog-mode-hook 'context-menu-mode)
(add-hook 'org-mode-hook 'context-menu-mode)
(add-hook 'dired-mode-hook 'context-menu-mode)
(add-hook 'LaTeX-mode-hook 'context-menu-mode)



(use-package flyspell
  :custom
  (setq ispell-program-name "hunspell")
  (hunspell-dictionary "en_US")
  :config
  (add-hook 'text-mode-hook 'flyspell-mode)
  (add-hook 'prog-mode-hook 'flyspell-prog-mode)
  (add-hook 'org-mode-hook 'flyspell-mode)
  (add-hook 'LaTeX-mode-hook 'flyspell-mode)
  (add-hook 'markdown-mode-hook 'flyspell-mode))

(setq catppuccin-flavor 'latte)
(add-hook 'after-init-hook (lambda () (load-theme 'catppuccin t)))


(delete-selection-mode 1)



(evil-define-key 'normal 'evil-normal-state-map
		 "m" 'evil-backward-char
		 "n" 'evil-next-line
		 "gn" 'evil-next-line
		 "e" 'evil-previous-line
		 "ge" 'evil-previous-line
		 "i" 'evil-forward-char
		 "j" 'evil-next-match
		 "J" 'evil-previous-match
		 "M" 'evil-window-top
		 "I" 'evil-window-bottom
		 "K" 'evil-window-middle)


(evil-define-key 'visual 'evil-visual-state-map
		 "m" 'evil-backward-char
		 "n" 'evil-next-line
		 "gn" 'evil-next-visual-line
		 "e" 'evil-previous-line
		 "ge" 'evil-previous-visual-line
		 "i" 'evil-forward-char
		 "j" 'evil-next-match
		 "J" 'evil-previous-match
		 "M" 'evil-window-top
		 "I" 'evil-window-bottom
		 "K" 'evil-window-middle)


(evil-define-key '(normal visual) 'global
		 "t" 'evil-insert
		 "T" 'evil-insert-line)


(bind-keys :map evil-normal-state-map
	   :prefix "C-w"
	   :prefix-map my-prefix-map
	   ("m" . evil-window-left)
	   ("n" . evil-window-down)
	   ("e" . evil-window-up)
	   ("i" . evil-window-right))

;; Evil magit keybindings
(evil-define-key 'normal magit-mode-map "n" 'evil-next-visual-line)
(evil-define-key 'normal magit-mode-map "e" 'evil-previous-visual-line)
(evil-define-key 'normal magit-mode-map "m" 'evil-backward-char)
(evil-define-key 'normal magit-mode-map "i" 'evil-forward-char)
(evil-define-key 'normal magit-mode-map "C-n" 'magit-section-forward)
(evil-define-key 'normal magit-mode-map "C-e" 'magit-section-backward)
(evil-define-key 'normal magit-mode-map "j" 'evil-search-next)
(evil-define-key 'normal magit-mode-map "J" 'evil-search-previous)
(evil-define-key 'normal magit-mode-map "M-m" 'magit-merge)
(evil-define-key 'normal magit-mode-map "M-e" 'magit-ediff)
(evil-define-key 'normal magit-mode-map "M-E" 'magit-ediff)
(evil-define-key 'normal magit-mode-map "M-i" 'magit-gitignore)

;; Evil EWW keybindings
(evil-define-key 'normal eww-mode-map "M" 'eww-back-url)
(evil-define-key 'normal eww-mode-map "I" 'eww-forward-url)

;; Evil Dired keybindings
(evil-define-key 'normal dired-mode-map "n" 'dired-next-line)
(evil-define-key 'normal dired-mode-map "e" 'dired-previous-line)

;; Evil Company keybindings
(evil-collection-define-key nil 'company-active-map
    (kbd "C-n") 'company-select-next-or-abort
    (kbd "C-p") 'company-select-previous-or-abort
    (kbd "C-n") 'company-select-next-or-abort
    (kbd "C-e") 'company-select-previous-or-abort
    (kbd "M-n") 'company-select-next
    (kbd "M-e") 'company-select-previous)
(evil-collection-define-key nil 'company-search-map
    (kbd "C-n") 'company-select-next-or-abort
    (kbd "C-e") 'company-select-previous-or-abort
    (kbd "M-n") 'company-select-next
    (kbd "M-e") 'company-select-previous)

;; Evil EShell keybindings
(evil-define-key 'normal eshell-mode-map "C-n" 'eshell-next-prompt)
(evil-define-key 'normal eshell-mode-map "C-e" 'eshell-previous-prompt)
(evil-define-key 'normal eshell-mode-map "M-m" 'eshell-backward-argument)
(evil-define-key 'normal eshell-mode-map "M-i" 'eshell-forward-argument)
(evil-define-key 'normal eshell-mode-map "C-m" 'eshell-prevous-matching-input-from-input)
(evil-define-key 'normal eshell-mode-map "C-i" 'eshell-next-matching-input-from-input)

(evil-define-key 'visual eshell-mode-map "C-n" 'eshell-next-prompt)
(evil-define-key 'visual eshell-mode-map "C-e" 'eshell-previous-prompt)

;; Evil Dashboard keybindings
;(evil-define-key 'normal 'dashboard-mode-map "s" (symbol-function (lookup-key dashboard-mode-map "e")))
(evil-define-key 'normal 'dashboard-mode-map "n" 'dashboard-next-line)
(evil-define-key 'normal 'dashboard-mode-map "e" 'dashboard-previous-line)
(evil-define-key 'normal 'dashboard-mode-map "gn" 'dashboard-next-section)
(evil-define-key 'normal 'dashboard-mode-map "ge" 'dashboard-previous-section)

;; Evil VTerm keybindings
(evil-define-key 'normal vterm-mode-map "t" 'evil-collection-vterm-insert)
(evil-define-key 'normal vterm-mode-map "T" 'evil-collection-vterm-insert-line)
(evil-define-key 'normal vterm-mode-map "n" 'evil-collection-vterm-next-line)

;; Evil Go-mode keybindings
(evil-define-key 'normal go-mode-map "E" 'godef-describe)

;; Evil Org-mode keybindings

(setq native-comp-async-report-warnings-errors 'silent)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(flyspell-correct-ivy flyspell-correct dap-mode ligature sudo-edit deadgrep indent-guide centaur-tabs sublimity zig-mode which-key vterm vertico-posframe spacious-padding solaire-mode rust-mode rainbow-delimiters racket-mode quelpa-use-package python-mode proof-general projectile paredit-menu nix-mode lua-mode lsp-ui lsp-treemacs lsp-haskell idris-mode golden-ratio go-mode doom-themes doom-modeline dired-rsync copilot company-box async all-the-icons-dired))
 '(warning-suppress-types
   '(((copilot copilot-no-mode-indent))
     ((copilot copilot-no-mode-indent))
     ((copilot copilot-no-mode-indent)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

