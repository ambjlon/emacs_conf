(ac-config-default)
(global-auto-complete-mode t)
;;不自动触发补全 或者设置自动触发补全的位置
;;(setq ac-auto-start nil)
(setq ac-auto-start 3)

;;设置自动触发的快捷键
;;(setq ac-auto-start nil)
;;(ac-set-trigger-key "TAB")

;;定义执行补全的快捷键 注意\M
(define-key ac-completing-map "\t" 'ac-complete)
(define-key ac-completing-map "\r" nil)

;;用户自定义词典
(setq ac-user-dictionary-files '("~/.emacs.d/.dict"))
;;主模式词典 有默认值
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20160827.649/dict")

;;定义Ctrl-n/p 上下滚动candidates
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)

;;C-s 过滤candidates. Del取消过滤.

;;延迟0.2s展示candidates
(setq ac-auto-show-menu 0.2)

(provide 'auto-complete-conf)
