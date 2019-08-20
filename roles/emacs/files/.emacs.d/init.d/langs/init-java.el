;;; init-java -- init all java related packages

;;; Code:
(require 'req-package)

(req-package meghanada
  :ensure t
  :hook (java-mode . meghanada-mode)
  :bind
  (:map meghanada-mode-map
        ("C-S-t" . meghanada-switch-testcase)
        ("M-RET" . meghanada-local-variable)
        ("C-M-." . helm-imenu)
        ("M-r" . meghanada-reference)
        ("M-t" . meghanada-typeinfo)
        ("C-z" . hydra-meghanada/body))
  :commands meghanada-mode
  :init
  (progn
  (setq indent-tabs-mode              nil
	tab-width                     4
	c-basic-offset                2
	meghanada-server-remote-debug t
	meghanada-javac-xlint         "-Xlint:all,-processing")
  (cond
   ((eq system-type 'windows-nt)
    (setq meghanada-java-path (expand-file-name "bin/java.exe" (getenv "JAVA_HOME")))
    (setq meghanada-maven-path "mvn.cmd"))
   (t
    (setq meghanada-java-path "java")
    (setq meghanada-maven-path "mvn")))))

(provide 'init-java)
;;; init-java.el ends here
