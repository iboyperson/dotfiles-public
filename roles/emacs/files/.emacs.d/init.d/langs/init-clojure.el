;;; -*- lexical-binding: t; -*-
;;; init-clojure -- Init all Clojure related packages

;;; Code:
(req-package cider
  :commands (cider-jack-in cider-jack-in-clojurescript)
  :hook (clojure-mode . cider-mode)
  :init
  ;; Error messages emitted from CIDER is silently funneled into *nrepl-server*
  ;; rather than the *cider-repl* buffer. How silly. We might want to see that
  ;; stuff and who's going to check *nrepl-server* on every startup? I've got a
  ;; better idea: we copy these errors into the *cider-repl* buffer.
  (add-hook 'cider-connected-hook
    (defun +clojure--cider-dump-nrepl-server-log ()
      "Copy contents of *nrepl-server* to beginning of *cider-repl*."
      (save-excursion
        (goto-char (point-min))
        (insert
         (with-current-buffer nrepl-server-buffer
           (buffer-string))))))

  ;; The CIDER welcome message obscures error messages that the above code is
  ;; supposed to be make visible.
  (setq cider-repl-display-help-banner nil)

  )

(req-package clj-refactor
  :hook (clojure-mode . clj-refactor-mode))

(req-package flycheck-joker
  :require flycheck)

(provide 'init-clojure)
;;; init-clojure.el ends here
