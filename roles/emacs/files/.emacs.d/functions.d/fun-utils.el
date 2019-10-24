;;; -*- lexical-binding: t; -*-
;;; fun-utils -- general utility functions

;;; Code:
;; Function to either compile or recompile emacs.d
;; (defun recompile-init()
;;   "Recompile emacs.d directory."
;;   (interactive)
;;   (byte-recompile-file (expand-file-name "early-init.el" user-emacs-directory) 0 0)
;;   (byte-recompile-file (expand-file-name "init.el" user-emacs-directory) 0 0)
;;   ;; (byte-recompile-file (expand-file-name "load-packages.el" user-emacs-directory) 0 0)
;;   (byte-recompile-directory (expand-file-name "core" user-emacs-directory) 0)
;;   (byte-recompile-directory (expand-file-name "init.d" user-emacs-directory) 0)
;;   (byte-recompile-directory (expand-file-name "functions.d" user-emacs-directory) 0))

;; Function to clean up init.d and functions.d
;(defun clean-init()
;  "Clean up init.d and functions.d of .elc files without a respective .el file."
;  (interactive)
;  )

(provide 'fun-utils)
;;; fun-utils.el ends here
