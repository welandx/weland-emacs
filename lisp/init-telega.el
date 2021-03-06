;;; -*- lexical-binding: t -*-
(use-package telega
  :ensure t
  :defer t
  :config
  (telega-notifications-mode t)
  (telega-mode-line-mode 1))
(global-set-key (kbd "C-c a") 'telega)

;; (global-set-key (kbd "d"))
(with-eval-after-load 'telega
  (define-key telega-msg-button-map "k" nil)
  (define-key telega-msg-button-map "h" nil))

(global-set-key (kbd "C-c s") 'telega-sticker-choose-favorite-or-recent)

(provide 'init-telega)
