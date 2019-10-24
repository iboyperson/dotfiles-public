;;; -*- lexical-binding: t; -*-
;;; init-csharp -- init all C# related packages

;;; Code:
(req-package csharp-mode
  :mode "\\.cs\\'")

(req-package omnisharp
  :hook (csharp-mode . omnisharp-mode)
  :init
  ;; needed to avoid an error when fetching doc using company
  ;; Note: if you are using a roslyn based omnisharp server you can
  ;; set back this variable to t.
  (setq omnisharp-auto-complete-want-documentation nil)
  (add-to-list 'company-backends 'company-omnisharp))

(req-package shader-mode
  :mode "\\.shader$") 

(provide 'init-csharp)
;;; init-csharp.el ends here
