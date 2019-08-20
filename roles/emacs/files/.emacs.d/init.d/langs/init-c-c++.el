;;; init-c-c++ -- Init all C and C++ related packages

;;; Code:
(require 'req-package)

(req-package cc-mode
  :ensure t
  :mode ("\\.h\\'" . c-c++-default-mode-for-headers)
  :config
  (c-toggle-auto-newline 1))

(req-package disaster
  :ensure t
  :commands (disaster))

(req-package cmake-mode
  :ensure t
  :require company
  :mode (("CMakeLists\\.txt\\'" . cmake-mode)
	 ("\\.cmake\\'" . cmake-mode)))

(req-package company-c-headers
  :ensure t
  :require company
  :config
  (add-to-list 'company-backends 'company-c-headers))

(req-package ycmd
  :ensure t
  :hook ((c++-mode . ycmd-mode)
	 (c-mode . ycmd-mode))
  :config
  (progn
    (require 'company-ycmd)
    (company-ycmd-setup)

    (require 'flycheck-ycmd)
    (flycheck-ycmd-setup)

    (require 'ycmd-eldoc)
    (add-hook 'ycmd-mode-hook 'ycmd-eldoc-setup)))

(provide 'init-c-c++)
;;; init-c-c++.el ends here
