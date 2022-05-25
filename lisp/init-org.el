;;; -*- lexical-binding: t -*-
(with-eval-after-load "org"
  (define-key org-mode-map (kbd "C-c v") 'visible-mode))

(global-set-key (kbd "C-c d") 'org-agenda)

(use-package org-roam
  :ensure t
  :config
  (setq org-roam-directory (expand-file-name "~/org")))
(defvar org-roam-keymap
  (let ((keymap (make-keymap)))
    (define-key keymap "l" 'org-roam-buffer-toggle)
    (define-key keymap "f" 'org-roam-node-find)
    (define-key keymap "g" 'org-roam-graph)
    (define-key keymap "i" 'org-roam-node-insert)
    (define-key keymap "c" 'org-roam-capture)
    (define-key keymap "s" 'org-roam-db-sync)
    keymap))

(defalias 'org-roam-keymap org-roam-keymap)

(global-set-key (kbd "C-c r") 'org-roam-keymap)

(with-eval-after-load "org-roam"
  (org-roam-setup))

(with-eval-after-load "org"
  (require 'org-tempo)
  (setq org-ellipsis "⤵"))

;; (require 'org-bullets)
;;  ;; make available "org-bullet-face" such that I can control the font size individually
;; (setq org-bullets-face-name (quote org-bullet-face))
;; (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;; (setq org-bullets-bullet-list '("✙" "♱" "♰" "☥" "✞" "✟" "✝" "†" "✠" "✚" "✜" "✛" "✢" "✣" "✤" "✥"))

(add-hook 'org-mode-hook 'org-indent-mode)

(defun meomacs--org-prettify-symbols ()
  (setq-local prettify-symbols-alist
              '(("#+begin_src" . "»")
                ("#+end_src" . "«")
                ("#+TITLE" . "题")
                ("#+title" . "题")
                ("#+AUTHOR" . "者")
                ("#+FILETAGS" . "签")
                ("#+begin_example" . "❯")
                ("#+end_example" . "❮")
                ("#+begin_quote" . "‟")
                ("#+end_quote" . "‟")
                ("[X]" . "☑")
                ("[ ]" . "☐")))
  (prettify-symbols-mode 1))

(add-hook 'org-mode-hook 'meomacs--org-prettify-symbols)

(setq org-hide-emphasis-markers t)

(with-eval-after-load "org"
  (add-to-list 'org-emphasis-alist '("=" (:box (:line-width -2 :color "gray50" :style released-button) :inherit org-verbatim))))

(with-eval-after-load "org"
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0)))

;; ui
(use-package olivetti
  :ensure t
  :hook 
  (org-mode . olivetti-mode))

;; agenda
(setq org-agenda-files (list(expand-file-name "~/org/todo")))

(use-package org-roam-ui
  :ensure t
  :after org-roam
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

;; (use-package org-download)


(provide 'init-org)
