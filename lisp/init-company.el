(use-package company
    :ensure t
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


;; Corfu setup, archived

;; (use-package corfu
;;   :ensure t
;;   ;; Optional customizations
;;   :custom
;;   ;; (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
;;   (corfu-auto t)                 ;; Enable auto completion
;;   (corfu-auto-prefix 2)  
;;   ;; (corfu-separator ?\s)          ;; Orderless field separator
;;   ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
;;   ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
;;   ;; (corfu-preview-current nil)    ;; Disable current candidate preview
;;   ;; (corfu-preselect-first nil)    ;; Disable candidate preselection
;;   ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
;;   ;; (corfu-echo-documentation nil) ;; Disable documentation in the echo area
;;   ;; (corfu-scroll-margin 5)        ;; Use scroll margin

;;   ;; You may want to enable Corfu only for certain modes.
;;   ;; :hook ((prog-mode . corfu-mode)
;;   ;;        (shell-mode . corfu-mode)
;;   ;;        (eshell-mode . corfu-mode))

;;   ;; Recommended: Enable Corfu globally.
;;   ;; This is recommended since dabbrev can be used globally (M-/).
;;   :init
;;   (corfu-global-mode))

;; ;; Use dabbrev with Corfu!
;; (use-package dabbrev
;;   ;; Swap M-/ and C-M-/
;;   :bind (("M-/" . dabbrev-completion)
;;          ("C-M-/" . dabbrev-expand)))

;; ;; A few more useful configurations...
;; (use-package emacs
;;   :init
;;   ;; TAB cycle if there are only few candidates
;;   (setq completion-cycle-threshold 3)

;;   ;; Emacs 28: Hide commands in M-x which do not apply to the current mode.
;;   ;; Corfu commands are hidden, since they are not supposed to be used via M-x.
;;   ;; (setq read-extended-command-predicate
;;   ;;       #'command-completion-default-include-p)

;;   ;; Enable indentation+completion using the TAB key.
;;   ;; `completion-at-point' is often bound to M-TAB.
;;   (setq tab-always-indent 'complete))
;; (use-package kind-icon
;;   :ensure t
;;   :after corfu
;;   :custom
;;   (kind-icon-default-face 'corfu-default) ; to compute blended backgrounds correctly
;;   :config
;;   (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))
(provide 'init-company)
