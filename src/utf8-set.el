;;在滴滴的一台新的虚拟机上安装了emacs， 然后打开后中文乱码全部显示为??????， 添加这里的配置问题解决了。
;;估计是安装emacs的时候配置./configure没有配置utf8.。。。。
(set-language-environment "UTF-8")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(provide 'utf8-set)
