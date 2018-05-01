;;; require-directory.el --- require all files in a given directory

;;; Commentary:
;; This assumes that files in the directory provide a feature equivalent to the
;; file name, sans extension.

;;; Code:

(provide 'require-directory)

(defun require-directory (dir)
  (let (realdir files file-symbols)
    (setq realdir (expand-file-name (substitute-in-file-name dir)))
    (setq files (directory-files realdir t "\\.el$"))
    (setq file-symbols (mapcar 'intern (mapcar 'file-name-base files)))
    (cl-mapcar 'require file-symbols files)))

;;; require-directory.el ends here
