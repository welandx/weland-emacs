(use-package magit
  :ensure t
  :defer t)

(global-set-key (kbd "C-c p") 'magit)

(use-package diff-hl
  :ensure t
  :defer t
  :config
  (global-diff-hl-mode))

(provide 'init-project)
