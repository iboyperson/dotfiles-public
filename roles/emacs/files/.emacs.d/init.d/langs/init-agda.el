;;; -*- lexical-binding: t; -*-
;;; init-agda -- Init all agda related packages

;;; Code:
(req-package agda2-mode
  :straight (:host github :repo "agda/agda"
                   :files
                   ("src/data/emacs-mode/*.el"
                     (:exclude "agda-input.el")))
  :mode "\\.agda\\'"
  :mode "\\.lagda\\'")

(req-package agda-input
  :straight (:host github :repo "agda/agda"
                   :files ("src/data/emacs-mode/agda-input.el"))
  :require agda2-mode)

(provide 'init-agda)
;;; init-agda.el ends here
