;;参考:https://www.emacswiki.org/emacs/EmacsSyntaxTable
;;hack php-mode
(add-hook 'php-mode-hook (lambda ()
                           (modify-syntax-entry ?- "_" php-mode-syntax-table)))

(provide 'hack-syntax-table)
