(global-set-key (kbd "C-c j") 'select-frame-by-name)
(global-set-key (kbd "C-c b") 'switch-to-buffer)

(setq-default frame-title-format
              '((:eval
                 (or (cdr (project-current))
                     (buffer-name)))))

(provide 'init-workspace)
