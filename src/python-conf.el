;;jedi配置，y cannot i call it in jedi-conf? 
(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)

(setq jedi:complete-on-dot t)
;;添加python跳转回跳功能
;;参考http://txt.arboreus.com/2013/02/21/jedi.el-jump-to-definition-and-back.html
;;这个跳转回跳功能还是不够完善, 很多时候跳不出去.
;;还可以考虑使用elpy插件, 但是这个插件的补全功能是使用company的.
(defvar jedi:goto-stack '())
(defun jedi:jump-to-definition ()
  (interactive)
  (add-to-list 'jedi:goto-stack
               (list (buffer-name) (point)))
  (jedi:goto-definition))
(defun jedi:jump-back ()
  (interactive)
  (let ((p (pop jedi:goto-stack)))
    (if p (progn
            (switch-to-buffer (nth 0 p))
            (goto-char (nth 1 p))))))

(add-hook 'python-mode-hook
          '(lambda ()
             (local-set-key (kbd "M-.") 'jedi:jump-to-definition)
             (local-set-key (kbd "M-,") 'jedi:jump-back)
             (local-set-key (kbd "C-c d") 'jedi:show-doc)))

(provide 'python-conf)
