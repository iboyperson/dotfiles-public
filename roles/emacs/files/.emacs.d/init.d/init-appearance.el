;;; init-appearance -- init all look and feel related packages

;;; Code:
(require 'req-package)

;; Cursor
(setq-default cursor-type 'bar)

;; Mode-line
(req-package spaceline
  :ensure t
  :init
  (setq powerline-default-separator 'slant)
  :config
  (progn
    (require 'spaceline-config)
    (spaceline-spacemacs-theme)))

;; Theme
(req-package atom-one-dark-theme
  ;:load-path "/home/iboyperson/projects/atom-one-dark-theme"
  :ensure t
  :config
  (load-theme 'atom-one-dark t))

;; Other appearance things...
(req-package anzu
  :ensure t
  :require spaceline
  :config
  (progn
    (global-anzu-mode 1)
    (spaceline-toggle-anzu-on)))

(req-package rainbow-delimiters
  :ensure t
  :commands rainbow-delimiters-mode
  :hook (prog-mode . rainbow-delimiters-mode))

(req-package highlight-indent-guides
  :ensure t
  :hook (prog-mode . highlight-indent-guides-mode)
  :init
  (setq highlight-indent-guides-method 'character))

(req-package dashboard
  :ensure t
  :disabled t
  :config
  (dashboard-setup-startup-hook))

(req-package paren
  :init
  (setq show-paren-delay 0)
  :config
  (show-paren-mode 1))

;; Disable Toolbar
(req-package tool-bar
  :config
  (tool-bar-mode -1))

;; Disable Scroll Bar
(req-package scroll-bar
  :config
  (scroll-bar-mode -1))

;; Stop GNU spam
(fset 'display-startup-echo-area-message #'ignore)
(add-hook 'emacs-startup-hook (lambda () (message "")))

;; Change yes or no prompt to y or n
(fset 'yes-or-no-p 'y-or-n-p)

(provide 'init-appearance)
;;; init-appearance.el ends here
