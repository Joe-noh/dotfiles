;#############################
;
; 
;
;#############################

;== Load Path Setting ========
(let ((default-directory "~/.emacs.d/elisp/"))
  (setq load-path (cons default-directory load-path))
  (normal-top-level-add-subdirs-to-load-path))
;=============================

;== auto-install =============
(when (require 'auto-install nil t)
  (setq auto-install-directory "~/.emacs.d/elisp/")
  (auto-install-update-emacswiki-package-name t)
  (auto-install-compatibility-setup))
;=============================

;== backup directory =========
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
;=============================
