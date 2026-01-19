;;; init.el --- Bootstrap literate configuration -*- lexical-binding: t; -*-

;;; Commentary:
;; This file bootstraps the literate Emacs configuration from config.org

;;; Code:

;; Increase GC threshold during startup
(setq gc-cons-threshold most-positive-fixnum)

;; ============================================================================
;; PACKAGE MANAGEMENT
;; ============================================================================

(message "Setting up package management...")

(require 'package)
(setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; Refresh package list on first run
(unless package-archive-contents
  (message "Refreshing package contents...")
  (package-refresh-contents))

;; Install use-package
(unless (package-installed-p 'use-package)
  (message "Installing use-package...")
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(message "Package management ready.")

;; ============================================================================
;; ORG MODE
;; ============================================================================

(message "Ensuring org-mode is available...")

;; Org should be built-in, but install if missing
(unless (package-installed-p 'org)
  (message "Installing org-mode...")
  (package-install 'org))

(require 'org)
(message "Org-mode loaded.")

;; ============================================================================
;; TANGLE AND LOAD CONFIG
;; ============================================================================

(message "Loading configuration...")

(let ((config-org (expand-file-name "config.org" user-emacs-directory))
      (config-el (expand-file-name "config.el" user-emacs-directory)))
  
  ;; Check if config.org exists
  (unless (file-exists-p config-org)
    (error "ERROR: config.org not found at %s" config-org))
  
  (message "Found config.org")
  
  ;; Tangle if needed
  (when (or (not (file-exists-p config-el))
            (file-newer-than-file-p config-org config-el))
    (message "Tangling config.org...")
    (org-babel-tangle-file config-org config-el)
    (message "Tangling complete."))
  
  ;; Load the config
  (message "Loading config.el...")
  (load-file config-el)
  (message "Configuration loaded successfully!"))

;; ============================================================================
;; CLEANUP
;; ============================================================================

;; Reset GC threshold after startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 16 1024 1024))
            (message "*** Emacs startup complete in %s ***" (emacs-init-time))))

(provide 'init)
;;; init.el ends here
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
