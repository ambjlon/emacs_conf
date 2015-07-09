;一次跳跃n=5行，多行跳跃
 (global-set-key (kbd "M-n")
     (lambda () (interactive) (next-line 5)))
 (global-set-key (kbd "M-p")
     (lambda () (interactive) (previous-line 5)))
;;修复windows下面Backspace键为c-h
(global-set-key "\C-h" 'backward-delete-char-untabify)
(global-set-key "\d" 'delete-char)

;使用C-w在一行任意位置删除该整行，使用M-w在一行任意位置复制整行
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

;;格式化整个文件函数,比如c-mode java-mode html-mode等等，并将这个功能绑定到F7
(defun indent-whole ()
  (interactive)
   (indent-region (point-min) (point-max))
(message "format successfully"))
;;绑定到F7键
(global-set-key [f7] 'indent-whole)

(provide 'hotkey)
