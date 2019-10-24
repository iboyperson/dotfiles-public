;;; -*- lexical-binding: t; -*-
;;; init-company -- init all company related files

;;; Code:
(req-package company
  :init
  (setq company-idle-delay            0
	      company-minimum-prefix-length 1
	      company-tooltip-limit         10)
  :config
  (global-company-mode))

(req-package company-quickhelp
  :require company
  :hook (company-mode . company-quickhelp-mode))

(provide 'init-company)
;;; init-company.el ends here
