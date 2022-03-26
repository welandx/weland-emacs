(use-package telega
  :ensure t
  :defer t)
(global-set-key (kbd "C-c a") 'telega)

;; (global-set-key (kbd "d"))
(with-eval-after-load 'telega
  (define-key telega-msg-button-map "k" nil))

(provide 'init-telega)
