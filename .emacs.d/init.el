(load (expand-file-name (concat (getenv "HOME") "/.emacs.d/first_of_all")))

;== General Settings =========
(setq inhibit-startup-message t)
(setq column-number-mode t)
(setq transient-mark-mode t)
(menu-bar-mode -1)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq shell-ask-to-save-history (quote always))
;=============================


;;; Perl settng
(require 'cl)
(autoload 'perltidy "perltidy-mode" nil t)
(autoload 'perltidy-mode "perltidy-mode" nil t)
(eval-after-load "cperl-mode"
  '(add-hook 'cperl-mode-hook 'perltidy-mode))
(eval-after-load "perl-mode"
  '(add-hook 'perl-mode-hook 'perltidy-mode))


;;; Ruby Setting
;(require 'rinari)
;(require 'ruby-block)
;(require 'ruby-electric)


;;; Scala Setting
(require 'ensime)
(require 'scala-mode2)
(add-hook 'scala-mode-hook
  '(lambda()
    (setq scala-indent:align-parameters t)
    (setq scala-indent:align-forms      t))
  'ensime-scala-mode-hook)

;;; C Setting
(add-hook 'c-mode-hook
  '(lambda()
    (c-set-style "k&r")
    (setq c-basic-offset 4)
    (setq indent-tabs-mode nil)
    (setq c-auto-newline nil)
    (local-set-key (kbd "RET") 'reindent-then-newline-and-indent)))


;;; YaTeX Setting
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq auto-mode-alist (append
  '(("\\.tex$" . yatex-mode)
    ("\\.ltx$" . yatex-mode)
    ("\\.cls$" . yatex-mode)
    ("\\.sty$" . yatex-mode)
    ("\\.clo$" . yatex-mode)
    ("\\.bbl$" . yatex-mode)) auto-mode-alist))


;;; ReST Setting
(require 'rst)
(setq auto-mode-alist (append
  '(("\\.rst$"  . rst-mode)
    ("\\.rest$" . rst-mode)) auto-mode-alist))
(add-hook 'rst-mode-hook
  '(lambda()
    (setq indent-tabs-mode nil))
  (custom-set-variables
   '(rst-level-face-base-light 30))
  (custom-set-faces
   '(ensime-errline           ((t (:underline t))))
   '(ensime-errline-highlight ((t (:underline t))))
   '(rst-level-1-face ((t (:background "grey30" :foreground "white" :weight bold))) t)
   '(rst-level-2-face ((t  nil                                                   )) t)
   '(rst-level-3-face ((t (:background "grey16" :foreground "green" :weight bold))) t)
   '(rst-level-4-face ((t (:background "grey 9" :foreground "red"   :weight bold))) t)))

;;; Usefuls
(require 'ido)         ; Great Navigation
(ido-mode t)

(require 'jaunte)      ; Travel Around Source Code

(require 'whitespace)  ; Visualize Redundant White Spaces
(setq whitespace-style '(face trailing space-before-tab space-after-tab))
(global-whitespace-mode t)

(require 'recentf)     ; Visit the Files opened before
(setq recentf-mode t)
(global-set-key [f12] 'recentf-open-files)


;;; Color Print Source Code
(setq ps-multibyte-buffer 'non-latin-printer)
(setq ps-print-header nil)


;;; Split windows
(split-window-horizontally)
(other-window 1)
(split-window-vertically)
(eshell)
(other-window 2)


;;; Key binds
(global-set-key "\C-z" 'other-window)
(global-set-key "\M-p" 'perltidy-mode)
(global-set-key "\C-c\C-j" 'jaunte)
(global-set-key "\C-x:" 'goto-line)
(global-set-key "\C-c\C-l" 'toggle-truncate-lines)
(global-set-key [f8] 'eshell)

 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
