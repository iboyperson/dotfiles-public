;;; init-shell -- init all shell related packages

;;; Code:
(require 'req-package)

(req-package company-shell
  :ensure t
  :require company
  :hook sh-mode
  :config
  (add-to-list 'company-backends '(company-shell company-shell-env)))

(req-package shell-pop
  :ensure t
  :bind ("M-\"" . shell-pop))

(provide 'init-shell)
;;; init-shell.el ends here
