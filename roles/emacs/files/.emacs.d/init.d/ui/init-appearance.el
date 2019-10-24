;;; -*- lexical-binding: t; -*-
;;; init-appearance -- init all look and feel related packages

;;; Code:
;; Cursor
(setq-default cursor-type 'bar)

;; Mode-line
(req-package doom-modeline
  :hook (after-init . doom-modeline-mode)
  :init
  (unless after-init-time
    ;; prevent flash of unstyled modeline at startup
    (setq-default mode-line-format nil))
  ;; Set these early so they don't trigger variable watchers
  (setq doom-modeline-bar-width 3
        doom-modeline-github nil
        doom-modeline-mu4e nil
        doom-modeline-persp-name nil
        doom-modeline-minor-modes nil
        doom-modeline-major-mode-icon nil
        doom-modeline-buffer-file-name-style 'relative-from-project)

  ;; Fix modeline icons in daemon-spawned graphical frames. We have our own
  ;; mechanism for disabling all-the-icons, so we don't need doom-modeline to do
  ;; it for us. However, this may cause unwanted padding in the modeline in
  ;; daemon-spawned terminal frames. If it bothers you, you may prefer
  ;; `doom-modeline-icon' set to `nil'.
  (when (daemonp)
    (setq doom-modeline-icon t))
  :config
  (add-hook 'magit-mode-hook
    (defun +modeline-hide-in-non-status-buffer ()
      "Show minimal modeline in magit-status buffer, no modeline elsewhere."
      (if (eq major-mode 'magit-status-mode)
          (doom-modeline-set-project-modeline)
        (hide-mode-line-mode))))

  ;; Remove unused segments & extra padding
  (doom-modeline-def-modeline 'main
    '(bar window-number matches buffer-info remote-host buffer-position selection-info)
    '(objed-state misc-info persp-name irc mu4e github debug input-method buffer-encoding lsp major-mode process vcs checker))

  (doom-modeline-def-modeline 'special
    '(bar window-number matches buffer-info-simple buffer-position selection-info)
    '(objed-state misc-info persp-name debug input-method irc-buffers buffer-encoding lsp major-mode process checker))

  (doom-modeline-def-modeline 'project
    '(bar window-number buffer-default-directory)
    '(misc-info mu4e github debug " " major-mode process)))

;; Theme
;; (req-package atom-one-dark-theme
;;   ;:load-path "/home/iboyperson/projects/atom-one-dark-theme"
;;   :config
;;   (load-theme 'atom-one-dark t))

(req-package doom-themes
  :init
  (setq doom-themes-enable-bold   t
        doom-themes-enable-italic t)
  :config
  (load-theme 'doom-one t)
  (doom-themes-treemacs-config))

;; Other appearance things...
;; get dimmed sidebars and brighter source buffers
(use-package solaire-mode
  :hook
  ((change-major-mode after-revert ediff-prepare-buffer) . turn-on-solaire-mode)
  ;; (minibuffer-setup . solaire-mode-in-minibuffer)
  :config
  (solaire-global-mode +1)
  (solaire-mode-swap-bg))


(req-package anzu
  :config
  (global-anzu-mode 1))

(req-package rainbow-delimiters
  :commands rainbow-delimiters-mode
  :hook (prog-mode . rainbow-delimiters-mode))

(req-package highlight-indent-guides
  :hook (prog-mode . highlight-indent-guides-mode)
  :init
  (setq highlight-indent-guides-method 'character))

(req-package dashboard
  :init
  (setq dashboard-startup-banner 'logo
        dashboard-center-content t
        dashboard-set-navigator  t)
  :config
  (dashboard-setup-startup-hook))

(req-package paren
  :init
  (setq show-paren-delay 0)
  :config
  (show-paren-mode 1))

(provide 'init-appearance)
;;; init-appearance.el ends here
