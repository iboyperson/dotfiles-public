;;; -*- lexical-binding: t; -*-
;;; init-go -- init go related packages

;;; Code:
(req-package go-mode
  :mode "\\.go\\'")

;; (req-package company-go
;;   :require (company go-mode)
;;   :config
;;   (add-to-list 'company-backends 'company-go))

(provide 'init-go)
;;; init-go.el ends here
