;;; init-pkgbuild -- pkgbuild mode

;;; Code:

(require 'req-package)

(req-package pkgbuild-mode
  :ensure t
  :mode "\\PKGBUILD\\'")

(provide 'init-pkgbuild)
;;; init-pkgbuild.el ends here

