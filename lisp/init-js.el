(use-package web-mode
  :ensure t
  :defer t
  :custom
  (setq web-mode-enable-auto-pairing t))

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

(use-package tide
  :ensure t
  :defer t
  :hook (js2-mode . tide-setup))


;; (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(provide 'init-js)
