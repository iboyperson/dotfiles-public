;;; -*- lexical-binding: t; -*-
;;; init-data -- load data related packages

;;; Code:
(add-to-list 'auto-mode-alist '("/sxhkdrc\\'" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.\\(?:hex\\|nes\\)\\'" . hexl-mode))

(req-package nxml-mode
  :straight nil
  :mode "\\.p\\(?:list\\|om\\)\\'" ; plist, pom
  :mode "\\.xs\\(?:d\\|lt\\)\\'"   ; xslt, xsd
  :mode "\\.rss\\'"
  :magic "<\\?xml"
  :config
  (setq nxml-slash-auto-complete-flag t
        nxml-auto-insert-xml-declaration-flag t)
  (add-to-list 'company-backends 'company-nxml))

(req-package csv-mode
  :mode "\\.[Cc][Ss][Vv]\\'")

(req-package dhall-mode
  :mode "\\.dhall\\'")

(req-package graphql-mode
  :mode "\\.gql\\'")

(req-package json-mode
  :mode "\\.js\\(?:on\\|[hl]int\\(?:rc\\)?\\)\\'")

(req-package protobuf-mode
  :straight (:host github :repo "emacsmirror/protobuf-mode"
                   :files (:defaults "*"))
  :mode "\\.proto$")

(req-package toml-mode
  :mode ("\\.toml\\'"
	       "\\Pipfile\\'"))

(req-package yaml-mode
  :mode ("\\.yaml\\'"
         "\\.yml\\'"))

(provide 'init-data)
;;; init-data.el ends here
