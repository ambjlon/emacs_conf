;;nxml html 初级配置.
;;nxml sgml文件的标签匹配.
(add-hook 'sgml-mode-hook '(lambda ()
                            (require 'hl-tags-mode)
                            (hl-tags-mode 1)
                            ))
(add-hook 'nxml-mode-hook '(lambda ()
                             (require 'hl-tags-mode)
                             (hl-tags-mode )
                             ))
;;nxml sgml文件的代码折叠
;;(add-hook 'sgml-mode-hook '(require 'nxml-html-fold))
;;(add-hook 'nxml-mode-hook '(require 'nxml-html-fold))
;;使用hook触发失败, 有需要的话打开下面的语句使用.
;;使用: M-x  hs-minor-mode  hs-minor-toggle hs-minor-show
(require 'nxml-html-fold)


;;web-mode
;;参考 http://web-mode.org/

(provide 'nxml-conf)
