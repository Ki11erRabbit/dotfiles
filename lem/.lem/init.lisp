(in-package :lem-user)
(in-package :lem-vi-mode)

(lem/line-numbers:toggle-line-numbers)

(add-hook *prompt-after-activate-hook*
          (lambda ()
            (call-command 'lem/prompt-window::prompt-completion nil)))

(add-hook *prompt-deactivate-hook*
          (lambda ()
            (lem/completion-mode:completion-end)))

(lem-vi-mode:vi-mode)

(undefine-key lem-vi-mode:*normal-keymap* "i")
(define-key lem-vi-mode:*normal-keymap* "t" 'lem-vi-mode/commands:vi-insert)

(undefine-key lem-vi-mode:*normal-keymap* "I")
(define-key lem-vi-mode:*normal-keymap* "T" 'lem-vi-mode/commands:vi-insert-line)

(undefine-key lem-vi-mode:*normal-keymap* "h")
(define-key lem-vi-mode:*normal-keymap* "m" 'lem-vi-mode/commands:vi-backward-char)

(undefine-key lem-vi-mode:*normal-keymap* "j")
(define-key lem-vi-mode:*normal-keymap* "n" 'lem-vi-mode/commands:vi-next-line)

(undefine-key lem-vi-mode:*normal-keymap* "k")
(define-key lem-vi-mode:*normal-keymap* "e" 'lem-vi-mode/commands:vi-previous-line)

(undefine-key lem-vi-mode:*normal-keymap* "l")
(define-key lem-vi-mode:*normal-keymap* "i" 'lem-vi-mode/commands:vi-forward-char)

(undefine-key lem-vi-mode:*normal-keymap* "H")
(define-key lem-vi-mode:*normal-keymap* "M" 'lem-vi-mode/commands:vi-move-to-window-top)

(undefine-key lem-vi-mode:*normal-keymap* "J")
(define-key lem-vi-mode:*normal-keymap* "N" 'lem-vi-mode/commands:vi-join-line)

;(undefine-key lem-vi-mode:*normal-keymap* "K")
;(define-key lem-vi-mode:*normal-keymap* "E" 'lem-vi-mode/commands:vi-previous-line)

(undefine-key lem-vi-mode:*normal-keymap* "L")
(define-key lem-vi-mode:*normal-keymap* "I" 'lem-vi-mode/commands:vi-move-to-window-top)

(undefine-key lem-vi-mode:*normal-keymap* "j")
(define-key lem-vi-mode:*normal-keymap* "j" 'lem-vi-mode/commands:vi-search-next)

(undefine-key lem-vi-mode:*normal-keymap* "J")
(define-key lem-vi-mode:*normal-keymap* "J" 'lem-vi-mode/commands:vi-search-previous)

(define-key lem-vi-mode:*normal-keymap* "h" 'lem-vi-mode/commands:vi-forward-word-end)

(define-key lem-vi-mode:*normal-keymap* "H" 'lem-vi-mode/commands:vi-backward-word-end)

(undefine-key lem-vi-mode:*normal-keymap* "C-w h")
(define-key lem-vi-mode:*normal-keymap* "C-w m" 'lem-vi-mode/commands:vi-window-move-left)

(undefine-key lem-vi-mode:*normal-keymap* "C-w j")
(define-key lem-vi-mode:*normal-keymap* "C-w n" 'lem-vi-mode/commands:vi-window-move-down)

(undefine-key lem-vi-mode:*normal-keymap* "C-w k")
(define-key lem-vi-mode:*normal-keymap* "C-w e" 'lem-vi-mode/commands:vi-window-move-up)

(undefine-key lem-vi-mode:*normal-keymap* "C-w l")
(define-key lem-vi-mode:*normal-keymap* "C-w i" 'lem-vi-mode/commands:vi-window-move-left)


(undefine-key lem-vi-mode:*visual-keymap* "h")
(define-key lem-vi-mode:*visual-keymap* "m" 'lem-vi-mode/commands:vi-backward-char)

(undefine-key lem-vi-mode:*visual-keymap* "j")
(define-key lem-vi-mode:*visual-keymap* "n" 'lem-vi-mode/commands:vi-next-line)

(undefine-key lem-vi-mode:*visual-keymap* "k")
(define-key lem-vi-mode:*visual-keymap* "e" 'lem-vi-mode/commands:vi-previous-line)

(undefine-key lem-vi-mode:*visual-keymap* "l")
(define-key lem-vi-mode:*visual-keymap* "i" 'lem-vi-mode/commands:vi-forward-char)

(undefine-key lem-vi-mode:*visual-keymap* "H")
(define-key lem-vi-mode:*visual-keymap* "M" 'lem-vi-mode/commands:vi-move-to-window-top)

(undefine-key lem-vi-mode:*visual-keymap* "J")
(define-key lem-vi-mode:*visual-keymap* "N" 'lem-vi-mode/commands:vi-join-line)

;(undefine-key lem-vi-mode:*visual-keymap* "K")
;(define-key lem-vi-mode:*visual-keymap* "E" 'lem-vi-mode/commands:vi-previous-line)

(undefine-key lem-vi-mode:*visual-keymap* "L")
(define-key lem-vi-mode:*visual-keymap* "I" 'lem-vi-mode/commands:vi-move-to-window-top)

(undefine-key lem-vi-mode:*visual-keymap* "j")
(define-key lem-vi-mode:*visual-keymap* "j" 'lem-vi-mode/commands:vi-search-next)

(undefine-key lem-vi-mode:*visual-keymap* "J")
(define-key lem-vi-mode:*visual-keymap* "J" 'lem-vi-mode/commands:vi-search-previous)

(define-key lem-vi-mode:*visual-keymap* "h" 'lem-vi-mode/commands:vi-forward-word-end)

(define-key lem-vi-mode:*visual-keymap* "H" 'lem-vi-mode/commands:vi-backward-word-end)

(define-key lem/completion-mode::*completion-mode-keymap* "C-n" 'lem/completion-mode::completion-narrowing-down-or-next-line)
(define-key lem/completion-mode::*completion-mode-keymap* "C-e" 'lem/completion-mode::completion-previous-line)

