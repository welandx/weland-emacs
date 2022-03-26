(use-package company
    :ensure t)
(global-company-mode 1)

(with-eval-after-load "company"
  (require 'company-tng)

  (add-hook 'company-mode-hook 'company-tng-mode)

  (define-key company-mode-map (kbd "M-n") 'company-complete-common)

  (define-key company-active-map (kbd "TAB") nil)
  (define-key company-active-map [tab] nil)
  (define-key company-active-map (kbd "C-n") nil)
  (define-key company-active-map (kbd "C-p") nil)
  (define-key company-active-map (kbd "M-n") 'company-select-next)
  (define-key company-active-map (kbd "M-p") 'company-select-previous)

  ;; Free SPC and RET, popup will no longer interrupt typing.
  (define-key company-active-map [escape] nil)
  (define-key company-active-map [return] nil)
  (define-key company-active-map (kbd "RET") nil)
  (define-key company-active-map (kbd "SPC") nil))

(provide 'init-company)
