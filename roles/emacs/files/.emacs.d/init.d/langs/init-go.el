;;; init-go -- init go related packages

;;; Code:
(require 'req-package)

(req-package go-mode
  :ensure t
  :mode "\\.go\\'")

(req-package company-go
  :ensure t
  :require company go-mode
  :config
  (add-to-list 'company-backends 'company-go))

(provide 'init-go)
;;; init-go.el ends here
