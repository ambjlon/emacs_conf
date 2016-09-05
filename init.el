(add-to-list 'load-path (expand-file-name "~/.emacs.d/src"))
(require 'elap-conf)

(require 'basic-edit-conf)

(require 'python-conf)

(require 'php-conf)

(require 'nxml-conf)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;;smartparens
(require 'smartparens-conf) ; loading

;;yasnippet配置，据说这段配置应该放到自动补全前面的，因为自动补全用到了yasnippet
;(require 'yasnippet)
;(yas/initialize)

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
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(ansi-term-color-vector
   [unspecified "#202020" "#fb9fb1" "#acc267" "#ddb26f" "#6fc2ef" "#e1a3ee" "#6fc2ef" "#e0e0e0"])
 '(custom-enabled-themes (quote (manoj-dark)))
 '(custom-safe-themes
   (quote
    ("6aae2eb39ce5d67379a4718cdb295b819c4100ddda8d07fa8eab53289a0b7551" "134101847bd0a2ae22c72cbfda59cddf1039f9bb2b71e5ffd704feed5b409cfc" "e989d10979a9bd3230077945a8169cf6988cbc7ca7ca95fc7dfe373d573eea85" "63fa843551cceac4958cc0e40e5e36c1ff79e39e1a4916017c225aca677de9d0" "dc594e589d7927c234c35de25a355203ab702008494cbd5213a9f17458411d85" "2daf79d4048f0f7280f6e6b763c8c81f8cef96ef8444b42ea0eb3023fe387eac" "bf4226951ab37488d5631f2fc15416a557ea41a4629ff63a257ee7dcdf3f2fb9" "83333ecaaaed863a4ab7f9f0247de7264b9d388e68d8c705ed0e01584ab6881a" default)))
 '(sp-wrap-from-point t)
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
 '(helm-buffer-directory ((t (:background "black" :foreground "blue"))))
 '(helm-buffer-not-saved ((t (:foreground "brightred"))))
 '(helm-buffer-process ((t (:foreground "green"))))
 '(helm-candidate-number ((t (:background "color-186" :foreground "black"))))
 '(helm-ff-directory ((t (:background "black" :foreground "color-21"))))
 '(helm-ff-dotted-directory ((t (:background "black" :foreground "color-186"))))
 '(helm-ff-executable ((t (:foreground "color-40"))))
 '(helm-grep-file ((t (:background "color-16" :foreground "brightwhite" :underline t))))
 '(helm-header ((t (:inherit nil :background "black"))))
 '(helm-match ((t (:background "black" :foreground "brightred"))))
 '(helm-selection ((t (:inherit nil :background "color-234" :underline nil))))
 '(helm-selection-line ((t (:inherit nil :background "green" :distant-foreground "brightwhite"))))
 '(helm-source-header ((t (:background "black" :foreground "brightwhite" :weight bold :height 1.3 :family "Sans Serif"))))
 '(helm-visible-mark ((t (:background "color-94" :distant-foreground "brightwhite"))))
 '(highlight-indentation-current-column-face ((t (:background "magenta"))))
 '(highlight-indentation-face ((t (:inherit fringe :background "color-243" :foreground "white"))))
 '(hl-tags-face ((t (:box nil :strike-through nil :underline (:color "brightblack" :style wave)))))
 '(neo-dir-link-face ((t (:foreground "brightred"))))
 '(neo-file-link-face ((t (:foreground "green"))))
 '(neo-header-face ((t (:foreground "red"))))
 '(neo-root-dir-face ((t (:foreground "green"))))
 '(paren-face-match ((t (:background "green"))))
 '(paren-face-mismatch ((t (:background "red" :foreground "white"))))
 '(sp-pair-overlay-face ((t (:inherit highlight :background "brightblack" :foreground "brightwhite"))))
 '(sp-show-pair-enclosing ((t (:background "black" :foreground "green" :underline "black"))))
 '(sp-show-pair-match-face ((t (:background "color-16" :foreground "green" :underline "brightblack"))))
 '(sp-show-pair-mismatch-face ((t (:background "color-16" :foreground "red")))))


;projectile conf https://github.com/bbatsov/projectile
(projectile-global-mode)
(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)
(setq projectile-require-project-root nil)

;projectile config
;(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

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




;; function-args conf
;(require 'function-args-conf)

;browse kill ring conf
;(require 'browse-kill-ring-conf)
(require 'utf8-set)
(require 'my-go-conf)
(require 'ace-jump-conf);;helm-swoop或许是更好的选择
(require 'recent-jump-conf)
(require 'copy-paste-conf)
(require 'hack-syntax-table)
