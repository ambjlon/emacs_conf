;;; pyenv-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (pyenv-mode pyenv-mode-unset pyenv-mode-set) "pyenv-mode"
;;;;;;  "pyenv-mode.el" (21659 45132 0 0))
;;; Generated autoloads from pyenv-mode.el

(autoload 'pyenv-mode-set "pyenv-mode" "\
Set python shell VERSION.

\(fn VERSION)" t nil)

(autoload 'pyenv-mode-unset "pyenv-mode" "\
Unset python shell version.

\(fn)" t nil)

(defvar pyenv-mode nil "\
Non-nil if Pyenv mode is enabled.
See the command `pyenv-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `pyenv-mode'.")

(custom-autoload 'pyenv-mode "pyenv-mode" nil)

(autoload 'pyenv-mode "pyenv-mode" "\
Minor mode for pyenv interaction.

\\{pyenv-mode-map}

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("pyenv-mode-pkg.el") (21659 45132 55874
;;;;;;  150000))

;;;***

(provide 'pyenv-mode-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; pyenv-mode-autoloads.el ends here
