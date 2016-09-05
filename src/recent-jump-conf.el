;;https://github.com/exceedhl/my-emacs/blob/master/site-lisp/recent-jump.el
(setq rj-ring-length 10000)
(setq rj-line-threshold 1)
(require 'recent-jump)
(recent-jump-mode 1)
(global-set-key (kbd "M-;") 'recent-jump-backward)
(global-set-key (kbd "M-'") 'recent-jump-forward)
(provide 'recent-jump-conf)

;;另一个版本的recent-jump 并不是很好用 https://github.com/bigfang/.emacs.d/blob/master/plugins/recent-jump.el
;; (setq recent-jump-threshold 4)
;; (setq recent-jump-ring-length 10)
;; (global-set-key (kbd "M-;") 'recent-jump-jump-backward)
;; (global-set-key (kbd "M-'") 'recent-jump-jump-forward)
;; (require 'recent-jump)
;; (provide 'recent-jump-conf)

;;还可以试着使用这个https://www.emacswiki.org/emacs/quick-jump.el
