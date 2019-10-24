;;; -*- lexical-binding: t; -*-
;;; init-helm -- init all helm related packages

;;; Code:
(req-package helm
  :demand
  :bind (("M-x" . helm-M-x)
	       ("C-x b" . helm-mini)
	       ("C-x r b" . helm-filtered-bookmarks)
	       ("C-x C-f" . helm-find-files))
  :preface
  (setq helm-candidate-number-limit 50
        ;; Remove extraineous helm UI elements
        helm-display-header-line nil
        helm-mode-line-string nil
        helm-ff-auto-update-initial-value nil
        helm-find-files-doc-header nil
        ;; Default helm window sizes
        helm-display-buffer-default-width nil
        helm-display-buffer-default-height 0.25
        ;; When calling `helm-semantic-or-imenu', don't immediately jump to
        ;; symbol at point
        helm-imenu-execute-action-at-once-if-one nil
        ;; disable special behavior for left/right, M-left/right keys.
        helm-ff-lynx-style-map nil)

  :init
  (setq helm-idle-delay                   0.0
        helm-input-idle-delay             0.01
        helm-quick-update                 t
        helm-M-x-requires-pattern         nil
        helm-ff-skip-boring-files         t
	      helm-ff-search-library-in-sexp    t
	      helm-candidate-number-limit       100
	      helm-move-to-line-cycle-in-source t
	      helm-autoresize-max-height        40
	      helm-autoresize-min-height        30
	      helm-split-window-in-side-p       t)
  :config
  (progn
    (require 'helm-config)
    (helm-mode 1)
    (helm-autoresize-mode 1)))

(req-package helm-flx
  :require helm
  :init
  (setq helm-flx-for-helm-find-files t
        helm-flx-for-helm-locate     t)
  :config
  (helm-flx-mode +1))

(req-package helm-gitignore
  :require helm
  :commands helm-gitignore)

(req-package helm-projectile
  :require (helm projectile)
  :config
  (helm-projectile-on))

(provide 'init-helm)
;;; init-helm.el ends here
