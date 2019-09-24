(require 'company)

(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 3)
(define-key company-active-map (kbd "TAB") #'company-complete-selection)
(define-key company-active-map (kbd "C-n")  #'company-select-next)
(define-key company-active-map (kbd "C-p")  #'company-select-previous)

(provide 'company-conf)
