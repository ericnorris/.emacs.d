;;; web-dev.el --- additional config for web development
;;; Commentary:
;;

;;; Code:

(use-package php-mode
  :ensure t
  :mode ("\\.php'" . php-mode)
  :config
  (subword-mode 1)
  (c-set-offset 'case-label '+))

(use-package js2-mode
  :ensure t
  :mode ("\\.js'" . js2-mode)
  :config
  (subword-mode))

(use-package flycheck
  :ensure t
  :init
  (setq flycheck-disabled-checkers '(php-phpmd php-phpcs)))

(provide 'web-dev)

;;; web-dev.el ends here
