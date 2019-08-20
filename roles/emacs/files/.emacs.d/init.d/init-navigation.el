;;; init-navigation -- init all emacs navigation related packages

;;; Code:
(require 'req-package)

(req-package windmove
  :bind
  (("C-c <left>" . windmove-left)
   ("C-c <right>" . windmove-right)
   ("C-c <up>" . windmove-up)
   ("C-c <down>" . windmove-down)))

(provide 'init-navigation)
;;; init-navigation.el ends here
