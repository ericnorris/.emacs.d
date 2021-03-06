;;; php-dev.el --- additional config for php web development
;;; Commentary:
;;

;;; Code:

(use-package php-mode
  :ensure t
  :mode ("\\.php'" . php-mode)
  :custom
  (php-mode-coding-style 'psr2)
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
  (setq-default flycheck-disabled-checkers
                (append '(php-phpmd php-phpcs) flycheck-disabled-checkers)))

(provide 'php-dev)

;;; php-dev.el ends here
