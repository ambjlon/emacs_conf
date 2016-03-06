(require 'package) 
(setq package-archives 
       '(("gnu" . "http://elpa.gnu.org/packages/") 
         ("melpa" . "http://melpa.org/packages/"))) 
(package-initialize) 

(add-to-list 'load-path (expand-file-name "~/.emacs.d/src"))

(require 'auto-complete-conf)
(require 'neotree-conf)
(require 'basic-edit-conf)
(require 'smartparens-conf) 
(require 'setup-helm)
(require 'sr-speedbar-conf)
(require 'utf8-set)
(require 'ace-jump-conf)
(require 'recent-jump-conf)
(require 'copy-paste-conf)
(require 'projectile-conf)
(require 'browse-kill-ring-conf)


;;外观定制
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
 '(ac-selection-face ((t (:inherit popup-menu-selection-face :background "brightred" :foreground "black"))))
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
 '(neo-dir-link-face ((t (:foreground "brightred"))))
 '(neo-file-link-face ((t (:foreground "green"))))
 '(neo-header-face ((t (:foreground "red"))))
 '(neo-root-dir-face ((t (:foreground "green"))))
 '(sp-pair-overlay-face ((t (:inherit highlight :background "brightblack" :foreground "brightwhite")))))

;;变量定制
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-use-fuzzy t)
 '(sr-speedbar-auto-refresh t)
 '(sr-speedbar-default-width 30)
 '(sr-speedbar-right-side nil))
(put 'set-goal-column 'disabled nil)
