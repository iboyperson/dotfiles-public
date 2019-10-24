;;; -*- lexical-binding: t; -*-
;;; init-assembly -- Init all assembly related packages

;;; Code:
(req-package mips-mode
  :mode "\\.mips$")

(req-package haxor-mode
  :mode ("\\.hax\\'" . haxor-mode))

(req-package nasm-mode)

(provide 'init-assembly)
;;; init-assembly.el ends here
