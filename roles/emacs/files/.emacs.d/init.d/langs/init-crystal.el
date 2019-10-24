;;; -*- lexical-binding: t; -*-
;;; init-crystal -- Init all Crystal related packages

;;; Code:
(req-package crystal-mode
  :mode ("\\.cr\\'" . crystal-mode))

(req-package flycheck-crystal
  :require (flycheck crystal-mode))

(req-package inf-crystal
  :commands crystal-switch-to-inf)

(provide 'init-crystal)
;;; init-crystal.el ends here

