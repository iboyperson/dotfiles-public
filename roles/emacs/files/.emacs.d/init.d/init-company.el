;;; init-company -- init all company related files

;;; Code:
(require 'req-package)

(req-package company
  :ensure t
  :init
  (setq company-idle-delay            0
	company-minimum-prefix-length 1
	company-tooltip-limit         10)
  :config
  (global-company-mode))

(req-package company-quickhelp
  :ensure t
  :require company
  :hook (company-mode . company-quickhelp-mode))

(provide 'init-company)
;;; init-company.el ends here
