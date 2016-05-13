(add-to-list 'load-path "~/.emacs.d/src")
(require 'ace-jump-mode)
(define-key global-map (kbd "C-x c") 'ace-jump-char-mode)
(define-key global-map (kbd "C-x w") 'ace-jump-word-mode)
(define-key global-map (kbd "C-x l") 'ace-jump-line-mode)
(define-key global-map (kbd "C-x p") 'ace-jump-mode-pop-mark)
(setq ace-jump-mode-case-fold nil);;设置大小写敏感

(provide 'ace-jump-conf)
