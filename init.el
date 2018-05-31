;;; init.el --- enorris' .emacs file
;;; Commentary:
;;

;;; Code:

;; Bootstrap built-in package management
(require 'package)

(setq package-enable-at-startup nil)

(setq package-archives
      '(("GNU" . "https://elpa.gnu.org/packages/")
        ("MELPA Stable" . "https://stable.melpa.org/packages/")
        ("MELPA" . "https://melpa.org/packages/")))

(defvar package-archive-priorities)

(setq package-archive-priorities
      '(("MELPA"        . 10)
        ("MELPA Stable" . 5)
        ("GNU"          . 0)))

(package-initialize)

;; Bootstrap use-package package management
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; Ensure packages are up to date
(use-package auto-package-update
  :ensure t
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

;; Add includes to the load path
(add-to-list 'load-path "~/.emacs.d/includes/")

;; Put customizations in a .gitignore'd file
(write-region "" nil "~/.emacs.d/customizations.el" t)
(setq custom-file "~/.emacs.d/customizations.el")
(load custom-file)

;; Put autosaves in a different directory, turn off backups
(setq auto-save-file-name-transforms`((".*" ,"~/.emacs.d/saves/" t)))
(setq auto-save-list-file-name nil)
(setq auto-save-list-file-prefix nil)
(setq make-backup-files nil)

;; Disable the menu bar at all times
(menu-bar-mode -1)

;; Install the zenburn-theme (make sure the tty matches these colors)
(use-package zenburn-theme
  :ensure t
  :init (load-theme 'zenburn t))

;; Flycheck install

(use-package flycheck-color-mode-line
  :ensure t
  :commands (flycheck-color-mode-line-mode))

(use-package flycheck
  :ensure t
  :commands global-flycheck-mode
  :init
  (global-flycheck-mode)
  (setq flycheck-highlighting-mode 'lines)
  (setq flycheck-emacs-lisp-load-path 'inherit)
  :config
  (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

;; fzf install
(require 'vc-git)

(defun fzf-keybind-hook ()
  (interactive)
  (if (vc-git-root (or buffer-file-name default-directory))
      (fzf-git)
    (fzf)))

(use-package fzf
  :ensure t
  :bind ("C-x f" . fzf-keybind-hook)
  :config
  (setq-default fzf/executable (expand-file-name "~/.emacs.d/fzf/bin/fzf"))
  (when (executable-find "ag")
    (let ((ag-command "ag --hidden --ignore .git -l -g \"\""))
      (setenv "FZF_DEFAULT_COMMAND" ag-command))))

;; General editor settings

(setq-default indent-tabs-mode nil)
(setq-default show-trailing-whitespace t)
(setq-default column-number-mode t)
(setq-default require-final-newline t)
(setq-default tab-width 4)

;; Require all files in the autoload directory
(require 'require-directory)
(require-directory "~/.emacs.d/autoload/")

;;; init.el ends here
