(require 'package) 
(setq package-archives 
       '(("gnu" . "http://elpa.gnu.org/packages/") 
         ("melpa" . "http://melpa.org/packages/"))) 
(package-initialize) 
(add-to-list 'load-path (expand-file-name "~/.emacs.d/src"))
;;安装elpa 做版本检测 暂时不使用这个配置
;(when (>= emacs-major-version 24)
;  (require 'package)
;  (package-initialize)
;  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;  )

;;空格代替tab
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)

;;yasnippet配置，据说这段配置应该放到自动补全前面的，因为自动补全用到了yasnippet
;(require 'yasnippet)
;(yas/initialize)

;;不显示菜单栏 工具栏
(menu-bar-mode 0)

(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20150408.1132")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20150408.1132/dict")
(ac-config-default)

;;emacs+emacs-eclim+eclim+eclipse
;(require 'init-eclim)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-use-fuzzy t)
 '(sr-speedbar-auto-refresh t)
 '(sr-speedbar-default-width 30)
 '(sr-speedbar-right-side nil))

;;配置导航树
(global-set-key [f8] 'neotree-toggle)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-candidate-face ((t (:inherit popup-face :stipple nil :background "color-235" :foreground "color-255"))))
 '(ac-candidate-mouse-face ((t (:inherit popup-menu-mouse-face :background "green" :distant-foreground "yellow" :foreground "red"))))
 '(ac-completion-face ((t (:background "color-235" :foreground "color-255"))))
 '(ac-emacs-eclim-candidate-face ((t (:background "green" :foreground "red"))))
 '(ac-emacs-eclim-selection-face ((t (:background "yellow" :foreground "black"))))
 '(ac-gtags-candidate-face ((t (:inherit ac-candidate-face :background "magenta" :foreground "black"))))
 '(ac-gtags-selection-face ((t (:inherit ac-selection-face :background "black" :foreground "red"))))
 '(ac-php-candidate-face ((t (:background "color-235" :foreground "brightwhite"))))
 '(ac-php-selection-face ((t (:background "brightred" :foreground "black"))))
 '(ac-selection-face ((t (:inherit popup-menu-selection-face :background "brightred" :foreground "black"))))
 '(flycheck-error ((t (:inherit error :background "black" :overline nil :underline (:color foreground-color :style wave)))))
 '(helm-candidate-number ((t (:background "brightred" :foreground "brightwhite"))))
 '(helm-grep-file ((t (:background "color-16" :foreground "brightwhite" :underline t))))
 '(helm-header ((t (:inherit nil :background "black"))))
 '(helm-match ((t (:background "black" :foreground "brightred"))))
 '(helm-selection ((t (:background "green" :distant-foreground "brightwhite"))))
 '(helm-selection-line ((t (:inherit nil :background "green" :distant-foreground "brightwhite"))))
 '(helm-source-header ((t (:background "brightred" :foreground "brightwhite" :weight bold :height 1.3 :family "Sans Serif"))))
 '(helm-visible-mark ((t (:background "green" :distant-foreground "brightwhite"))))
 '(highlight-indentation-current-column-face ((t (:background "magenta"))))
 '(highlight-indentation-face ((t (:inherit fringe :background "color-243" :foreground "white"))))
 '(hl-tags-face ((t (:inherit highlight :background "magenta" :foreground "white" :strike-through nil))))
 '(neo-dir-link-face ((t (:foreground "brightred"))))
 '(neo-file-link-face ((t (:foreground "green"))))
 '(neo-header-face ((t (:foreground "red"))))
 '(neo-root-dir-face ((t (:foreground "green"))))
 '(paren-face-match ((t (:background "green"))))
 '(paren-face-mismatch ((t (:background "red" :foreground "white"))))
 '(sp-pair-overlay-face ((t (:inherit highlight :background "brightblack" :foreground "brightwhite")))))
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


;projectile conf https://github.com/bbatsov/projectile
(projectile-global-mode)
(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)
(setq projectile-require-project-root nil)

;projectile config
;(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
;smartparens
(require 'smartparens-conf) ; loading
;启动时显示行号
(global-linum-mode t)
;
(require 'setup-helm)
;引入helm-tags-conf
;;(require 'helm-gtags-conf)

(require 'sr-speedbar-conf)

;;cedet conf from https://www.youtube.com/watch?v=Ib914gNr0ys
;(semantic-mode 1)
;(defun my:add-semantic-to-autocomplete()
;  (add-to-list 'ac-sources 'ac-source-semantic)
;)
;(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)
;(require 'ede)
;(global-ede-mode)
;(ede-cpp-root-project "my project" :file "~/my_program/src/main.cpp"
;                      :include-path '("/../my_inc"))
;(global-semantic-idle-scheduler-mode 1)

;(require 'cedet-conf)

;;nxml tags matching
(add-hook 'sgml-mode-hook '(lambda ()
                            (require 'hl-tags-mode)
                            (hl-tags-mode 1)
                            ))
(add-hook 'nxml-mode-hook '(lambda ()
                             (require 'hl-tags-mode)
                             (hl-tags-mode 1)
                             ))
;; function-args conf
;(require 'function-args-conf)

;browse kill ring conf
;(require 'browse-kill-ring-conf)
(require 'utf8-set)
(require 'my-go-conf)
(require 'php-conf)
(require 'ace-jump-conf)
(require 'recent-jump-conf)
(require 'copy-paste-conf)
