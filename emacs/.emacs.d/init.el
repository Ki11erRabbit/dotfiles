;;; init.el --- Bootstrap literate configuration -*- lexical-binding: t; -*-

;;; Commentary:
;; This file bootstraps the literate Emacs configuration from config.org
;; It loads org-mode and tangles the configuration if needed.

;;; Code:

;; Increase garbage collection threshold during startup
(setq gc-cons-threshold most-positive-fixnum)

;; Load org-mode for literate config
(require 'org)

;; Tangle and load the configuration
(let ((config-org (expand-file-name "config.org" user-emacs-directory))
      (config-el (expand-file-name "init.el" user-emacs-directory)))
  
  ;; Tangle if config.org is newer than init.el or if init.el doesn't exist
  (when (or (not (file-exists-p config-el))
            (file-newer-than-file-p config-org config-el))
    (message "Tangling configuration from config.org...")
    (org-babel-tangle-file config-org)))

;; Reset garbage collection threshold after startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 16 1024 1024))))

(provide 'init)
;;; init.el ends here
