; first_of_all.el

;== とりあえずauto-installとpackage動かしたい ===========================
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

;--- package.el --------------------------------------
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)
;-----------------------------------------------------

;--- バックアップ ------------------------------------
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
;-----------------------------------------------------
;================================================================
