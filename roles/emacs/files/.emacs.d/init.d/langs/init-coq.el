;;; -*- lexical-binding: t; -*-
;;; init-coq -- Init all Coq related packages

;;; Code:
(req-package proof-general
  :mode ("\\.v\\'" . proof-general)
  :config
  (setq proof-electric-terminator-enable t))

(req-package company-coq
  :require proof-general
  :config
  (add-hook 'coq-mode-hook #'company-coq-mode))

(provide 'init-coq)
;;; init-coq.el ends here
