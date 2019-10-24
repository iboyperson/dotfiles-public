;;; -*- lexical-binding: t; -*-
;;; core-init -- handle bulk of init process

;;; Code:
;; Load no-littering as early as possible
;; Get use package
(straight-use-package 'use-package)
;; (require-package 'use-package)
(require 'use-package)

;; (require 'use-package-ensure)
;; (setq use-package-always-ensure t)

;; Get req-package
(use-package req-package
  :init
  (straight-use-package 'el-get))

(req-package no-littering
  :init
  (setq no-littering-etc-directory (expand-file-name "config/" user-emacs-directory)
        no-littering-var-directory (expand-file-name "data/" user-emacs-directory))
  :config
  (setq custom-file                    (no-littering-expand-etc-file-name "custom.el")
        auto-save-file-name-transforms `((".*" ,(no-littering-expand-var-file-name "auto-save/") t))
        backup-directory-alist         `((".*" . ,(no-littering-expand-var-file-name "backups/")))))

;; Load init.d
(defconst init-dir "~/.emacs.d/init.d")
(defconst fun-dir "~/.emacs.d/functions.d")

;; (straight-use-package 'load-dir)
(setq force-load-messages nil
        load-dir-debug      nil
        load-dir-recursive  t)

(require 'load-dir )

(load-dir-one init-dir)
(req-package-finish)
(load-dir-one fun-dir)

;; (req-package load-dir
;;   :ensure nil
;;   :force true
;;   :init
;;   (setq force-load-messages nil
;;         load-dir-debug      nil
;;         load-dir-recursive  t)
;;   :config
;;   (load-dir-one init-dir)
;;   (req-package-finish)
;;   (load-dir-one fun-dir))

(provide 'core-init)
;;; core-init.el ends here
