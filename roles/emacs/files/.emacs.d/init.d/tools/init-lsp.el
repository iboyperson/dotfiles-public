;;; -*- lexical-binding: t; -*-
;;; init-lsp -- init all Language Server Protocol related packages

;;; Code:
(req-package lsp-mode
  :hook ((c-mode      . lsp)
         (c++-mode    . lsp)
         (java-mode   . lsp)
         (python-mode . lsp)
         (rust-mode   . lsp))
  :commands lsp
  :config
  (setq doom-modeline-lsp t))

(req-package lsp-ui
  :require lsp-mode
  :hook (lsp-mode . lsp-ui-mode)
  :commands lsp-ui-mode
  :config
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references))

(req-package company-lsp
  :require (company lsp-mode)
  :commands company-lsp
  :config
  (push 'company-lsp company-backends)
  (setq company-lsp-async t
        company-lsp-cache-candidates 'auto
        company-lsp-enable-recompletion t))

(req-package helm-lsp
  :require (helm lsp-mode)
  :commands (helm-lsp-workspace-symbol
             helm-lsp-global-workspace-symbol))

(req-package lsp-treemacs
  :require (treemacs lsp-mode)
  :commands (lsp-treemacs-errors-list
             lsp-treemacs-symbols-list
             lsp-treemacs-deps-list))

(req-package dap-mode
  :require lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t))

(provide 'init-lsp)
;;; init-lsp.el ends here
