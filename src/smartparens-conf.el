;; Package: smartparens
(require 'smartparens-config)
(show-smartparens-global-mode +1)
(smartparens-global-mode 1)

;;注意: 左delimier不属于sexp 右delimiter属于sexp
;;当光标已经位于最顶层父节点或者最底层的子节点时候, 还有个在本节点定位的过程. 定位总是到达本sexp的最右delimiter或者最左delimiter的下一个字符. 注意观察规律;;遍历
;;1. 跳到当前sexp的起始, 光标移到delimiter的下一个位置.
(global-set-key "\M-(" 'sp-beginning-of-sexp)
;;2. 跳到当前sexp的结束, 光标移动到delimiter的位置.
(global-set-key "\M-)" 'sp-end-of-sexp)
;;3. 向后(右)到达父节点紧挨本节点的位置, 即本节点右delimiter的下一个字符.
(global-set-key "\M-\\" 'sp-up-sexp) ;;此按键和F7冲突
;;4.向后(右)到达子节点紧挨本节点的位置. 例如( [  ]  a  [   ] ) 从a到达后面的[
(global-set-key "\M-|" 'sp-down-sexp)
;;5.向前(左)到达父节点紧挨本节点的位置. 例如( [ ] (  a  )  ) 从a到达前面的(
(global-set-key "\M-{" 'sp-backward-up-sexp)
;;6.向前(左)到达子节点紧挨本节点的位置. 已经最底层的子节点的时候, 位置定位到本节点右侧的delimier.
(global-set-key "\M-}" 'sp-backward-down-sexp)

;;兄弟序遍历sexp
;;7. sp-next-sexp 到达右兄弟节点的右边界, 遍历完本层节点的时候, 跳到父节点的右边界. 普通字符(非delimiter字符)被空白字符(还不确定)分割成的block也算作sexp. kdj()kgds就是三个sexp.
(global-set-key "\C-\M-]" 'sp-next-sexp)
;;8. sp-previous-sexp 到达左兄弟的左边界, 遍历完本层节点后, 跳到父节点. 同7一样普通字符block也能构成sexp
(global-set-key "\C-\M-[" 'sp-previous-sexp)

;;按照字节流顺序遍历sexp.
;;emacs内置的forward-sexp(C-M-f)有时会报错Containing expression ends prematurely. 这里使用sp-forward-sexp代替内置的forward-sexp. backward类似.
(global-set-key "\C-\M-f" 'sp-forward-sexp)
(global-set-key "\C-\M-b" 'sp-backward-sexp)

;;9. 向后跳跃, 跳跃单位是普通字符组成的block(中间不含空白符?). 这个应该比M-f跳跃的更快. 所以使用了M-F
;;(global-set-key "\M-F" 'sp-forward-symbol)
;;10. 向前回跳, 跳跃单位同9
;;(global-set-key "\M-B" 'sp-backward-symbol)
;;9 10 没什么明显的效果


;;编辑
;;11. 右delimiter向右吞一个sexp
(global-set-key (kbd "C-c >") 'sp-forward-slurp-sexp)
;;12 左delimiter向左吞一个sexp
(global-set-key (kbd "C-c <") 'sp-backward-slurp-sexp)
;;13 右delimiter吐出一个sexp
(global-set-key (kbd "C-c C-x ]") 'sp-forward-barf-sexp)
;;14 左delimiter吐出一个sexp
(global-set-key (kbd "C-c C-x [") 'sp-backward-barf-sexp)

;;剪切sexp
;;光标位于一个sexp的非首字符的时候, 'sp-kill-sexp和'sp-backward-kill-sexp都会剪切当前的sexp
;;光标位于一个sexp的首字符的时候: 'sp-backward-kill-sexp会查找前一个sexp, 并非当前的sexp, 然后剪切它. 向前查找是按照字节流向前, 并不是递归到父sexp;但是'sp-kill还是剪切当前sexp
;;光标位于非sexp(sexp的定义参看印象笔记)的时候:'sp-kill-sexp向后查找到下一个sexp,并剪切之;'sp-backward-kill-sexp向前查找到下一个sexp并剪切之. 向前向后都是按字节流向前向后, 并非递归到父sexp.
;;当想接剪切由各种括号表达的sexp或者string(也是sexp)的时候, 先把光标移动到合适的位置, 使得'sp-backward-kill-sexp或者'sp-kill-sexp能定位到的sexp正好是你想剪切的sexp, 然后执行'sp-kill-sexp或'sp-backward-kill-sexp即可. 一般来说定位当这样的sexp的首字符, 也就是各种括号或者' ", 然后执行'sp-kill-sexp就可以了.
;;15 剪切前面的sexp
(global-set-key (kbd "C-c k") 'sp-kill-sexp)
;;16 剪切后面的sexp
(global-set-key (kbd "C-c b") 'sp-backward-kill-sexp)

;;复制sexp
 (global-set-key (kbd "C-c t") 'sp-copy-sexp)
;;删除sexp
;;??

;; ;;17 交换sexp
;; (global-set-key (kbd "C-c t") 'sp-transpose-sexp)

;;添加去除包装
;;18 前向去掉包装
(global-set-key (kbd "C-c \]") 'sp-unwrap-sexp)
;;19 反向去掉包装
(global-set-key (kbd "C-c \}") 'sp-backward-unwrap-sexp) 
;;定义包装函数, 这些函数都是包装右侧sexp的.
(defmacro def-pairs (pairs)
  `(progn
    ,@(loop for (key . val) in pairs
             collect
             `(defun ,(read (concat
              "wrap-with-"
                             (prin1-to-string key)
                             "s"))
                  (&optional arg)
                (interactive "p")
                (sp-wrap-with-pair ,val)))))
(def-pairs ((paren        . "(")
            (bracket      . "[")
            (brace        . "{")
            (single-quote . "\'")
            (double-quote . "\"")
;;            (angle-quote . "\<")
            (back-quote   . "`")))
(global-set-key (kbd "C-c [") 'wrap-with-brackets)
(global-set-key (kbd "C-c {") 'wrap-with-braces)
(global-set-key (kbd "C-c (") 'wrap-with-parens)
(global-set-key (kbd "C-c \'") 'wrap-with-single-quotes)
(global-set-key (kbd "C-c \"") 'wrap-with-double-quotes) 
(global-set-key (kbd "C-c `") 'wrap-with-back-quotes)
;;(global-set-key (kbd "C-c \<") 'wrap-with-angle-quotes) 

(provide 'smartparens-conf)

;;emacs可以选择的括号匹配相关的插件: mic-parens emacs自带的show-parens-mode smartparens-mode highlightparens.
;;选择使用smartparen-mode.
;;参考 https://ebzzry.github.io/emacs-pairs.html
;;https://github.com/Fuco1/smartparens
;;https://github.com/Fuco1/smartparens/wiki

;;匹配显示的颜色 以及下划线 等都是可以通过customize-group设置的.
