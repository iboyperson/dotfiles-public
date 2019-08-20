;;; init-helm -- init all helm related packages

;;; Code:
(require 'req-package)

(req-package helm
  :ensure t
  :demand
  :require spaceline
  :bind (("M-x" . helm-M-x)
	 ("C-x b" . helm-mini)
	 ("C-x r b" . helm-filtered-bookmarks)
	 ("C-x C-f" . helm-find-files))
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
    (helm-autoresize-mode 1)
    (spaceline-helm-mode)))

(req-package helm-flx
  :ensure t
  :init
  (setq helm-flx-for-helm-find-files t
        helm-flx-for-helm-locate     t)
  :config
  (helm-flx-mode +1))

(req-package helm-gitignore
  :ensure t
  :commands helm-gitignore)

(req-package helm-projectile
  :ensure t
  :require helm projectile
  :config
  (helm-projectile-on))

(provide 'init-helm)
;;; init-helm.el ends here
