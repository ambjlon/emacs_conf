;;每当您保存的时候执行goformat, 按照golang的语法进行对齐等格式化操作
(add-hook 'before-save-hook 'gofmt-before-save)

;; 绑定godef-jump
;;(add-hook 'go-mode-hook (lambda ()
;;                         (local-set-key (kbd \"M-.\") 'godef-jump)))

;;(add-to-list 'load-path "/usr/local/go/src/goflymake")
;;(require 'go-flymake)
(add-to-list 'load-path "/usr/local/go/src/goflymake")
(require 'go-flycheck)


(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

(provide 'go-conf)
