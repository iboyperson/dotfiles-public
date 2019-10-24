;;; -*- lexical-binding: t; -*-
;;; init-rust -- Init all rust related packages

;;; Code:
(req-package rust-mode
  :mode ("\\.rs\\'" . rust-mode)
  :init
  (when EMACS26+
    (straight-use-package 'rustic))
  (setq rust-format-on-save t)
  :config
  ;; This is necessary because both plugins are fighting for supremacy in
  ;; `auto-mode-alist', so rustic-mode *must* load second. It only needs to
  ;; happen once.
  ;;
  ;; rust-mode is still required for `racer'.
  (add-hook 'rust-mode-hook
    (defun +rust-init ()
      "Switch to `rustic-mode', if it's available."
      (when (require 'rustic nil t)
        (rustic-mode)))))

(req-package cargo
  :require rust-mode)

(provide 'init-rust)
;;; init-rust.el ends here.
