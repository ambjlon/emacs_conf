;;projectile conf https://github.com/bbatsov/projectile
(projectile-global-mode)
(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)
(setq projectile-require-project-root nil)

;;projectile config
;;(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(provide 'projectile-conf)
