; init.el

; References
;  http://d.hatena.ne.jp/sandai/20120304
;  https://bitbucket.org/sakito/dot.emacs.d/src

(load (expand-file-name (concat (getenv "HOME") "/.emacs.d/first_of_all")))

;== 一般設定 ====================================================
(require 'cl)  ; common-lispをエミュレート

;--- 表示 --------------------------------------------
(setq inhibit-startup-message t)
(setq line-number-mode t)
(setq column-number-mode t)
(menu-bar-mode -1)
(setq-default line-spaceing 0)

(split-window-horizontally)
(other-window 1)
(split-window-vertically)
(eshell)
(other-window 2)

;(require 'color-theme nil t)
;(color-theme-initialize)
;(color-theme-joe-noh)

(setq ps-multibyte-buffer 'non-latin-printer)
(setq ps-print-header nil)

(require 'linum)
(global-linum-mode t)
(setq linum-format "%5d|")
;-----------------------------------------------------

;--- 編集 --------------------------------------------
(prefer-coding-system 'utf-8)
(setq transient-mark-mode t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq shell-ask-to-save-history (quote always))
(savehist-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)
;-----------------------------------------------------
;================================================================


;== 言語設定 ====================================================
;--- Ruby --------------------------------------------
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
(setq ruby-electric-expand-delimiters-list nil)

(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)
;-----------------------------------------------------

;--- TeX ---------------------------------------------
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq auto-mode-alist (append
  '(("\\.tex$" . yatex-mode)
    ("\\.ltx$" . yatex-mode)
    ("\\.cls$" . yatex-mode)
    ("\\.sty$" . yatex-mode)
    ("\\.clo$" . yatex-mode)
    ("\\.bbl$" . yatex-mode)) auto-mode-alist))
(add-hook 'yatex-mode-hook
  '(lambda()
    (auto-fill-mode nil)))
;-----------------------------------------------------

;--- PHP ---------------------------------------------
(require 'php-mode)
;----------------------------------------------------

;--- ReST --------------------------------------------
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
;-----------------------------------------------------

;--- HAML --------------------------------------------
(require 'haml-mode)
(add-hook 'haml-mode-hook
  '(lambda ()
     (setq indent-tabs-mode nil)
     (define-key haml-mode-map "\C-m" 'newline-and-indent)))
;-----------------------------------------------------
;================================================================


;== 便利系 ======================================================
;(require 'anything-startup nil t)
;(setq anything-c-filelist-file-name "/tmp/all.filelist")
;(global-set-key "\C-\\" 'anything-filelist+)

(require 'popwin)
(setq anything-samewindow nil)
(push '("*anything*" :height 20) popwin:special-display-config)
(setq display-buffer-function 'popwin:display-buffer)

(require 'ido)
(ido-mode t)

(require 'jaunte)
(global-set-key "\C-c\C-j" 'jaunte)

(require 'whitespace)
(setq whitespace-style '(face trailing space-before-tab space-after-tab))
(global-whitespace-mode t)

(require 'recentf)
(setq recentf-mode t)
(global-set-key [f12] 'recentf-open-files)

(require 'ag)
(setq ag-highlight-search t)
(global-set-key [f6] 'ag)
;================================================================

;== 関数定義 ====================================================
(defun update-anything-filelist ()
  (interactive)
  (save-window-excursion
    (async-shell-command "sudo ruby ~/.emacs.d/script/contrib_make-filelist.rb > /tmp/all.filelist")))
;================================================================

;== キーバインド ================================================
(global-set-key "\C-z" 'other-window)
(global-set-key "\C-x:" 'goto-line)
(global-set-key "\C-c\C-l" 'toggle-truncate-lines)
(global-set-key [f8] 'eshell)
;================================================================
;================================================================
