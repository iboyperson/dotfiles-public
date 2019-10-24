;;; -*- lexical-binding: t; -*-
;;; init-shell -- init all shell related packages

;;; Code:
(req-package company-shell
  :require company
  :hook sh-mode
  :config
  (add-to-list 'company-backends '(company-shell company-shell-env)))

(req-package shell-pop
  :bind ("M-\"" . shell-pop))

(provide 'init-shell)
;;; init-shell.el ends here
