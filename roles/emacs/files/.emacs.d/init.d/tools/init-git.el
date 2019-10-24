;;; -*- lexical-binding: t; -*-
;;; init-magit -- init all magit related packages

;;; Code:
(req-package magit
  :defer 1
  :bind ("C-x g" . magit-status))

(req-package forge
  :require magit)

(req-package git-commit)

(req-package gitattributes-mode
  :mode "\\.gitiattributes\\'")

(req-package gitconfig-mode
  :mode "\\.gitconfig\\'")

(req-package gitignore-mode
  :mode "\\.gitignore\\'")

(provide 'init-magit)
;;; init-git.el ends here
