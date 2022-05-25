(use-package go-translate
  :ensure t
  :defer t
  :config
  (setq gts-translate-list '(("en" "zh")))
  (setq gts-default-translator
      (gts-translator
       :picker (gts-prompt-picker)
       :engines (list (gts-google-engine) (gts-google-rpc-engine))
       :render (gts-buffer-render))))
;; (setq gts-translate-list '(("en" "zh")))
;; (setq gts-default-translator
;;     (gts-translator
;;      :picker (gts-prompt-picker)
;;      :engines (list (gts-google-engine) (gts-google-rpc-engine))
;;      :render (gts-buffer-render)))
(add-to-list 'load-path "~/.emacs.d/site-lisp/corfu-english-helper/")
(require 'corfu-english-helper)

(provide 'init-translate)

