;; 8-rime(input method)
(use-package rime
  :ensure t
  :defer t
  :custom
  (default-input-method "rime")
  (define-key rime-mode-map (kbd "M-j") 'rime-force-enable)
  (rime-disable-predicates
   '(meow-normal-mode-p
     rime-predicate-after-alphabet-char-p
     rime-predicate-space-after-cc-p
     rime-predicate-current-uppercase-letter-p
     rime-predicate-current-input-punctuation-p)))


(provide 'init-rime)
