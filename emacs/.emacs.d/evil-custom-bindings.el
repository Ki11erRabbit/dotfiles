;;; evil-custom-bindings.el --- Complete evil bindings for custom keyboard layout -*- lexical-binding: t; -*-

;; This file contains comprehensive evil keybindings for a custom keyboard layout
;; Layout mapping: m=left, n=down, e=up, i=right, t=insert

;;; Commentary:
;; Add this to your init.el with: (load-file "~/.emacs.d/evil-custom-bindings.el")
;; Place this AFTER evil and evil-collection are loaded

;;; Code:

;; ============================================================================
;; CORE EVIL STATES - Apply to all modes
;; ============================================================================

;; Motion state (inherited by normal, visual, and operator-pending)
(evil-define-key 'motion 'global
  "m" 'evil-backward-char
  "n" 'evil-next-line
  "e" 'evil-previous-line
  "i" 'evil-forward-char
  "M" 'evil-window-top
  "I" 'evil-window-bottom
  "K" 'evil-window-middle
  "j" 'evil-search-next
  "J" 'evil-search-previous)

;; Operator-pending state (for motions after d, c, y, etc.)
(evil-define-key 'operator 'global
  "m" 'evil-backward-char
  "n" 'evil-next-line
  "e" 'evil-previous-line
  "i" 'evil-forward-char)

;; Normal state global bindings
(evil-define-key 'normal 'global
  "m" 'evil-backward-char
  "n" 'evil-next-line
  "gn" 'evil-next-line
  "e" 'evil-previous-line
  "ge" 'evil-previous-line
  "i" 'evil-forward-char
  "j" 'evil-search-next
  "J" 'evil-search-previous
  "M" 'evil-window-top
  "I" 'evil-window-bottom
  "K" 'evil-window-middle
  "t" 'evil-insert
  "T" 'evil-insert-line)

;; Visual state global bindings
(evil-define-key 'visual 'global
  "m" 'evil-backward-char
  "n" 'evil-next-line
  "gn" 'evil-next-visual-line
  "e" 'evil-previous-line
  "ge" 'evil-previous-visual-line
  "i" 'evil-forward-char
  "j" 'evil-search-next
  "J" 'evil-search-previous
  "M" 'evil-window-top
  "I" 'evil-window-bottom
  "K" 'evil-window-middle
  "t" 'evil-insert
  "T" 'evil-insert-line)

;; ============================================================================
;; WINDOW MANAGEMENT - Extended C-w commands
;; ============================================================================

(with-eval-after-load 'evil
  (define-key evil-normal-state-map (kbd "C-w m") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "C-w n") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "C-w e") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "C-w i") 'evil-window-right)
  
  ;; Movement - move windows to different positions
  (define-key evil-normal-state-map (kbd "C-w M") 'evil-window-move-far-left)
  (define-key evil-normal-state-map (kbd "C-w N") 'evil-window-move-very-bottom)
  (define-key evil-normal-state-map (kbd "C-w E") 'evil-window-move-very-top)
  (define-key evil-normal-state-map (kbd "C-w I") 'evil-window-move-far-right)
  
  ;; Alternative C- prefixed navigation
  (define-key evil-normal-state-map (kbd "C-w C-m") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "C-w C-n") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "C-w C-e") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "C-w C-i") 'evil-window-right))

;; ============================================================================
;; TREEMACS - File tree navigation
;; ============================================================================

(with-eval-after-load 'treemacs
  (evil-define-key 'normal treemacs-mode-map
    "n" 'treemacs-next-line
    "e" 'treemacs-previous-line
    "m" 'treemacs-root-up
    "i" 'treemacs-visit-node-default
    "M" 'treemacs-collapse-parent-node
    "I" 'treemacs-peek
    "t" 'treemacs-visit-node-default-open
    "T" 'treemacs-visit-node-in-most-recently-used-window
    "gn" 'treemacs-next-neighbour
    "ge" 'treemacs-previous-neighbour
    "C-n" 'treemacs-next-line-other-window
    "C-e" 'treemacs-previous-line-other-window))

;; ============================================================================
;; VERTICO / COMPLETION - Minibuffer navigation
;; ============================================================================

(with-eval-after-load 'vertico
  (define-key vertico-map (kbd "C-n") 'vertico-next)
  (define-key vertico-map (kbd "C-e") 'vertico-previous)
  (define-key vertico-map (kbd "M-n") 'vertico-next-group)
  (define-key vertico-map (kbd "M-e") 'vertico-previous-group))

;; ============================================================================
;; ORG MODE - Structure editing and navigation
;; ============================================================================

(with-eval-after-load 'org
  (evil-define-key 'normal org-mode-map
    ;; Meta movement for structure editing
    "M-m" 'org-metaleft
    "M-i" 'org-metaright
    "M-n" 'org-metadown
    "M-e" 'org-metaup
    ;; Shift-meta for moving subtrees
    "M-N" 'org-shiftmetadown
    "M-E" 'org-shiftmetaup
    "M-M" 'org-shiftmetaleft
    "M-I" 'org-shiftmetaright
    ;; Navigation
    "C-c C-n" 'org-next-visible-heading
    "C-c C-e" 'org-previous-visible-heading
    ;; Keep standard bindings that don't conflict
    "gm" 'org-backward-heading-same-level
    "gi" 'org-forward-heading-same-level))

;; ============================================================================
;; EGLOT - Language server navigation (replaces lsp-mode section)
;; ============================================================================

(with-eval-after-load 'eglot
  (evil-define-key 'normal eglot-mode-map
    ;; Go-to commands
    "gd" 'xref-find-definitions
    "gr" 'xref-find-references
    "gD" 'eglot-find-declaration
    "gI" 'eglot-find-implementation
    "gt" 'eglot-find-typeDefinition
    ;; Navigation through diagnostics (using flymake)
    "C-c n" 'flymake-goto-next-error
    "C-c e" 'flymake-goto-prev-error
    "]d" 'flymake-goto-next-error
    "[d" 'flymake-goto-prev-error))

;; ============================================================================
;; FLYMAKE - Diagnostic navigation (replaces lsp-ui)
;; ============================================================================

(with-eval-after-load 'flymake
  (evil-define-key 'normal flymake-mode-map
    "C-c n" 'flymake-goto-next-error
    "C-c e" 'flymake-goto-prev-error
    "]d" 'flymake-goto-next-error
    "[d" 'flymake-goto-prev-error))

;; ============================================================================
;; XREF - Cross-reference navigation (used by eglot)
;; ============================================================================

(with-eval-after-load 'xref
  (evil-define-key 'normal xref--xref-buffer-mode-map
    "n" 'xref-next-line
    "e" 'xref-prev-line
    "gn" 'xref-next-group
    "ge" 'xref-prev-group))

;; ============================================================================
;; DAP MODE - Debugger navigation
;; ============================================================================

(with-eval-after-load 'dap-mode
  (evil-define-key 'normal dap-mode-map
    "C-c d n" 'dap-next
    "C-c d e" 'dap-step-out
    "C-c d i" 'dap-step-in
    "C-c d c" 'dap-continue))

;; ============================================================================
;; HELP MODE - Documentation navigation
;; ============================================================================

(with-eval-after-load 'help-mode
  (evil-define-key 'normal help-mode-map
    "n" 'evil-next-line
    "e" 'evil-previous-line
    "m" 'help-go-back
    "i" 'help-go-forward
    "M" 'help-go-back
    "I" 'help-go-forward))

;; ============================================================================
;; INFO MODE - Info manual navigation
;; ============================================================================

(with-eval-after-load 'info
  (evil-define-key 'normal Info-mode-map
    "n" 'evil-next-line
    "e" 'evil-previous-line
    "m" 'Info-backward-node
    "i" 'Info-forward-node
    "M" 'Info-menu
    "I" 'Info-index
    "gm" 'Info-prev
    "gi" 'Info-next
    "ge" 'Info-up))

;; ============================================================================
;; DEADGREP - Search results navigation
;; ============================================================================

(with-eval-after-load 'deadgrep
  (evil-define-key 'normal deadgrep-mode-map
    "n" 'deadgrep-forward
    "e" 'deadgrep-backward
    "m" 'deadgrep-backward-filename
    "i" 'deadgrep-forward-filename
    "gn" 'deadgrep-forward-match
    "ge" 'deadgrep-backward-match))

;; ============================================================================
;; DIFF-HL - Version control diff navigation
;; ============================================================================

(with-eval-after-load 'diff-hl
  (evil-define-key 'normal 'global
    "[c" 'diff-hl-previous-hunk
    "]c" 'diff-hl-next-hunk
    "C-c v n" 'diff-hl-next-hunk
    "C-c v e" 'diff-hl-previous-hunk))

;; ============================================================================
;; CENTAUR-TABS - Tab navigation alternatives
;; ============================================================================

(with-eval-after-load 'centaur-tabs
  ;; Add additional bindings beyond C-prior/next
  (evil-define-key 'normal 'global
    "g m" 'centaur-tabs-backward
    "g i" 'centaur-tabs-forward
    "g M" 'centaur-tabs-move-current-tab-to-left
    "g I" 'centaur-tabs-move-current-tab-to-right))

;; ============================================================================
;; MAGIT - Already configured, adding a few more
;; ============================================================================

(with-eval-after-load 'magit
  ;; Your existing bindings are good, adding section navigation
  (evil-define-key 'normal magit-mode-map
    "n" 'evil-next-visual-line
    "e" 'evil-previous-visual-line
    "m" 'evil-backward-char
    "i" 'evil-forward-char
    "C-n" 'magit-section-forward
    "C-e" 'magit-section-backward
    "M-n" 'magit-section-forward-sibling
    "M-e" 'magit-section-backward-sibling
    "j" 'evil-search-next
    "J" 'evil-search-previous
    "M-m" 'magit-merge
    "M-e" 'magit-ediff
    "M-i" 'magit-gitignore))

;; ============================================================================
;; DIRED - Already configured, ensuring completeness
;; ============================================================================

(with-eval-after-load 'dired
  (evil-define-key 'normal dired-mode-map
    "n" 'dired-next-line
    "e" 'dired-previous-line
    "m" 'dired-up-directory
    "i" 'dired-find-file
    "M" 'dired-do-rename
    "I" 'dired-maybe-insert-subdir))

;; ============================================================================
;; COMPANY - Already configured, keeping for reference
;; ============================================================================

(with-eval-after-load 'company
  (evil-collection-define-key nil 'company-active-map
    (kbd "C-n") 'company-select-next-or-abort
    (kbd "C-e") 'company-select-previous-or-abort
    (kbd "M-n") 'company-select-next
    (kbd "M-e") 'company-select-previous)
  (evil-collection-define-key nil 'company-search-map
    (kbd "C-n") 'company-select-next-or-abort
    (kbd "C-e") 'company-select-previous-or-abort
    (kbd "M-n") 'company-select-next
    (kbd "M-e") 'company-select-previous))

;; ============================================================================
;; ESHELL - Already configured, keeping for reference
;; ============================================================================

(with-eval-after-load 'eshell
  (evil-define-key 'normal eshell-mode-map
    "C-n" 'eshell-next-prompt
    "C-e" 'eshell-previous-prompt
    "M-m" 'eshell-backward-argument
    "M-i" 'eshell-forward-argument
    "C-m" 'eshell-previous-matching-input-from-input
    "C-i" 'eshell-next-matching-input-from-input)
  
  (evil-define-key 'visual eshell-mode-map
    "C-n" 'eshell-next-prompt
    "C-e" 'eshell-previous-prompt))

;; ============================================================================
;; VTERM - Already configured, keeping for reference
;; ============================================================================

(with-eval-after-load 'vterm
  (evil-define-key 'normal vterm-mode-map
    "t" 'evil-collection-vterm-insert
    "T" 'evil-collection-vterm-insert-line
    "n" 'evil-collection-vterm-next-line))

;; ============================================================================
;; EWW - Web browser
;; ============================================================================

(with-eval-after-load 'eww
  (evil-define-key 'normal eww-mode-map
    "M" 'eww-back-url
    "I" 'eww-forward-url
    "m" 'eww-back-url
    "i" 'eww-forward-url
    "n" 'evil-next-line
    "e" 'evil-previous-line))

;; ============================================================================
;; OCCUR MODE - Search results
;; ============================================================================

(with-eval-after-load 'replace
  (evil-define-key 'normal occur-mode-map
    "n" 'occur-next
    "e" 'occur-prev
    "gn" 'next-error-no-select
    "ge" 'previous-error-no-select))

;; ============================================================================
;; GREP MODE - Grep results
;; ============================================================================

(with-eval-after-load 'grep
  (evil-define-key 'normal grep-mode-map
    "n" 'compilation-next-error
    "e" 'compilation-previous-error
    "gn" 'next-error-no-select
    "ge" 'previous-error-no-select))

;; ============================================================================
;; COMPILATION MODE - Build output
;; ============================================================================

(with-eval-after-load 'compile
  (evil-define-key 'normal compilation-mode-map
    "n" 'compilation-next-error
    "e" 'compilation-previous-error
    "gn" 'next-error-no-select
    "ge" 'previous-error-no-select))

;; ============================================================================
;; PROCED - Process list
;; ============================================================================

(with-eval-after-load 'proced
  (evil-define-key 'normal proced-mode-map
    "n" 'next-line
    "e" 'previous-line
    "m" 'proced-mark
    "i" 'proced-unmark))

;; ============================================================================
;; IBUFFER - Buffer list
;; ============================================================================

(with-eval-after-load 'ibuffer
  (evil-define-key 'normal ibuffer-mode-map
    "n" 'ibuffer-forward-line
    "e" 'ibuffer-backward-line
    "m" 'ibuffer-mark-forward
    "M" 'ibuffer-unmark-backward))

;; ============================================================================
;; FLYSPELL - Spell checking
;; ============================================================================

(with-eval-after-load 'flyspell
  (evil-define-key 'normal flyspell-mode-map
    "C-c s n" 'flyspell-goto-next-error
    "]s" 'flyspell-goto-next-error
    "[s" 'flyspell-goto-previous-error))

;; ============================================================================
;; CALC - Calculator
;; ============================================================================

(with-eval-after-load 'calc
  (evil-define-key 'normal calc-mode-map
    "n" 'calc-roll-down
    "e" 'calc-roll-up
    "m" 'calc-pop
    "i" 'calc-enter))

;; ============================================================================
;; EVIL COLLECTION OVERRIDE
;; Apply bindings to all evil-collection managed modes
;; ============================================================================

(with-eval-after-load 'evil-collection
  ;; Hook into evil-collection's setup to apply our custom bindings
  (defun my/evil-collection-setup-hook (mode mode-keymaps &rest _rest)
    "Apply custom bindings after evil-collection sets up a mode."
    (dolist (keymap mode-keymaps)
      (when (keymapp (symbol-value keymap))
        (evil-define-key '(normal motion) (symbol-value keymap)
          "m" 'evil-backward-char
          "n" 'evil-next-line
          "e" 'evil-previous-line
          "i" 'evil-forward-char))))
  
  (add-hook 'evil-collection-setup-hook #'my/evil-collection-setup-hook))

;; ============================================================================
;; UTILITY FUNCTION - Apply to any new mode
;; ============================================================================

(defun my/apply-custom-evil-bindings (mode-map)
  "Apply custom movement bindings to MODE-MAP.
Usage: (my/apply-custom-evil-bindings 'some-mode-map)"
  (evil-define-key 'normal mode-map
    "m" 'evil-backward-char
    "n" 'evil-next-line
    "e" 'evil-previous-line
    "i" 'evil-forward-char
    "M" 'evil-window-top
    "I" 'evil-window-bottom
    "K" 'evil-window-middle))

;; ============================================================================
;; PROJECTILE - Project management
;; ============================================================================

(with-eval-after-load 'projectile
  ;; Projectile mostly uses C-c p prefix, but some navigation keys
  (evil-define-key 'normal projectile-mode-map
    "C-c p n" 'projectile-next-project-buffer
    "C-c p e" 'projectile-previous-project-buffer))

(provide 'evil-custom-bindings)
;;; evil-custom-bindings.el ends here
