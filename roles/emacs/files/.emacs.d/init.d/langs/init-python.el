;;; init-python -- init all python related packages

;;; Code:
(require 'req-package)

(req-package anaconda-mode
  :ensure t
  :hook ((python-mode . anaconda-mode)
	 (python-mode . anaconda-eldoc-mode)))

(req-package company-anaconda
  :ensure t
  :require anaconda-mode company
  :config
  (add-to-list 'company-backends 'company-anaconda))

(req-package yapfify
  :ensure t
  :hook (python-mode . yapf-mode))

(req-package pipenv
  :ensure t
  :hook (python-mode . pipenv-mode)
  :commands (pipenv-activate
             pipenv-deactivate
             pipenv-shell
             pipenv-open
             pipenv-install
             pipenv-uninstall))

(req-package live-py-mode
  :ensure t
  :commands live-py-mode)

(provide 'init-python)
;;; init-python.el ends here
