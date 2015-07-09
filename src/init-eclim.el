(add-to-list 'load-path (expand-file-name "~/.emacs.d/elpa/emacs-eclim-20140809.207"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elpa/company-20141229.2029"))
(require 'eclim)
(require 'eclimd)
(global-eclim-mode)
(custom-set-variables
 '(eclim-eclipse-dirs '("~/eclipse"))
 '(eclim-executable "~/eclipse/eclim"))
(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)
(setq eclimd-default-workspace "~/workspace/")


(require 'auto-complete-config)
(ac-config-default)
;; add the emacs-eclim source
(require 'ac-emacs-eclim-source)
(ac-emacs-eclim-config)
;(require 'company)
;(require 'company-emacs-eclim)
;(add-hook 'after-init-hook 'global-company-mode)
;(add-hook 'java-mode-hook
;          (lambda ()
;            (company-emacs-eclim-setup)
;            (local-set-key (kbd "M-,") 'company-complete)
;            (local-set-key [f5] 'eclim-project-build)
;            ))
(defvar eclimd-port nil
	"The active eclimd port number") ;; fuck bug

(provide 'init-eclim)
(require 'nxml-html-fold)
