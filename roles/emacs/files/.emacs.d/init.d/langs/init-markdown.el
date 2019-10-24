;;; -*- lexical-binding: t; -*-
;;; init-markdown -- init markdown mode etc...

;;; Code:
(req-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)))
  ;:init
  ;(setq markdown-command "multimarkdown"))

(provide 'init-markdown)
;;; init-markdown.el ends here
