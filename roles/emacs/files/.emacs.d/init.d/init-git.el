;;; init-magit -- init all magit related packages

;;; Code:
(require 'req-package)

(req-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(req-package forge
  :ensure t
  :require magit)

(req-package git-commit
  :ensure t)

(req-package gitattributes-mode
  :ensure t
  :mode "\\.gitiattributes\\'")

(req-package gitconfig-mode
  :ensure t
  :mode "\\.gitconfig\\'")

(req-package gitignore-mode
  :ensure t
  :mode "\\.gitignore\\'")

(provide 'init-magit)
;;; init-git.el ends here
