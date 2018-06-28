;;; etsy-chef.el --- additional config for Chef development @ Etsy
;;; Commentary:
;;

;;; Code:

;; Ruby mode
(use-package ruby-mode
  :ensure t
  :mode ("\\.rb\\'" . ruby-mode))

;; ERB templates
(use-package web-mode
  :ensure t
  :mode ("\\.erb\\'" . web-mode))

;; Chef-specific flycheck config

(use-package flycheck
  :ensure t
  :init
  (setq-default flycheck-chef-foodcritic-executable
                "/opt/chef/embedded/bin/foodcritic")
  (setq-default flycheck-ruby-rubocop-executable
                "/opt/chef/embedded/bin/cookstyle"))

(provide 'etsy-chef)

;;; etsy-chef.el ends here
