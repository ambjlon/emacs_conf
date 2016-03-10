;;jedi配置，y cannot i call it in jedi-conf? 
(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(provide 'python-conf)
