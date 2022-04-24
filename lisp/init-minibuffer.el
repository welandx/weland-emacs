(use-package vertico
  :ensure t
  :defer t
  :init
  (vertico-mode t))

(use-package savehist
  :defer t
  :init
  (savehist-mode))

(use-package orderless
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles . (partial-completion))))))

(use-package marginalia
  :ensure t
  :defer t
  :init
  (marginalia-mode t))

(use-package consult
  :ensure t)
(global-set-key (kbd "C-s") 'consult-line)
(global-set-key (kbd "C-c b") 'consult-buffer)

(use-package embark
  :ensure t)
(global-set-key (kbd "C-;") 'embark-act)
(setq prefix-help-command 'embark-prefix-help-command)

;; open system file manager
(defun consult-directory-externally (file)
  "Open FILE externally using the default application of the system."
  (interactive "fOpen externally: ")
  (if (and (eq system-type 'windows-nt)
	   (fboundp 'w32-shell-execute))
      (shell-command-to-string (encode-coding-string (replace-regexp-in-string "/" "\\\\"
	    (format "explorer.exe %s" (file-name-directory (expand-file-name file)))) 'gbk))
    (call-process (pcase system-type
		    ('darwin "open")
		    ('cygwin "cygstart")
		    (_ "xdg-open"))
		  nil 0 nil
		  (file-name-directory (expand-file-name file)))))

(define-key embark-file-map (kbd "E") #'consult-directory-externally)

(use-package pyim
  :ensure t
  :defer t)


(provide 'init-minibuffer)
