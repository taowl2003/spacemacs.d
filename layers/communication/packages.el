;;; packages.el --- communication layer packages file for Spacemacs.
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
;; added to `communication-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `communication/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `communication/pre-init-PACKAGE' and/or
;;   `communication/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst communication-packages
  '(wanderlust)
  )

(defun communication/init-wanderlust()
  (use-package wanderlust
    :defer t
    :init
    (progn
      (autoload 'wl "wl" "Wanderlust" t)
      (autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
      (autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t))
    :config
    (progn
      (setq wl-message-ignored-field-list
            '(".")
            wl-message-visible-field-list
            '("^\\(To\\|Cc\\):"
              "^Subject:"
              "^\\(From\\|Reply-To\\):"
              "^\\(Posted\\|Date\\):"
              "^Organization:"
              "^X-\\(Face\\(-[0-9]+\\)?\\|Weather\\|Fortune\\|Now-Playing\\):")
            wl-message-sort-field-list
            (append wl-message-sort-field-list
                    '("^Reply-To" "^Posted" "^Date" "^Organization"))))
    ))
