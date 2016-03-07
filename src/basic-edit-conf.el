;;一次跳跃n=8行，多行跳跃
 (global-set-key (kbd "M-n")
     (lambda () (interactive) (next-line 8)))
 (global-set-key (kbd "M-p")
     (lambda () (interactive) (previous-line 8)))

;;格式化整个文件函数,比如c-mode java-mode html-mode等等，并将这个功能绑定到F7
(defun indent-whole ()
  (interactive)
   (indent-region (point-min) (point-max))
(message "format successfully"))
(global-set-key [f7] 'indent-whole)

;;默认的，跳到到buffer首部M-<, 跳到buffer尾部M->

;;新起一行,并把光标放到新起行的行首.
;; 新起一行,并且不中断当前行C-o
(defun newline-without-break-of-line ()
    "1. move to end of the line.
  2. insert newline with index"
    (interactive)
    (let ((oldpos (point)))
      (end-of-line)
      (newline-and-indent)))
(global-set-key (kbd "C-o") 'newline-without-break-of-line)
;;新起一行, 打断当前行使用C-j 这个不会常用

;;空格代替tab
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)

;;把波浪线后缀的备份文件统一管理
(setq backup-directory-alist (quote (("." . "~/.backups"))))

;启动时显示行号
(global-linum-mode t)


(provide 'basic-edit-conf)