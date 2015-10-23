;;每当您保存的时候执行goformat, 按照golang的语法进行对齐等格式化操作
;;(defun golang-conf()
(add-hook 'before-save-hook 'gofmt-before-save)
;; 绑定godef-jump godef-jump-back
(add-hook 'go-mode-hook (lambda ()
                         (local-set-key (kbd "M-.") 'godef-jump)))
(add-hook 'go-mode-hook (lambda ()
                         (local-set-key (kbd "M-,") 'godef-jump-back)))
;;语法检错配置
;;(add-to-list 'load-path "/usr/local/go/src/goflymake")
;;(require 'go-flymake)
(add-to-list 'load-path "/usr/local/go/src/github.com/dougm/goflymake")
;;(add-hook 'after-init-hook #'global-flycheck-mode);;自动打开flycheck
(require 'flycheck)
;;智能补全
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)
;;)
;;(add-hook 'go-mode-hook #'golang-conf)
;;godoc 绑定
(provide 'go-conf)
