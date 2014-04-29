; first_of_all.el

;== とりあえずauto-install動かしたい ===========================
;--- パス --------------------------------------------
(let ((default-directory "~/Dropbox/elisp/"))
  (setq load-path (cons default-directory load-path))
  (normal-top-level-add-subdirs-to-load-path))
;-----------------------------------------------------

;--- auto-install ------------------------------------
(when (require 'auto-install nil t)
  (setq auto-install-directory "~/.emacs.d/elisp/")
  (auto-install-update-emacswiki-package-name t)
  (auto-install-compatibility-setup))
;-----------------------------------------------------

;--- バックアップ ------------------------------------
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
;-----------------------------------------------------
;================================================================
