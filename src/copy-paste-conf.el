;;本文件配置和选中 复制 粘贴有关的热键. 这是很基础的操作, 这个文件有基础配置的地位.
;;参考http://www.chemie.fu-berlin.de/chemnet/use/info/emacs/emacs_13.html
;;参考http://ergoemacs.org/emacs/emacs_kill-ring.html

;;1. delete操作. 只是删除不会将删除的内容放到kill-ring中, 也就是不能在接下来的操作中将这些delete的内容粘贴到其他的地方.
;;1.1 删除下一个字符. 默认键C-d
;;1.2 删除前一个字符. 默认键del键
;;1.3 删除当前点附件的所有水平空白符(包括制表符?). 默认键M-\
;;1.3 删除当前点附件的所有水平空白符(包括制表符?),但要留一个. 默认键M-SPACE, 和mac的Alfred有冲突. 重新绑定
(global-set-key "\M-]" 'just-one-space)
;;1.4 删除当前行附近的空白行. 默认键C-x C-o. 在空白行按此键删除的只剩一个空白行, 若是只有一个空白行按此键删除所有的也就是1个空白行. 在非空白行按此键,删除当前行.
;;1.5 M-^ 将当前行和上一行合并为一行.
;;1.6 删除下一个word. 不copy到kill-ring. 这个功能不会常用吧?
(defun my-delete-word (arg)
  "Delete characters forward until encountering the end of a word.
With argument, do this that many times.
This command does not push text to `kill-ring'."
  (interactive "p")
  (delete-region
   (point)
   (progn
     (forward-word arg)
     (point))))
(global-set-key (kbd "C-x M-d") 'my-delete-word)

;;使用C-w在一行任意位置删除该整行，使用M-w在一行任意位置复制整行
(defadvice kill-ring-save (before slickcopy activate compile)  
  (interactive  
   (if mark-active (list (region-beginning) (region-end))  
     (list (line-beginning-position)  
           (line-beginning-position 2)))))  
(defadvice kill-region (before slickcut activate compile)  
  (interactive  
   (if mark-active (list (region-beginning) (region-end))  
     (list (line-beginning-position)  
           (line-beginning-position 2))))) 

                                        ;定义全选热键
(global-set-key (kbd "C-x a") 'mark-whole-buffer)

(provide 'copy-paste-conf)
