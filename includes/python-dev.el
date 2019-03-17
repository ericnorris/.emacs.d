;;; python-dev.el --- additional config for python development
;;; Commentary:
;;

;;; Code:

(use-package python-mode
  :ensure t
  :mode ("\\.py'" . python-mode))

(use-package flycheck
  :ensure t
  :init)

(provide 'python-dev)

;;; python-dev.el ends here
