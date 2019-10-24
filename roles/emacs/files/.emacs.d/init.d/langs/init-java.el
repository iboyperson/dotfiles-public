;;; -*- lexical-binding: t; -*-
;;; init-java -- init all java related packages

;;; Code:
(req-package lsp-java
  :require lsp-mode)

(req-package dap-java
  :straight nil
  :require (lsp-java dap-mode))

(provide 'init-java)
;;; init-java.el ends here
