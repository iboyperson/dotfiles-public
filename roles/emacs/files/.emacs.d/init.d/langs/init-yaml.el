;;; init-yaml -- init yaml-mode and etc..

;;; Code:
(require 'req-package)

(req-package yaml-mode
  :ensure t
  :mode "\\.yml\\'")

(provide 'init-yaml)
;;; init-yaml.el ends here
