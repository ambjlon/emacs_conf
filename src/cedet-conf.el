;; download http://sourceforge.net/p/cedet/git/ci/master/tree/
;; make
(load-file (concat user-emacs-directory "~/.cedet-git/cedet-devel-load.el"))
(load-file (concat user-emacs-directory "~/.cedet-git/contrib/cedet-contrib-load.el"))

(require 'cc-mode)
(require 'semantic)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)

(semantic-mode 1)

(defun my:add-semantic-to-autocomplete()
  (add-to-list 'ac-sources 'ac-source-semantic)
)
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)
;i don't like cedet-sematic to parse java file, only c and c++ mode, config is as follow
;http://stackoverflow.com/questions/22291985/emacs-cedet-hook
(add-to-list 'semantic-inhibit-functions
             (lambda () (not (member major-mode '(c-mode c++-mode)))))
(global-semantic-idle-summary-mode 1)
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
(require 'cedet-projects)
(provide 'cedet-conf)
