;;; init-markdown -- init markdown mode etc...

;;; Code:
(require 'req-package)

(req-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)))
  ;:init
  ;(setq markdown-command "multimarkdown"))

(req-package vmd-mode
  :ensure t
  :commands (vmd-mode)
  :hook (markdown-mode . vmd-mode))

(provide 'init-markdown)
;;; init-markdown.el ends here
