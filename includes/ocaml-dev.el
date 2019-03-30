;;; ocaml-dev.el --- additional config for php web development
;;; Commentary:
;;

;;; Code:

(use-package flycheck
  :ensure t)

(use-package tuareg
  :ensure t
  :mode ("\\.ml'" . tuareg-mode))

(use-package merlin
  :ensure t
  :hook (tuareg-mode . merlin-mode)
  :config
  (setq-default merlin-error-after-save nil)
  (flycheck-ocaml-setup))

(provide 'ocaml-dev)

;;; ocaml-dev.el ends here
