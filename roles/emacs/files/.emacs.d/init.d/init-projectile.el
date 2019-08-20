;;; init-projectile -- projectile initalization

;;; Code:
(require 'req-package)

(req-package projectile
  :ensure t
  :config
  (projectile-mode))

(provide 'init-projectile)
;;; init-projectile ends here
