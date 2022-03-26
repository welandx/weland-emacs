;; custom file
(setq custom-file (expand-file-name "~/.emacs.d/custom.el"))
(load custom-file 'no-error 'no-message)


;; load path
(add-to-list 'load-path "~/.emacs.d/lisp/")


;; package
;; -----------------------------------------
(require 'init-package)


;; UI
;; -----------------------------------------
(require 'init-ui)


;; editor
;; -----------------------------------------
(require 'init-editor)


;; Meow
;; -----------------------------------------
(require 'init-meow)


;; Company
;; -----------------------------------------
(require 'init-company)


;; Org-Mode
;; -----------------------------------------
(require 'init-org)


;; treesitter
;; -----------------------------------------
(require 'init-treesitter)


;; lsp
;; -----------------------------------------
(require 'init-lsp)


;; minibuffer
;; -----------------------------------------
(require 'init-minibuffer)


;; workspace
;; -----------------------------------------
(require 'init-workspace)


;; rime
;; -----------------------------------------
(require 'init-rime)


;; telega
;; -----------------------------------------
(require 'init-telega)


;; project magit
(require 'init-project)


;; -----------------------------------------
;; End
;; -----------------------------------------
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "C-c i") 'open-init-file)
