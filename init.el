(require 'package) 
(setq package-archives 
       '(("gnu" . "http://elpa.gnu.org/packages/") 
         ("melpa" . "http://melpa.org/packages/"))) 
(package-initialize) 

(add-to-list 'load-path (expand-file-name "~/.emacs.d/src"))
;;安装elpa
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )
;;空格代替tab
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
;;yasnippet配置，据说这段配置应该放到自动补全前面的，因为自动补全用到了yasnippet
(require 'yasnippet)
(yas/initialize)
;
(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20150408.1132")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20150408.1132/dict")
(ac-config-default)

;;emacs+emacs-eclim+eclim+eclipse
(require 'init-eclim)
(custom-set-variables
 '(eclim-eclipse-dirs (quote ("~/eclipse")))
 '(eclim-executable "~/eclipse/eclim"))

;;配置导航树
(global-set-key [f8] 'neotree-toggle)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-indentation-face ((t (:inherit fringe :background "color-244" :foreground "brightred"))))
 '(neo-dir-link-face ((t (:foreground "brightred"))))
 '(neo-file-link-face ((t (:foreground "green"))))
 '(neo-header-face ((t (:foreground "red"))))
 '(neo-root-dir-face ((t (:foreground "green"))))
 '(paren-face-match ((t (:background "green"))))
 '(paren-face-mismatch ((t (:background "red" :foreground "white")))))
;热键设置
(require 'hotkey)
;把波浪线后缀的备份文件统一管理
(setq backup-directory-alist (quote (("." . "~/.backups"))))

;;启动Pymacs和ropemacs。
;;pymacs用来操纵ropemacs，ropemacs是rope的接口，rope是python的代码重构库，用来补全。
;;所以这些配置是用来在Emacs和python之间交互的，能在Emacs下执行python的表达式。本来想做python的补全的。
;;; Initialize Pymacs
;;(autoload 'pymacs-apply "pymacs")
;;(autoload 'pymacs-call "pymacs")
;;(autoload 'pymacs-eval "pymacs" nil t)
;;(autoload 'pymacs-exec "pymacs" nil t)
;;(autoload 'pymacs-load "pymacs" nil t)
;;; Initialize Rope
;;(pymacs-load "ropemacs" "rope-")
;;(setq ropemacs-enable-autoimport t)

;jedi配置，y cannot i call it in jedi-conf? 
(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
;(provide 'jedi-conf)

;projectile conf https://github.com/bbatsov/projectile
(projectile-global-mode)
(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)
(setq projectile-require-project-root nil)

;projectile config
;(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

;输入M-x 自动启动helm命令的匹配
;(global-set-key (kbd "M-x") 'helm-M-x)
;(require 'localparen)
(require 'mic-paren) ; loading
(paren-activate) ; activating

(global-linum-mode t)
