;;; -*- lexical-binding: t; -*-
;;; init-snippet -- init all snippet related packages

;;; Code:
(req-package yasnippet
  :hook (prog-mode . yas-minor-mode)
  :config
  (yas-reload-all))

(provide 'init-snippet)
;;; init-snippet.el ends here
