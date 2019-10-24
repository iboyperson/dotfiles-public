;;; -*- lexical-binding: t; -*-
;;; init-c-c++ -- Init all C and C++ related packages

;;; Code:
(req-package cc-mode
  :commands (c-mode c++-mode objc-mode java-mode)
  :mode (("\\.h\\'" . c-c++-default-mode-for-headers)
         ("\\.mm\\'" . objc-mode))
  :init
  ;; The plusses in c++-mode can be annoying to search for ivy/helm (which reads
  ;; queries as regexps), so we add these for convenience.
  (defalias 'cpp-mode 'c++-mode)
  (defvaralias 'cpp-mode-map 'c++-mode-map)
  :config
  (c-toggle-auto-newline 1))

(req-package cmake-mode
  :straight (:host github :repo "emacsmirror/cmake-mode"
                   :files (:defaults "*"))
  :require company
  :mode (("CMakeLists\\.txt\\'" . cmake-mode)
	       ("\\.cmake\\'" . cmake-mode)))

(req-package company-cmake
  :require (cmake-mode company)
  :config
  (add-to-list 'company-backends 'company-cmake))

(req-package cuda-mode
  :mode (("\\.cu\\'" . cuda-mode)
         ("\\.cuh\\'" . cuda-mode)))

(req-package demangle-mode
  :hook llvm-mode)

(req-package disaster
  :bind ((:map c-mode-base-map ("C-c d" . disaster))))

(req-package opencl-mode
  :mode ("\\.cl\\'" . opencl-mode))

(req-package modern-cpp-font-lock
  :hook (c++-mode . modern-c++-font-lock-mode))

(req-package glsl-mode
  :mode (("\\.vert\\'" . glsl-mode)
         ("\\.frag\\'" . glsl-mode)))

(req-package company-glsl
  :straight (:host github :repo "Kaali/company-glsl")
  :require glsl-mode
  :config
  (add-to-list 'company-backends 'company-glsl))

(req-package ccls
  :require (lsp-mode)
  :init
  (add-to-list 'projectile-globally-ignored-directories ".ccls-cache")
  (add-to-list 'projectile-project-root-files-bottom-up ".ccls-root")
  (add-to-list 'projectile-project-root-files-top-down-recurring "compile_commands.json"))

(provide 'init-c-c++)
;;; init-c-c++.el ends here
