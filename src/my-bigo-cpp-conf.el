(setq c-default-style "stroustrup") ;;c代码用4个空格对齐
(add-hook 'before-save-hook 'delete-trailing-whitespace) ;;保存前删掉每行末尾的空白符

(require 'rtags)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode));;.h文件也归为c++-mode

(cmake-ide-setup)

(setq cmake-ide-rc-executable "/usr/local/bin/rc")

(setq cmake-ide-build-pool-dir "/data1/chenjianglong/cmake-ide-build-pool")
(setq cmake-ide-build-pool-use-persistent-naming t)
;;(set 'cmake-ide-build-dir "/data/chenjianglong/brec_live_recall/cmake-build-debug")

(setq cmake-ide-flags-c++
      (mapcar (lambda (item)(concat "-I" item))
              (split-string
               "
 /usr/bin/../lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0
 /usr/bin/../lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0
 /usr/bin/../lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/backward
 /usr/include/clang/8.0.1/include
 /usr/local/include
 /usr/include/x86_64-linux-gnu
 /usr/include
"
               )))
(setq cmake-ide-make-command "make -j12") ;;设置编译指令 并行编译 https://github.com/atilaneves/cmake-ide/issues/97
;;还可以设置 cmake-ide-cmake-command cmake-ide-compile-command

(define-key c++-mode-map (kbd "M-.") 'rtags-find-symbol-at-point)
(define-key c++-mode-map (kbd "M-,") 'rtags-find-references-at-point)

(defun my-company-cc-mode-setup()
  (push '(company-rtags) company-backends)
  )
(add-hook 'c-mode-common-hook 'my-company-cc-mode-setup)

(require 'flycheck-rtags)
;;(add-hook 'after-init-hook #'global-flycheck-mode)
;;(put 'flycheck-disabled-checkers 'safe-local-variable #'listp)

;;rtags和helm集成
(setq rtags-display-result-backend 'helm)
(setq rtags-autostart-diagnostics t)
(defun my-flycheck-rtags-setup ()
  (flycheck-select-checker 'rtags)
  (setq-local flycheck-highlighting-mode nil) ;; RTags creates more accurate overlays.
  (setq-local flycheck-check-syntax-automatically nil))
(add-hook 'c-mode-hook #'my-flycheck-rtags-setup)
(add-hook 'c++-mode-hook #'my-flycheck-rtags-setup)
(add-hook 'objc-mode-hook #'my-flycheck-rtags-setup)

(provide 'my-bigo-cpp-conf)


;;使用auto-complete作补全.
;;有一个问题: 设置3个字符触发补全时:: -> .不能触发补全; 只有设置1个字符就触发补全时:: -> .才能有效触发补全. 而一个字符就触发补全会卡顿.
;; (defun my-ac-cc-mode-setup ()
;;   ;;(require 'auto-complete-clang)
;;   (require 'ac-rtags)
;;   (setq rtags-completions-enabled t)
;;   ;;(rtags-diagnostics)

;;   (setq ac-sources (append '(ac-source-rtags ) ac-sources))
;;   (setf (cdr (assoc 'requires ac-source-rtags)) )

;;   (custom-set-faces
;;    '(ac-clang-candidate-face ((t (:background "color-235" :foreground "color-255"))))
;;    '(ac-clang-selection-face ((t (:inherit popup-menu-selection-face :background "brightred" :foreground ""))))
;;    )
;;   )
;; (add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
