;;; init-ini init all ini related packages

;;; Code:
(require 'req-package)

(req-package ini-mode
  :ensure t
  :mode "\\.ini\\'")

(provide 'init-ini)
;;; init-ini.el ends here
