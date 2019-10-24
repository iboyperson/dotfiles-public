;;; -*- lexical-binding: t; -*-
;;; init-flycheck -- init all flycheck related packages

;;; Code:
(req-package flycheck
  :commands flycheck-list-errors flycheck-buffer
  :config
  (global-flycheck-mode))

(provide 'init-flycheck)
;;; init-flycheck ends here
