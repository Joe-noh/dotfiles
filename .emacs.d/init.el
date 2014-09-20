; init.el

; References
;  http://d.hatena.ne.jp/sandai/20120304
;  https://bitbucket.org/sakito/dot.emacs.d/src

(load (expand-file-name (concat (getenv "HOME") "/.emacs.d/first_of_all")))

;--- 編集 --------------------------------------------
(prefer-coding-system 'utf-8)
(setq transient-mark-mode t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq shell-ask-to-save-history (quote always))
(savehist-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)

(global-company-mode)
;-----------------------------------------------------
;================================================================

;== 言語設定 ====================================================
;--- Ruby --------------------------------------------
(add-to-list 'auto-mode-alist '("Capfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))

(require 'ruby-end)
(require 'ruby-block)
(add-hook 'enh-ruby-mode-hook
  '(lambda ()
    (abbrev-mode 1)
    (electric-pair-mode t)
    (electric-indent-mode t)
    (electric-layout-mode t)

    (ruby-block-mode t)
    (setq ruby-block-highlight-toggle t)))

(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'enh-ruby-mode-hook '(lambda ()
  (define-key enh-ruby-mode-map "\C-xj" 'robe-jump)))
(push 'company-robe company-backends)

(add-hook 'eshell-mode-hook '(lambda () (company-mode 0)))

;-- Rails ---------
(require 'rinari)

(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook (lambda () (rinari-launch)))
;------------------
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
(setq auto-mode-alist (append
  '(("\\.haml$" . haml-mode)
    ("\\.hamlbars$" . haml-mode)) auto-mode-alist))
(add-hook 'haml-mode-hook
  '(lambda ()
     (setq indent-tabs-mode nil)
     (define-key haml-mode-map "\C-m" 'newline-and-indent)))
;-----------------------------------------------------

;--- Coffee ------------------------------------------
(defun coffee-custom () "coffee-mode-hook"
  (and (set (make-local-variable 'tab-width) 2)
       (set (make-local-variable 'coffee-tab-width) 2)))

(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))
;-----------------------------------------------------
;================================================================


;== 便利系 ======================================================
(show-paren-mode 1)

(require 'popwin)
(setq helm-samewindow nil)
(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:special-display-config '(("*compilatoin*" :noselect t)
                                      ("helm" :regexp t :height 0.4)))

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

(when (require 'helm-config nil t)
  (helm-mode 1)

  (define-key global-map (kbd "M-x")     'helm-M-x)
  (define-key global-map (kbd "C-x C-f") 'helm-find-files)
  (define-key global-map (kbd "C-x C-r") 'helm-recentf)
  (define-key global-map (kbd "M-y")     'helm-show-kill-ring)
  (define-key global-map (kbd "C-c i")   'helm-imenu)
  (define-key global-map (kbd "C-x b")   'helm-buffers-list)

  (define-key helm-map (kbd "C-h") 'delete-backward-char)
  (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
  (define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
  (define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)

  ;; Disable helm in some functions
  (add-to-list 'helm-completing-read-handlers-alist '(find-alternate-file . nil))

  ;; Emulate `kill-line' in helm minibuffer
  (setq helm-delete-minibuffer-contents-from-point t)
  (defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
    "Emulate `kill-line' in helm minibuffer"
    (kill-new (buffer-substring (point) (field-end))))

  (defadvice helm-ff-kill-or-find-buffer-fname (around execute-only-if-exist activate)
    "Execute command only if CANDIDATE exists"
    (when (file-exists-p candidate)
      ad-do-it))

  (defadvice helm-ff-transform-fname-for-completion (around my-transform activate)
    "Transform the pattern to reflect my intention"
    (let* ((pattern (ad-get-arg 0))
           (input-pattern (file-name-nondirectory pattern))
           (dirname (file-name-directory pattern)))
      (setq input-pattern (replace-regexp-in-string "\\." "\\\\." input-pattern))
      (setq ad-return-value
            (concat dirname
                    (if (string-match "^\\^" input-pattern)
                        ;; '^' is a pattern for basename
                        ;; and not required because the directory name is prepended
                        (substring input-pattern 1)
                      (concat ".*" input-pattern))))))

  (custom-set-faces
    '(helm-buffer-directory ((t (:foreground "Blue" :weight bold))))
    '(helm-ff-directory ((t (:foreground "Blue" :weight bold))))
    '(helm-ff-file ((t nil)))))
;================================================================


;== キーバインド ================================================
(global-set-key "\C-z" 'other-window)
(global-set-key "\C-x:" 'goto-line)
(global-set-key "\C-c\C-l" 'toggle-truncate-lines)
(global-set-key [f8] 'eshell)

(when (eq system-type 'darwin)
  (setq ns-command-modifier (quote meta)))
;================================================================

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

(setq ps-multibyte-buffer 'non-latin-printer)
(setq ps-print-header nil)

(require 'linum)
(global-linum-mode t)
(setq linum-format "%5d|")
;-----------------------------------------------------
;================================================================
