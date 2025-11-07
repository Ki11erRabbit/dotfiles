(in-package :lem-user)
(in-package :lem-vi-mode)

(vi-mode)

(undefine-key *normal-keymap* "i")
(define-key *normal-keymap* "t" 'lem-vi-mode/commands:vi-insert)

(undefine-key *normal-keymap* "I")
(define-key *normal-keymap* "T" 'lem-vi-mode/commands:vi-insert-line)

(undefine-key *normal-keymap* "h")
(define-key *normal-keymap* "m" 'lem-vi-mode/commands:vi-backward-char)

(undefine-key *normal-keymap* "j")
(define-key *normal-keymap* "n" 'lem-vi-mode/commands:vi-next-line)

(undefine-key *normal-keymap* "k")
(define-key *normal-keymap* "e" 'lem-vi-mode/commands:vi-previous-line)

(undefine-key *normal-keymap* "l")
(define-key *normal-keymap* "i" 'lem-vi-mode/commands:vi-forward-char)

(undefine-key *normal-keymap* "H")
(define-key *normal-keymap* "M" 'lem-vi-mode/commands:vi-move-to-window-top)

(undefine-key *normal-keymap* "J")
(define-key *normal-keymap* "N" 'lem-vi-mode/commands:vi-join-line)

;(undefine-key *normal-keymap* "K")
;(define-key *normal-keymap* "E" 'lem-vi-mode/commands:vi-previous-line)

(undefine-key *normal-keymap* "L")
(define-key *normal-keymap* "I" 'lem-vi-mode/commands:vi-move-to-window-top)

(undefine-key *normal-keymap* "j")
(define-key *normal-keymap* "j" 'lem-vi-mode/commands:vi-search-next)

(undefine-key *normal-keymap* "J")
(define-key *normal-keymap* "J" 'lem-vi-mode/commands:vi-search-previous)

(define-key *normal-keymap* "h" 'lem-vi-mode/commands:vi-forward-word-end)

(define-key *normal-keymap* "H" 'lem-vi-mode/commands:vi-backward-word-end)

(undefine-key *normal-keymap* "C-w h")
(define-key *normal-keymap* "C-w m" 'lem-vi-mode/commands:vi-window-move-left)

(undefine-key *normal-keymap* "C-w j")
(define-key *normal-keymap* "C-w n" 'lem-vi-mode/commands:vi-window-move-down)

(undefine-key *normal-keymap* "C-w k")
(define-key *normal-keymap* "C-w e" 'lem-vi-mode/commands:vi-window-move-up)

(undefine-key *normal-keymap* "C-w l")
(define-key *normal-keymap* "C-w i" 'lem-vi-mode/commands:vi-window-move-left)


(undefine-key *visual-keymap* "h")
(define-key *visual-keymap* "m" 'lem-vi-mode/commands:vi-backward-char)

(undefine-key *visual-keymap* "j")
(define-key *visual-keymap* "n" 'lem-vi-mode/commands:vi-next-line)

(undefine-key *visual-keymap* "k")
(define-key *visual-keymap* "e" 'lem-vi-mode/commands:vi-previous-line)

(undefine-key *visual-keymap* "l")
(define-key *visual-keymap* "i" 'lem-vi-mode/commands:vi-forward-char)

(undefine-key *visual-keymap* "H")
(define-key *visual-keymap* "M" 'lem-vi-mode/commands:vi-move-to-window-top)

(undefine-key *visual-keymap* "J")
(define-key *visual-keymap* "N" 'lem-vi-mode/commands:vi-join-line)

;(undefine-key *visual-keymap* "K")
;(define-key *visual-keymap* "E" 'lem-vi-mode/commands:vi-previous-line)

(undefine-key *visual-keymap* "L")
(define-key *visual-keymap* "I" 'lem-vi-mode/commands:vi-move-to-window-top)

(undefine-key *visual-keymap* "j")
(define-key *visual-keymap* "j" 'lem-vi-mode/commands:vi-search-next)

(undefine-key *visual-keymap* "J")
(define-key *visual-keymap* "J" 'lem-vi-mode/commands:vi-search-previous)

(define-key *visual-keymap* "h" 'lem-vi-mode/commands:vi-forward-word-end)

(define-key *visual-keymap* "H" 'lem-vi-mode/commands:vi-backward-word-end)
