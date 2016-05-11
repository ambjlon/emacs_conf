;; Package: smartparens
(require 'smartparens-config)
(show-smartparens-global-mode +1)
(smartparens-global-mode 1)

;;注意: 左delimier不属于sexp 右delimiter属于sexp
;;当光标已经位于最顶层父节点或者最底层的子节点时候, 还有个在本节点定位的过程. 定位总是到达本sexp的最右delimiter或者最左delimiter的下一个字符. 注意观察规律.
;;1. 跳到当前sexp的起始, 光标移到delimiter的下一个位置.
(global-set-key "\M-(" 'sp-beginning-of-sexp)
;;2. 跳到当前sexp的结束, 光标移动到delimiter的位置.
(global-set-key "\M-)" 'sp-end-of-sexp)
;;3. 向后(右)到达父节点紧挨本节点的位置, 即本节点右delimiter的下一个字符.
(global-set-key "\M-[" 'sp-up-sexp)
;;4.向后(右)到达子节点紧挨本节点的位置. 例如( [  ]  a  [   ] ) 从a到达后面的[
(global-set-key "\M-]" 'sp-down-sexp)
;;5.向前(左)到达父节点紧挨本节点的位置. 例如( [ ] (  a  )  ) 从a到达前面的(
(global-set-key "\M-{" 'sp-backward-up-sexp)
;;6.向前(左)到达子节点紧挨本节点的位置. 已经最底层的子节点的时候, 位置定位到本节点右侧的delimier.
(global-set-key "\M-}" 'sp-backward-down-sexp)
;;7. sp-next-sexp 到达右兄弟节点的右边界, 遍历完本层节点的时候, 跳到父节点的右边界. 普通字符(非delimiter字符)被空白字符(还不确定)分割成的block也算作sexp. kdj()kgds就是三个sexp.
;;8. sp-previous-sexp 到达左兄弟的左边界, 遍历完本层节点后, 跳到父节点. 同7一样普通字符block也能构成sexp

;;9. 向后跳跃, 跳跃单位是普通字符组成的block(中间不含空白符?). 这个应该比M-f跳跃的更快. 所以使用了M-F
(global-set-key "\M-F" 'sp-forward-symbol)
;;10. 向前回跳, 跳跃单位同9
(global-set-key "\M-B" 'sp-backward-symbol)
;;9 10 没什么明显的效果

;;11. 右delimiter向右吞一个sexp
(global-set-key (kbd "C-x >") 'sp-forward-slurp-sexp)
;;12 左delimiter向左吞一个sexp
(global-set-key (kbd "C-x <") 'sp-backward-slurp-sexp)
;;13 右delimiter吐出一个sexp
(global-set-key (kbd "C-x .") 'sp-forward-barf-sexp)
;;14 左delimiter吐出一个sexp
(global-set-key (kbd "C-x ,") 'sp-backward-barf-sexp)


;;15 删除前面的sexp
(global-set-key (kbd "C-c k") 'sp-kill-sexp)
;;16 删除后面的sexp
(global-set-key (kbd "C-c l") 'sp-backward-kill-sexp)

;;17 交换sexp
(global-set-key (kbd "C-c t") 'sp-transpose-sexp)

;;18 去掉包装
;;(global-set-key (kbd "C-c C-t") 'sp-backward-unwrap-sexp)
;;19 添加包装
;;(global-set-key (kbd "C-c t") 'sp-backward-unwrap-sexp)



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
            (single-quote . "'")
            (double-quote . "\"")
                        (back-quote   . "`")))




(provide 'smartparens-conf)

;;emacs可以选择的括号匹配相关的插件: mic-parens emacs自带的show-parens-mode smartparens-mode highlightparens.
;;选择使用smartparen-mode.
;;参考 https://ebzzry.github.io/emacs-pairs.html
;;https://github.com/Fuco1/smartparens
;;https://github.com/Fuco1/smartparens/wiki

;;匹配显示的颜色 以及下划线 等都是可以通过customize-group设置的.
