;;1. 安装php-mode
;;2. 语法检查,使用flymake(库关联检查,emacs内置) flycheck(需要安装); 另外还需要安装php,需要使用php的语法检错做后端;
(add-hook 'php-mode-hook 'flymake-mode)
(add-hook 'php-mode-hook 'flycheck-mode)




(add-hook 'php-mode-hook
          '(lambda ()
             (auto-complete-mode t)
             (require 'ac-php)
             (setq ac-sources  '(ac-source-php ) )
             ;;(setq ac-php-use-cscope-flag  t )  ;;enable cscope
             (yas-global-mode 1)
             (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
             (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back   ) ;go back
             ))


(provide 'php-conf)
