;;; init-elisp -- init elisp related packages

;;; Code:
(require 'req-package)

(req-package litable
  :ensure t
  :commands litable-mode)

(provide 'init-elisp)
;;; init-elisp.el ends here
