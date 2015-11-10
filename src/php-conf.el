;;1. 安装php-mode

;;2. 语法检查,需要安装php,需要使用php的语法检错做后端;一定要把php安装到系统路径，不然会提示flymake配置，很蛋疼的。
;;2.1使用flymake(库关联检查,emacs内置)
;;(add-hook 'php-mode-hook 'flymake-mode)
;;2.2flycheck(需要安装); 
;;(add-hook 'php-mode-hook 'flycheck-mode) ;;flycheck 不起作用，蛋疼 还试了flymake-php这个包，
;;2.3 使用flymake-php包 暂时使用这个吧
;;(require 'flymake-php)
;;(add-hook 'php-mode-hook 'flymake-php-load)

;;3.自动补全 智能提示以及跳转使用ac-php
;; 此外，etags gtags也能使用，三者各有千秋。
(add-hook 'php-mode-hook
          '(lambda ()
             (auto-complete-mode t)
             (require 'ac-php)
             ;;(setq ac-sources  '(ac-source-php ) )
             (add-to-list 'ac-sources 'ac-source-php)
             ;;(setq ac-php-use-cscope-flag  t )  ;;enable cscope

             (require 'yasnippet)
             (setq yas-snippet-dirs '("~/.emacs.d/yasmate"))
             (yas-global-mode 1)
             
             (define-key php-mode-map  (kbd "M-.") 'ac-php-find-symbol-at-point)   ;goto define
             (define-key php-mode-map  (kbd "M-,") 'ac-php-location-stack-back   ) ;go back
             ))

;;使用etags补全，各种语言通用的套路 etags是linux系统内置的工具
;;在根目录下运行find . -name "*.php"|etags - 得到TAGS文件
;;使用M-. & M-*来回跳转 参考http://linux.chinaunix.net/techdoc/desktop/2008/09/13/1031663.shtml

(provide 'php-conf)
