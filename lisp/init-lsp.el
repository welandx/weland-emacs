(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (python-mode . lsp)
         (java-mode . lsp)
         (c-mode . lsp)
         (html-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode
  :ensure t
  :defer t
  :hook 
  '(python-mode . lsp-ui-mode))

;; optionally if you want to use debugger
(use-package dap-mode
  :ensure t
  :defer t)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred

(use-package js2-mode :ensure t :defer 20
  :mode
  (("\\.js\\'" . js2-mode))
  :custom
  (js2-include-node-externs t)
  (js2-global-externs '("customElements"))
  (js2-highlight-level 3)
  (js2r-prefer-let-over-var t)
  (js2r-prefered-quote-type 2)
  (js-indent-align-list-continuation t)
  (global-auto-highlight-symbol-mode t)
  :config
  (setq js-indent-level 2)
  ;; patch in basic private field support
  (advice-add #'js2-identifier-start-p
            :after-until
            (lambda (c) (eq c ?#))))


(provide 'init-lsp)
