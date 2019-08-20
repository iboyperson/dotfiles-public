;;; init-toml -- load toml related packages

;;; Code:
(require 'req-package)

(req-package toml-mode
  :ensure t
  :mode ("\\.toml\\'"
	 "\\Pipfile\\'"))

(provide 'init-toml)
;;; init-toml.el ends here
