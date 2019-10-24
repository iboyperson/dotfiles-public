;;; -*- lexical-binding: t; -*-
;;; init-utils -- init general utility packages

;;; Code:
(req-package auto-compile
  :config
  (progn
    (auto-compile-on-load-mode)
    (auto-compile-on-save-mode)))

(req-package drag-stuff
  :config
  (progn
    (drag-stuff-define-keys)
    (drag-stuff-global-mode 1)))

(req-package multiple-cursors
  :bind
   (("C->" . mc/mark-next-like-this)
    ("C-<" . mc/mark-previous-like-this)
    ("C-*" . mc/mark-all-like-this)))

(req-package smartparens
  :hook (prog-mode . smartparens-mode)
  :config
  (require 'smartparens-config))

(provide 'init-utils)
;;; init-utils.el ends here
