(require 'ede)
(global-ede-mode)
;(ede-cpp-root-project "linux_kernel" :file "~/linux-4.1.2/Makefile")
                 ;     :include-path '("/include"))
;(ede-cpp-root-project "my project" :file "~/my_program/src/main.cpp"
 ;                     :include-path '("/../my_inc"))
(ede-cpp-root-project "ha3" :file "~/ha3/warhorse/branches/init_version/SConstruct")
;                      :include-path '("/include" "/usr-include" "usr-local-include"))
(provide 'cedet-projects)
