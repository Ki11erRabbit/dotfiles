(cond
 ((string-equal system-type "darwin")
  (setenv "PATH" "/Users/ki11errabbit/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/Applications/Ghostty.app/Contents/MacOS")
  (setq exec-path (split-string (getenv "PATH") path-separator))))

(eval-and-compile
  (require 'package)
  (setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
                           ("melpa" . "https://melpa.org/packages/")))
  (package-initialize)
  ;; Fetch the archive contents on startup and during compilation
  (package-refresh-contents)
  (unless (package-installed-p 'use-package)
    (package-install 'use-package))
  (require 'use-package)
  ;; Always ensure packages are installed
  (setf use-package-always-ensure t))

(add-to-list 'default-frame-alist '(font . "JetBrainsMono Nerd Font"))
(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font" :height 120)

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

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(setq-default indent-tabs-mode nil)

(defun my-c-mode-common-hook ()
  "My customizations for all of c-mode, c++-mode, objc-mode, java-mode"
  (c-set-offset 'substatement-open 0)
  (setq c++-tab-always-indent t)
  (setq c-basic-offset 4)
  (setq c-indent-level 4)
  (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
  (setq tab-width 4)
  (setq indent-tabs-mode nil))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(setq evil-want-keybinding nil)

(use-package evil
  :init
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

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(use-package all-the-icons-nerd-fonts
  :after all-the-icons)

(use-package nerd-icons)

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

(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t)
  (setq centaur-tabs-set-icons t)
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward))

(use-package catppuccin-theme)

(setq catppuccin-flavor 'latte)
(add-hook 'after-init-hook (lambda () (load-theme 'catppuccin t)))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package rainbow-mode
  :hook (prog-mode . rainbow-mode))

(use-package indent-guide
  :ensure t
  :hook (prog-mode . indent-guide-mode))

(use-package dired-rsync
  :bind (:map dired-mode-map
              ("C-x d" . dired-rsync)))

(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package treemacs
  :ensure t
  :bind ("<f5>" . treemacs)
  :custom
  (treemacs-is-never-other-window t)
  :hook
  (treemacs-mode . treemacs-project-follow-mode))

(use-package company
  :ensure t
  :hook (after-init . global-company-mode)
  :after eglot
  :config
  ;; Eglot integrates with company via completion-at-point
  (setq company-backends
        (cons 'company-capf
              (remove 'company-capf company-backends))))

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package undo-fu)

(use-package drag-stuff
  :config
  (drag-stuff-global-mode 1)
  (drag-stuff-define-keys))

(use-package lispyville
  :hook (emacs-lisp-mode . lispyville-mode)
  :hook (scheme-mode . lispyville-mode)
  :hook (racket-mode . lispyville-mode)
  :hook (lisp-mode . lispyville-mode)
  :hook (clojure-mode . lispyville-mode)
  :config
  (lispyville-set-key-theme '(operators c-w additional)))

(use-package evil-nerd-commenter)

(use-package browse-kill-ring)

(use-package sudo-edit
  :config
  (bind-keys :map evil-normal-state-map
             :prefix "SPC"
             :prefix-map sudo-edit-map
             ("s e" . sudo-edit)))

(delete-selection-mode 1)

(use-package deadgrep
  :ensure t
  :bind ("<f4>" . deadgrep))

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package vertico-posframe
  :ensure t
  :custom
  (vertico-posframe-parameters
   '((left-fringe . 8)
     (right-fringe . 8))))

(vertico-posframe-mode)

(use-package which-key
  :config
  (which-key-mode))

(use-package magit)

(use-package diff-hl
  :config
  (global-diff-hl-mode))

(use-package eglot
  :ensure t
  :hook ((python-mode . eglot-ensure)
         (haskell-mode . eglot-ensure)
         (haskell-literate-mode . eglot-ensure)
         (c-mode . eglot-ensure)
         (c++-mode . eglot-ensure)
         (rust-mode . eglot-ensure)
         (racket-mode . eglot-ensure)
         (zig-mode . eglot-ensure)
         (nix-mode . eglot-ensure)
         (go-mode . eglot-ensure)
         (idris-mode . eglot-ensure)
         (lua-mode . eglot-ensure)
         (koka-mode . eglot-ensure))
  :bind (:map eglot-mode-map
              ("C-c l r" . eglot-rename)
              ("C-c l a" . eglot-code-actions)
              ("C-c l f" . eglot-format)
              ("C-c l h" . eldoc-doc-buffer)
              ("C-c l d" . xref-find-definitions)
              ("C-c l R" . xref-find-references)
              ("C-c l n" . flymake-goto-next-error)
              ("C-c l e" . flymake-goto-prev-error))
  :custom
  ;; Performance optimizations
  (eglot-events-buffer-size 0)
  (eglot-sync-connect nil)
  (eglot-autoshutdown t)
  (eglot-send-changes-idle-time 0.5)
  :config
  ;; Enable which-key integration
  (add-hook 'eglot-managed-mode-hook
            (lambda ()
              (when (fboundp 'which-key-mode)
                (which-key-add-key-based-replacements
                  "C-c l" "eglot")))))

(use-package dap-mode
  :ensure t
  :config
  (setq dap-auto-configure-features '(sessions locals controls tooltip))
  (require 'dap-python)
  (setq dap-python-debugger 'debugpy)
  (require 'dap-gdb)
  (setq dap-gdb-debug-program '("rust-gdb" "-i" "dap"))
  (require 'dap-dlv-go))

(use-package flymake
  :ensure t
  :custom
  (flymake-no-changes-timeout 0.5)
  :config
  (setq flymake-fringe-indicator-position 'left-fringe))

(use-package eldoc
  :ensure t
  :custom
  (eldoc-echo-area-use-multiline-p nil)
  (eldoc-idle-delay 0.1))

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

(use-package company-auctex
  :ensure t
  :after company
  :after auctex
  :hook (LaTeX-mode . company-auctex-init))

(use-package cdlatex
  :ensure t
  :hook (LaTeX-mode . turn-on-cdlatex))

(use-package python-mode)
(use-package haskell-mode)
(use-package rust-mode)
(use-package racket-mode)
(use-package zig-mode)
(use-package nix-mode :mode "\\.nix\\'")
(use-package go-mode)
(use-package idris-mode)
(use-package lua-mode)
(use-package proof-general)

(use-package vterm
  :ensure t
  :custom
  (vterm-max-scrollback 100000))

(use-package esh-autosuggest
  :ensure t
  :after esh
  :config
  (eshell-mode . esh-autosuggest-mode))

(use-package org)

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

(add-hook 'text-mode-hook 'context-menu-mode)
(add-hook 'prog-mode-hook 'context-menu-mode)
(add-hook 'org-mode-hook 'context-menu-mode)
(add-hook 'dired-mode-hook 'context-menu-mode)
(add-hook 'LaTeX-mode-hook 'context-menu-mode)

(use-package golden-ratio
  :ensure t
  :hook (after-init . golden-ratio-mode)
  :custom
  (golden-ratio-exclude-modes '(occur-mode)))

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

(use-package bind-key)

(bind-keys :map evil-normal-state-map
           :prefix "C-w"
           :prefix-map my-prefix-map
           ("m" . evil-window-left)
           ("n" . evil-window-down)
           ("e" . evil-window-up)
           ("i" . evil-window-right))

;; Magit
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

;; EWW
(evil-define-key 'normal eww-mode-map "M" 'eww-back-url)
(evil-define-key 'normal eww-mode-map "I" 'eww-forward-url)

;; Dired
(evil-define-key 'normal dired-mode-map "n" 'dired-next-line)
(evil-define-key 'normal dired-mode-map "e" 'dired-previous-line)

;; Company
(evil-collection-define-key nil 'company-active-map
  (kbd "C-n") 'company-select-next-or-abort
  (kbd "C-p") 'company-select-previous-or-abort
  (kbd "C-e") 'company-select-previous-or-abort
  (kbd "M-n") 'company-select-next
  (kbd "M-e") 'company-select-previous)

(evil-collection-define-key nil 'company-search-map
  (kbd "C-n") 'company-select-next-or-abort
  (kbd "C-e") 'company-select-previous-or-abort
  (kbd "M-n") 'company-select-next
  (kbd "M-e") 'company-select-previous)

;; Eshell
(evil-define-key 'normal eshell-mode-map "C-n" 'eshell-next-prompt)
(evil-define-key 'normal eshell-mode-map "C-e" 'eshell-previous-prompt)
(evil-define-key 'normal eshell-mode-map "M-m" 'eshell-backward-argument)
(evil-define-key 'normal eshell-mode-map "M-i" 'eshell-forward-argument)
(evil-define-key 'normal eshell-mode-map "C-m" 'eshell-prevous-matching-input-from-input)
(evil-define-key 'normal eshell-mode-map "C-i" 'eshell-next-matching-input-from-input)

(evil-define-key 'visual eshell-mode-map "C-n" 'eshell-next-prompt)
(evil-define-key 'visual eshell-mode-map "C-e" 'eshell-previous-prompt)

;; VTerm
(evil-define-key 'normal vterm-mode-map "t" 'evil-collection-vterm-insert)
(evil-define-key 'normal vterm-mode-map "T" 'evil-collection-vterm-insert-line)
(evil-define-key 'normal vterm-mode-map "n" 'evil-collection-vterm-next-line)

;; Go mode
(evil-define-key 'normal go-mode-map "E" 'godef-describe)

(load-file "~/.emacs.d/evil-custom-bindings.el")

(setq native-comp-async-report-warnings-errors 'silent)
(setq native-comp-deferred-compilation t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil)
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
