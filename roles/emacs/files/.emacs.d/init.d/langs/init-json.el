;;; init-json -- init json related packages

;;; Code:
(require 'req-package)
(req-package json-mode
  :ensure t
  :mode "Pipfile\\.lock\\'")

(req-package json-reformat
  :ensure t
  :commands json-reformat-region
  :init
  (setq json-reformat:indent-width   4
	json-reformat:pretty-string? t))

(req-package json-snatcher
  :ensure t
  :bind ("C-c C-g" . jsons-print-path)
  :commands jsons-print-path
  :hook ((js-mode . js-mode-bindings)
	 (js2-mode . js-mode-bindings)))

(provide 'init-json)
;;; init-json.el ends here
