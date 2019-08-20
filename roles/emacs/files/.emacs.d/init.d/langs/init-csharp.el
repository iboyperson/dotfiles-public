;;; init-csharp -- init all C# related packages

;;; Code:
(require 'req-package)

(req-package csharp-mode
  :ensure t
  :mode ("\\.cs\\'" . csharp-mode))

(req-package omnisharp
  :ensure t
  :hook (csharp-mode . omnisharp-mode)
  :init
  ;; needed to avoid an error when fetching doc using company
  ;; Note: if you are using a roslyn based omnisharp server you can
  ;; set back this variable to t.
  (setq omnisharp-auto-complete-want-documentation nil))

(provide 'init-csharp)
;;; init-csharp.el ends here
