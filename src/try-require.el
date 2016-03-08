;;统计消耗时间的语句
;;(setf *start-time* (current-time))
;;(setf *end-time* (current-time))
;;(message "fuck :%s" (float-time (time-subtract *end-time* *start-time*)))

;; Function to collect information of packages.
(defvar missing-packages-list nil
  "List of packages that `try-require' can't find.")

(defvar package-init-statistic nil "Package loading statistics")

;; attempt to load a feature/library, failing silently
(defun try-require (feature &optional click)
  "Attempt to load a library or module. Return true if the
library given as argument is successfully loaded. If not, instead
of an error, just add the package to a list of missing packages."
  (condition-case err
      ;; protected form
      (let ((timestamp (current-time))
            (package (if (stringp feature) feature (symbol-name feature))))
        (if (stringp feature)
            (load-library feature)
          (require feature))
        (if click
            (add-to-list 'package-init-statistic
                         (cons (if (stringp feature) feature (symbol-name feature))
                               (float-time (time-since timestamp)))))
        (message "Checking for library `%s'... Found, cost %.2f seconds"
                 feature (float-time (time-since timestamp))))
    ;; error handler
    (file-error  ; condition
     (progn
       (message "Checking for library `%s'... Missing" feature)
       (add-to-list 'missing-packages-list feature 'append))
     nil)))

(provide 'try-require)
