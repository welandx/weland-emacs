(setq-default
 inhibit-startup-screen t
 warning-suppress-log-types '((comp))
 create-lockfiles nil
 ring-bell-function 'ignore
 indent-tabs-mode nil
 read-answer-short t
 make-backup-files nil)

;;(global-linum-mode 1)
(add-hook 'emacs-lisp-mode-hook #'linum-mode)
(add-hook 'python-mode-hook #'linum-mode)
(global-hl-line-mode 1)

;; (use-package awesome-pair
;;   :straight (awesome-pair :type git :host github :repo "manateelazycat/awesome-pair"))
;; (dolist (hook (list
;;                'emacs-lisp-mode-hook
;;                'lisp-interaction-mode-hook
;;                'lisp-mode-hook
;;                'sh-mode-hook
;;                'python-mode-hook
;;                'org-mode-hook
;;                'lua-mode-hook
;;                ))
;;   (add-hook hook '(lambda () (awesome-pair-mode 1))))
;; (define-key awesome-pair-mode-map (kbd "(") 'awesome-pair-open-round)
;; (define-key awesome-pair-mode-map (kbd "[") 'awesome-pair-open-bracket)
;; (define-key awesome-pair-mode-map (kbd "{") 'awesome-pair-open-curly)
;; (define-key awesome-pair-mode-map (kbd ")") 'awesome-pair-close-round)
;; (define-key awesome-pair-mode-map (kbd "]") 'awesome-pair-close-bracket)
;; (define-key awesome-pair-mode-map (kbd "}") 'awesome-pair-close-curly)
;; (define-key awesome-pair-mode-map (kbd "=") 'awesome-pair-equal)

;; (define-key awesome-pair-mode-map (kbd "%") 'awesome-pair-match-paren)
;; (define-key awesome-pair-mode-map (kbd "\"") 'awesome-pair-double-quote)

;; (define-key awesome-pair-mode-map (kbd "SPC") 'awesome-pair-space)
;; (define-key awesome-pair-mode-map (kbd "RET") 'awesome-pair-newline)

;; (define-key awesome-pair-mode-map (kbd "M-o") 'awesome-pair-backward-delete)
;; (define-key awesome-pair-mode-map (kbd "C-d") 'awesome-pair-forward-delete)
;; (define-key awesome-pair-mode-map (kbd "C-k") 'awesome-pair-kill)

;; (define-key awesome-pair-mode-map (kbd "M-\"") 'awesome-pair-wrap-double-quote)
;; (define-key awesome-pair-mode-map (kbd "M-[") 'awesome-pair-wrap-bracket)
;; (define-key awesome-pair-mode-map (kbd "M-{") 'awesome-pair-wrap-curly)
;; (define-key awesome-pair-mode-map (kbd "M-(") 'awesome-pair-wrap-round)
;; (define-key awesome-pair-mode-map (kbd "M-)") 'awesome-pair-unwrap)

;; (define-key awesome-pair-mode-map (kbd "M-p") 'awesome-pair-jump-right)
;; (define-key awesome-pair-mode-map (kbd "M-n") 'awesome-pair-jump-left)
;; (define-key awesome-pair-mode-map (kbd "M-:") 'awesome-pair-jump-out-pair-and-newline)


(provide 'init-editor)
