;;; -*- lexical-binding: t; -*-
;;; init-python -- init all python related packages

;;; Code:
(req-package anaconda-mode
  :hook ((python-mode . anaconda-mode)
         (python-mode . anaconda-eldoc-mode)))

(req-package company-anaconda
  :require (anaconda-mode company)
  :config
  (add-to-list 'company-backends 'company-anaconda))

(req-package lsp-python-ms
  :require lsp-mode
  :init
  (setq lsp-python-ms-dir (no-littering-expand-var-file-name "lsp-python-ms/mspyls/")))

(req-package pipenv
  :hook (python-mode . pipenv-mode)
  :commands (pipenv-activate
             pipenv-deactivate
             pipenv-shell
             pipenv-open
             pipenv-install
             pipenv-uninstall))

(provide 'init-python)
;;; init-python.el ends here
