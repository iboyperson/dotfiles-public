;;; init-check -- init all flycheck related packages

;;; Code:
(require 'req-package)

(req-package flycheck
  :ensure t
  :require spaceline
  :config
  (global-flycheck-mode 1)
  (spaceline-toggle-flycheck-error-on)
  (spaceline-toggle-flycheck-warning-on)
  (spaceline-toggle-flycheck-info-on))

(req-package flyspell
  :ensure t
  :hook ((text-mode . flyspell-mode)
	 (prog-mode . flyspell-prog-mode)))

(req-package auto-dictionary
  :ensure t
  :hook (flyspell-mode . auto-dictionary-mode))

(provide 'init-check)
;;; init-check ends here
