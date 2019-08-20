;;; init-rust -- Init all rust related packages

;;; Code:
(require 'req-package)

(req-package rust-mode
  :ensure t
  :mode ("\\.rs\\'" . rust-mode)
  :init
  (setq rust-format-on-save t))

(req-package flycheck-rust
  :ensure t
  :require flycheck rust-mode
  :hook (flycheck-mode . flycheck-rust-setup))

(req-package cargo
  :ensure t
  :require rust-mode)

(req-package racer
  :ensure t
  :require company rust-mode
  :hook (rust-mode . racer-mode)
  :init
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode))

(provide 'init-rust)
;;; init-rust.el ends here.
