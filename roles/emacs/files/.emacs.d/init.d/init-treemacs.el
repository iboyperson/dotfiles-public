;;; init-treemacs -- init treemacs and all related packages

;;; Code:
(require 'req-package)

(req-package treemacs
  :ensure t
  :require no-littering
  :bind
  (:map global-map
        ([f8] . treemacs)
        ("C-c f" . treemacs-select-window))
  :init
  (setq treemacs-collapse-dirs              (if (executable-find "python") 3 0)
        treemacs-file-event-delay           5000
        treemacs-follow-after-init          t
        treemacs-follow-recenter-distance   0.1
        treemacs-goto-tag-strategy          'refetch-index
        treemacs-indentation                2
        treemacs-indentation-string         " "
        treemacs-is-never-other-window      nil
        treemacs-no-png-images              nil
        treemacs-project-follow-cleanup     nil
        treemacs-persist-file               (no-littering-expand-var-file-name "treemacs/treemacs-persist")
        treemacs-recenter-after-file-follow nil
        treemacs-recenter-after-tag-follow  nil
        treemacs-show-hidden-files          t
        treemacs-silent-filewatch           nil
        treemacs-silent-refresh             nil
        treemacs-sorting                    'alphabetic-desc
        treemacs-space-between-root-nodes   t
        treemacs-tag-follow-cleanup         t
        treemacs-tag-follow-delay           1.5
        treemacs-width                      35)

  :config
  (progn
    (add-to-list 'treemacs-pre-file-insert-predicates #'treemacs-is-file-git-ignored?)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null (executable-find "python3"))))
      (`(t . t)
       (treemacs-git-mode 'extended))
      (`(t . _)
       (treemacs-git-mode 'simple)))))
    
  
(req-package treemacs-projectile
  :ensure t
  :require treemacs projectile
  :bind
  (:map global-map
        ("C-c o p" . treemacs-projectile)))

(provide 'init-treemacs)
;;; init-treemacs.el ends here
