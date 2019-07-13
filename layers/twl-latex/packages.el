;;; packages.el --- twl-latex layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author:  <taowl@taowl-surface>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `twl-latex-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `twl-latex/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `twl-latex/pre-init-PACKAGE' and/or
;;   `twl-latex/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defun twl-latex/init-org-ref()
  (use-package org-ref)
)

(defun twl-latex/init-org-ref-url-utils()
  (use-package org-ref-url-utils))

(defun twl-latex/init-babel()
  (use-package babel)
)

(defun twl-latex/post-init-babel()
   (setq org-confirm-babel-evaluate nil) ;;在用C-c C-c执行代码块时,不再提示“Do you want to execute”
   (setq org-src-fontify-natively t) ;; Org-mode 文本内语法高亮
   (setq org-plantuml-jar-path (expand-file-name "d:/Sync/Drive/App/Others/plantuml.jar"))
   (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (latex . t)
     (python . t)
     (emacs-lisp . t)
     (C . t)
     (calc . t)
     (octave . t)
     (plantuml . t)
     (dot . t)
     ))
)

(defconst twl-latex-packages
  '(
    org-ref
    babel
    )
  "The list of Lisp packages required by the twl-latex layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")


;;; packages.el ends here
