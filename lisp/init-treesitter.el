(use-package tree-sitter
  :ensure t)
(use-package tree-sitter-langs
  :ensure t)

(add-hook 'python-mode-hook #'tree-sitter-mode)
;; (global-tree-sitter-mode)

(provide 'init-treesitter)
