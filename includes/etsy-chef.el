;;; etsy-chef.el --- additional config for Chef development @ Etsy
;;; Commentary:
;;

;;; Code:

;; Ruby mode
(use-package ruby-mode
  :ensure t
  :mode ("\\.rb'" . ruby-mode))

(use-package flycheck
  :ensure t
  :init
  (setq flycheck-chef-foodcritic-executable
        "/opt/chef/embedded/bin/foodcritic"))

(provide 'etsy-chef)

;;; etsy-chef.el ends here
