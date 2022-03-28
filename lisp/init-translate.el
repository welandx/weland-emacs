(use-package go-translate
  :ensure t
  :defer t
  :custom
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


(provide 'init-translate)

;; based 回合制
