;;; init-utils -- init general utility packages

;;; Code:
(require 'req-package)

(req-package auto-compile
  :ensure t
  :require spaceline
  :config
  (progn
    (auto-compile-on-load-mode)
    (auto-compile-on-save-mode)
    (spaceline-toggle-auto-compile-on)))

(req-package drag-stuff
  :ensure t
  :config
  (progn
    (drag-stuff-define-keys)
    (drag-stuff-global-mode 1)))

(req-package multiple-cursors
  :ensure t
  :bind
   (("C->" . mc/mark-next-like-this)
    ("C-<" . mc/mark-previous-like-this)
    ("C-*" . mc/mark-all-like-this)))

(req-package smartparens
  :ensure t
  :hook (prog-mode . smartparens-mode)
  :config
  (require 'smartparens-config))

(provide 'init-utils)
;;; init-utils.el ends here
