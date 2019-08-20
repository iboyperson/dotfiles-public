;;; init -- emacs init

;;; Code:
;(package-initialize)

;;Set GC
(setq gc-cons-threshold 100000000)
      
;; Maxamize on startup
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Turn off sctartup screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;;Set font
(set-frame-font "Hack 10")

;; Load packages
(require 'package)
(add-hook 'after-init-hook (lambda () (load "~/.emacs.d/load-packages.el")))

(provide 'init)
;;; init.el ends here
