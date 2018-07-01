;;本文件配置和选中 复制 粘贴有关的热键. 这是很基础的操作, 这个文件有基础配置的地位.
;;参考http://www.chemie.fu-berlin.de/chemnet/use/info/emacs/emacs_13.html
;;参考http://ergoemacs.org/emacs/emacs_kill-ring.html
;;http://ergoemacs.org/emacs/elisp_common_functions.html
;;http://emacswiki.org/emacs/CopyWithoutSelection
;;http://www.gnu.org/software/emacs/manual/html_node/elisp/Point.html
;;http://www.gnu.org/software/emacs/manual/html_node/elisp/Character-Motion.html



;;1. delete操作. 只是删除不会将删除的内容放到kill-ring中, 也就是不能在接下来的操作中将这些delete的内容粘贴到其他的地方.
;;1.1 删除下一个字符. 默认键C-d
;;1.2 删除前一个字符. 默认键del键
;;1.3 删除下一个word, 类似shell, 会删掉非word类型的字符. 不copy到kill-ring.
(defun shell-delete-word (arg)
  "Delete characters forward until encountering the end of a word.
With argument, do this that many times.
This command does not push text to `kill-ring'."
  (interactive "p")
  (delete-region
   (point)
   (progn
     (forward-word arg)
     (point))))
(global-set-key (kbd "M-d") 'shell-delete-word)
;;1.4删除前一个word, 类似shell, 会删掉非word类型的字符. 不copy到kill-ring.
(defun shell-backward-delete-word (arg)
  "Delete characters backward until encountering the beginning of a word.
With argument, do this that many times.
This command does not push text to `kill-ring'."
  (interactive "p")
  (shell-delete-word (- arg)))
(global-set-key (kbd "M-DEL") 'shell-backward-delete-word)
;;1.5 向前删除下一个word, 不删除非word类型的字符.使用delete-word(C-M-w)即可达到目的.
;;1.6 向后删除下一个word, 不删除非word类型的字符. 修改了delete-word函数实现的.
(defun forward-delete-word (&optional arg)
  "Copy words at point into kill-ring"
  (interactive "P")
  (delete-thing 'forward-word 'backward-word arg))
(global-set-key (kbd "C-M-d") 'forward-delete-word)
;;空白删除操作
;;1.7 删除当前点附件的所有水平空白符(包括制表符?).
(global-set-key (kbd "C-c <SPC>") 'delete-horizontal-space)
;;1.8 删除当前行附近的空白行. 默认键C-x C-o. 在空白行按此键删除的只剩一个空白行, 若是只有一个空白行按此键删除所有的也就是1个空白行. 
;;1.7 M-^ 将当前行和上一行合并为一行.
;;1.9 删除当前点附件的所有水平空白符(包括制表符?),但要留一个. 默认键M-SPACE, 和mac的Alfred有冲突. 重新绑定
;;(global-set-key "\M-]" 'just-one-space) 2016-5-10配置smartparens时发生冲突, 暂时注释掉这里.


;;---------------------------------------------------------------
;;---------------------------------------------------------------
;;3. copy
;;3.1 复制当前行
(defun copy-line (&optional arg)
  "Save current line into Kill-Ring without mark the line "
  (interactive "P")
  (copy-thing 'beginning-of-line 'end-of-line arg))
(global-set-key (kbd "M-l") 'copy-line)
;;3.2 复制当前word
(defun copy-word (&optional arg)
  "Copy words at point into kill-ring"
  (interactive "P")
  (copy-thing 'backward-word 'forward-word arg))
(global-set-key (kbd "M-w") 'copy-word)
;;3.3 复制当前位置到行尾的内容
(defun my-nil-fun (x));;x is must!!!
(defun copy-to-tail (&optional arg)
  "Copy words at point into kill-ring"
  (interactive "P")
  (copy-thing 'my-nil-fun 'end-of-line arg))
(global-set-key (kbd "M-t") 'copy-to-tail)
;;3.4复制当前位置到行首的内容
(defun copy-to-head (&optional arg)
  "Copy words at point into kill-ring"
  (interactive "P")
  (copy-thing 'my-nil-fun 'beginning-of-line arg))
(global-set-key (kbd "M-h") 'copy-to-head)
;;3.5 复制选中区域
;;想自己实现对选中区域的定位,没有成功.
;; (defun my-move-to-region-head (x)
;;   (goto-char (region-beginning)))
;; (defun my-move-to-region-tail (x)
;;   (goto-char (region-end)))
;; (defun my-copy-region (&optional arg)
;;   (interactive "P")
;;   (copy-thing 'my-move-to-region-head 'my-move-to-region-tail arg))
(global-set-key (kbd "M-k") 'copy-region-as-kill)


;;剪切
;;5.1 剪切当前行
(defun kill-line (&optional arg)
  "Save current line into Kill-Ring without mark the line "
  (interactive "P")
  (kill-thing 'beginning-of-line 'end-of-line arg))
(global-set-key (kbd "C-l") 'kill-line)
;;5.2 剪切当前单词
(defun kill-word (&optional arg)
  "Copy words at point into kill-ring"
  (interactive "P")
  (kill-thing 'backward-word 'forward-word arg))
(global-set-key (kbd "C-w") 'kill-word)
;;5.3剪切当前位置到行尾的内容
(defun kill-to-tail (&optional arg)
  "Copy words at point into kill-ring"
  (interactive "P")
  (kill-thing 'my-nil-fun 'end-of-line arg))
(global-set-key (kbd "C-t") 'kill-to-tail);;和php代码跳转的热键冲突,注意解决!!
;;5.4剪切当前位置到行首的内容
(defun kill-to-head (&optional arg)
  "Copy words at point into kill-ring"
  (interactive "P")
  (kill-thing 'my-nil-fun 'beginning-of-line arg))
(global-set-key (kbd "C-h") 'kill-to-head)
;;5.5 剪切选中区域
(global-set-key (kbd "C-k") 'kill-region)



;;删除
;;6.1 删除当前行
(defun delete-line (&optional arg)
  "Save current line into Kill-Ring without mark the line "
  (interactive "P")
  (delete-thing 'beginning-of-line 'end-of-line arg))
(global-set-key (kbd "C-M-l") 'delete-line)
;;6.2 删除当前单词
(defun delete-word (&optional arg)
  "Copy words at point into kill-ring"
  (interactive "P")
  (delete-thing 'backward-word 'forward-word arg))
(global-set-key (kbd "C-M-w") 'delete-word)
;;6.3删除当前位置到行尾的内容
(defun delete-to-tail (&optional arg)
  "Copy words at point into kill-ring"
  (interactive "P")
  (delete-thing 'my-nil-fun 'end-of-line arg))
(global-set-key (kbd "C-M-t") 'delete-to-tail);;和php代码跳转的热键冲突,注意解决!!
;;6.4删除当前位置到行首的内容
(defun delete-to-head (&optional arg)
  "Copy words at point into kill-ring"
  (interactive "P")
  (delete-thing 'my-nil-fun 'beginning-of-line arg))
(global-set-key (kbd "C-M-h") 'delete-to-head);;和选中当前行有冲突  注意解决
;;6.5 删除选中区域
(global-set-key (kbd "C-M-k") 'delete-region)


;;定义全选热键
(global-set-key (kbd "C-x a") 'mark-whole-buffer)
;;copy base function
(defun get-point (symbol &optional arg)
  "get the point"
  (funcall symbol arg)
  (point)
  )
(defun copy-thing (begin-of-thing end-of-thing &optional arg)
  "copy thing between beg & end into kill ring"
  (save-excursion
    (let ((beg (get-point begin-of-thing 1))
          (end (get-point end-of-thing arg)))
      (copy-region-as-kill beg end)))
  )
(defun kill-thing (begin-of-thing end-of-thing &optional arg)
  "copy thing between beg & end into kill ring"
  (save-excursion
    (let ((beg (get-point begin-of-thing 1))
          (end (get-point end-of-thing arg)))
      (kill-region beg end)))
  )
(defun delete-thing (begin-of-thing end-of-thing &optional arg)
  "copy thing between beg & end into kill ring"
  (save-excursion
    (let ((beg (get-point begin-of-thing 1))
          (end (get-point end-of-thing arg)))
      (delete-region beg end)))
  )
(defun paste-to-mark(&optional arg)
  "Paste things to mark, or to the prompt in shell-mode"
  (let ((pasteMe
         (lambda()
           (if (string= "shell-mode" major-mode)
               (progn (comint-next-prompt 25535) (yank))
             (progn (goto-char (mark)) (yank) )))))
    (if arg
        (if (= arg 1)
            nil
          (funcall pasteMe))
      (funcall pasteMe))
    ))
(provide 'copy-paste-conf)

;;旧的相关的配置,废弃!!
;;使用C-w在一行任意位置删除该整行，使用M-w在一行任意位置复制整行
;; (defadvice kill-ring-save (before slickcopy activate compile)  
;;   (interactive  
;;    (if mark-active (list (region-beginning) (region-end))  
;;      (list (line-beginning-position)  
;;            (line-beginning-position 2)))))  
;; (defadvice kill-region (before slickcut activate compile)  
;;   (interactive  
;;    (if mark-active (list (region-beginning) (region-end))  
;;      (list (line-beginning-position)  
;;            (line-beginning-position 2))))) 

;; ;;1.8 从当前位置删除至行尾,不copy到kill-ring.
;; (defun my-delete-line ()
;;   "Delete text from current position to end of line char.
;; This command does not push text to `kill-ring'."
;;   (interactive)
;;   (delete-region
;;    (point)
;;    (progn (end-of-line 1) (point)))
;;   (delete-char 1))
;; (global-set-key (kbd "C-M-k") 'my-delete-line)
;; ;;1.9 从单前位置删除至行首,不copy到kill-ring.
;; (defun my-delete-line-backward ()
;;   "Delete text between the beginning of the line to the cursor position.
;; This command does not push text to `kill-ring'."
;;   (interactive)
;;   (let (p1 p2)
;;     (setq p1 (point))
;;     (beginning-of-line 1)
;;     (setq p2 (point))
;;     (delete-region p1 p2)))
;; (global-set-key (kbd "C-M-i") 'my-delete-line-backward)
;; ;;1.10 删除整行,不copy到kill-ring
;; ;; from http://stackoverflow.com/questions/637351/emacs-how-to-delete-text-without-kill-ring
;; (defun ruthlessly-kill-line ()
;;   "Deletes a line, but does not put it in the kill-ring. (kinda)"
;;   (interactive)
;;   (move-beginning-of-line 1)
;;   (kill-line 1)
;;   (setq kill-ring (cdr kill-ring)))
;; (global-set-key (kbd "C-M-w") 'ruthlessly-kill-line)
;;2. kill操作.相当于常说的剪切, 将kill的内容copy到kill-ring
;;2.1 向前向后kill一个字符,没必要将这个字符放到kill-ring,所以使用向前向后delele一个字符即可.
;;2.2 向后kill一个word, 而且若是行尾操作,不会包括换行. 默认键 M-d
;;2.3 向前kill一个word, 而且若是行首操作,不会包括上一行的换行符. 默认M-DEL
;;2.4 我不编辑文章,不会有向前向后kill至句子开始结尾的需求~_~
;;2.5 向前kill至行首, 而且若是行首操作,不会包括上一行的换行.
;; (defun backward-kill-line (arg)
;;   "Kill ARG lines backward."
;;   (interactive "p")
;;   (kill-line (- 1 arg)))
;; ;;(global-set-key (kbd "C-i") 'backward-kill-line)
;; ;;2.6向后kill至行尾, 而且若是行尾操作,不会包括换行.默认C-k
;; ;;from http://emacsredux.com/blog/2013/04/09/kill-whole-line/
;; (defun smart-kill-whole-line (&optional arg)
;;   "A simple wrapper around `kill-whole-line' that respects indentation."
;;   (interactive "P")
;;   (kill-whole-line 0);;我把arg写死了,因为我不知道怎么在bindkey的时候给参数赋值,调用一个定制的函数.
;;   (back-to-indentation))
;; ;;(global-set-key (kbd "C-k") 'smart-kill-whole-line)
