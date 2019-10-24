;;; -*- lexical-binding: t; -*-
;;; core-packages -- setup package management

;;; Code:
(setq straight-use-package-by-default  t
      straight-repository-branch       "develop"
      straight-check-for-modifications '(watch-files find-when-checking))

(defun ensure-straight ()
  "Ensure `straight' is installed and was compiled with this version of Emacs."
  (defvar bootstrap-version)
  (let ((bootstrap-file
    (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
    (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
      (url-retrieve-synchronously
      "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
      'silent 'inhibit-cookies)
    (goto-char (point-max))
    (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage)))

(ensure-straight)
(straight-use-package 'use-package)

(straight-use-package 'esup)

(provide 'core-packages)
;;; core-packages.el ends here
