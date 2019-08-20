;;; load-packages -- loads required packages

;;; Code:
;; start emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

;; Package Repositories
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))
    (unless no-ssl
      ;; Force SSL for GNU ELPA
      (setcdr (assoc "gnu" package-archives) "https://elpa.gnu.org/packages/"))))
	(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))

(eval-when-compile (package-initialize))

(defun require-package (package)
  "Refresh package archives, check package presence and install if it's not installed."
  (if (null (require package nil t))
      (progn (let* ((ARCHIVES (if (null package-archive-contents)
                                  (progn (package-refresh-contents)
                                         package-archive-contents)
                                package-archive-contents))
                    (AVAIL (assoc package ARCHIVES)))
               (if AVAIL
                   (package-install package)))
             (require package))))

(defconst init-dir "~/.emacs.d/init.d")
(defconst fun-dir "~/.emacs.d/functions.d")

;; Get use package
(require-package 'use-package)
(require 'use-package)

;; Get req-package
(use-package req-package
  :ensure t)

;; Load no-littering as early as possible
(req-package no-littering
  :ensure t
  :init
  (setq no-littering-etc-directory
      (expand-file-name "config/" user-emacs-directory))
  (setq no-littering-var-directory
	(expand-file-name "data/" user-emacs-directory))
  :config
  (setq custom-file (no-littering-expand-etc-file-name "custom.el"))
  (setq auto-save-file-name-transforms
	`((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))
  (setq backup-directory-alist
      `((".*" . ,(no-littering-expand-var-file-name "backups/")))))

;; Load init.d
(req-package load-dir
  :ensure t
  :force true
  :init
  (setq force-load-messages nil)
  (setq load-dir-debug nil)
  (setq load-dir-recursive t)
  :config
  (load-dir-one init-dir)
  (req-package-finish)
  (load-dir-one fun-dir))

(provide 'load-packages)
;;; load-packages.el ends here
