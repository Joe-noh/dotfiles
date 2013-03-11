(eval-when-compile
  (require 'color-theme))

(defun color-theme-joe-noh () ; Original Color Theme
  (interactive)
  (color-theme-install
   '(color-theme-joe-noh

     ((background-color . "#080808")
      (background-mode . dark)
      (foreground-color . "#e4e4e4")
      (cursor-color . "#bcbcbc"))

     (default ((t (:foreground "#e4e4e4" :background "#080808"))))

     (region ((t (:background "#303030"))))

     (mode-line ((t (:foreground "#e4e4e4" :background "#3a3a3a"))))
     (mode-line-buffer-id ((t (:foreground nil :background nil))))
     (mode-line-inactive ((t (:foreground "#e4e4e4" :background "#080808"))))

     ;; ハイライト
     (highlight ((t (:foreground "#000000" :background "#d70087"))))
     (hl-line ((t (:background "#af5f55"))))

     (font-lock-function-name-face ((t (:foreground "#ff5f5f" :underline t))))
     (font-lock-variable-name-face ((t (:foreground "#cdcd00"))))
     (font-lock-string-face ((t (:foreground "#5faf00"))))
     (font-lock-keyword-face ((t (:foreground "#00cde4" :bold t))))
     (font-lock-constant-face((t (:foreground "#d75f00"))))
     (font-lock-comment-face ((t (:foreground "#ffafaf"))))
     (font-lock-type-face ((t (:foreground "#875fd7"))))

     (show-paren-match-face ((t (:background "#875f5f"))))

     (css-selector ((t (:foreground "#5f5fff"))))
     (css-property ((t (:foreground "#d75f00"))))

     (nxml-element-local-name ((t (:foreground "#5f5fff"))))
     (nxml-attribute-local-name ((t (:foreground "#d787d7"))))
     (nxml-tag-delimiter ((t (:foreground "#3a3a3a"))))
     (nxml-markup-declaration-delimiter ((t (:foreground "#ff8787"))))

     (dired-directory ((t (:foreground "#5f5fff"))))
     (dired-symlink ((t (:foreground "#00cd00"))))

     (mmm-default-submode-face ((t (:foreground nil :background "#000000"))))
     )))

(provide 'color-theme-joe-noh)
