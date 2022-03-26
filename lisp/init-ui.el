(menu-bar-mode -1)
(tool-bar-mode -1)
;; no scroll bar in minibuffer
(add-hook 'after-make-frame-functions
          (lambda (frame)
            (set-window-scroll-bars
             (minibuffer-window frame) 0 nil 0 nil t)))

(scroll-bar-mode -1)


(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;; 4-font
(defvar meomacs-fonts '((default . "Jetbrains Mono")
                        (unicode . "LXGW WenKai")
                        (modeline . "Jetbrains Mono")
                        (fixed . "Jetbrains Mono")
                        (variable . "LXGW WenKai"))
  "Fonts to use.")
  
(defvar meomacs-font-size 16
  "Current font size.")

(defun meomacs--get-font-family (key)
  (alist-get key meomacs-fonts))

(defun meomacs--get-font-spec (key)
  (format "%s-%d"
          (meomacs--get-font-family key)
          meomacs-font-size))

(defun meomacs-load-base-font ()
  "Load the default font for ascii characters."
  (let* ((font-spec (meomacs--get-font-spec 'default)))
    (set-frame-parameter nil 'font font-spec)
    (add-to-list 'default-frame-alist (cons 'font font-spec))))

(defun meomacs-load-face-font ()
  "Load fonts used in faces.

This function must be called after frame creation."
  (let ((modeline-font-spec (meomacs--get-font-spec 'modeline))
        (variable-font-spec (meomacs--get-font-spec 'variable))
        (fixed-font-spec (meomacs--get-font-spec 'fixed)))
    (set-face-attribute 'variable-pitch nil :font variable-font-spec :height 1.1)
    (set-face-attribute 'fixed-pitch nil :font fixed-font-spec)
    (set-face-attribute 'fixed-pitch-serif nil :font fixed-font-spec)
    (set-face-attribute 'mode-line nil :font modeline-font-spec)
    (set-face-attribute 'mode-line-inactive nil :font modeline-font-spec)
    (set-face-attribute 'tab-bar nil :font modeline-font-spec)))

(defun meomacs-load-ext-font ()
  "Load fonts used for non-ascii characters.

This function must be called after frame creation."
  (let ((font (frame-parameter nil 'font))
        (font-spec (font-spec :family (meomacs--get-font-family 'unicode))))
    (dolist (charset '(kana han hangul cjk-misc bopomofo symbol))
      (set-fontset-font font charset font-spec))))

(meomacs-load-base-font)

;; Available only when reloading
(when window-system
  (meomacs-load-ext-font)
  (meomacs-load-face-font))

;; Run after startup
(add-hook 'after-init-hook
          (lambda ()
            (when window-system
              (meomacs-load-ext-font)
              (meomacs-load-face-font))))

(use-package modus-themes
  :ensure t)
(require 'subr-x)
(require 'cl-lib)

;; (defvar meomacs-themes '(modus-operandi modus-vivendi)
;;   "Themes to use.")
(defvar meomacs-themes '(kaolin-valley-light kaolin-valley-dark)
  "Themes to use.")

(defun meomacs-load-theme ()
  (when-let ((theme (car meomacs-themes)))
    (message "Load theme: %s" (car meomacs-themes))
    (mapc 'disable-theme custom-enabled-themes)
    (load-theme theme t)
    ;; (meomacs-load-face-font)
    ))

(defun meomacs-next-theme ()
  (interactive)
  (when meomacs-themes
    (setq meomacs-themes (append (cdr meomacs-themes) (list (car meomacs-themes))))
    (meomacs-load-theme)))

(meomacs-load-theme)
;;(add-hook 'desktop-after-read-hook 'meomacs-load-theme)
(global-set-key (kbd "C-c t") 'meomacs-next-theme)


(provide 'init-ui)
