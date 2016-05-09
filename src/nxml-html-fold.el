;;使用hs-minor-mode 也是就是HideShow 可以对各种语言c c++ php java 进行折叠， 这是通过识别大括号等字符实现的.
;;但是对nxml类的就没法折叠了， 作如下的配置即可，实际上就是把正则匹配的范围扩大了.

;; Fix XML folding
(add-to-list 'hs-special-modes-alist
             (list 'nxml-mode
                   "<!--\\|<[^/>]*[^/]>"
                   "-->\\|</[^/>]*[^/]>"
                   "<!--"
                   'nxml-forward-element
                   nil))

;; Fix HTML folding
(dolist (mode '(sgml-mode
                html-mode
                html-erb-mode))
  (add-to-list 'hs-special-modes-alist
               (list mode
                     "<!--\\|<[^/>]*[^/]>"
                     "-->\\|</[^/>]*[^/]>"
                     "<!--"
                     'sgml-skip-tag-forward
                     nil)))
(provide 'nxml-html-fold)
