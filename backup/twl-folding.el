(provide 'twl-folding)

(org-babel-do-load-languages
 'org-babel-load-languages '((C . t)))

(autoload 'folding-mode "folding"
"Minor mode that simulates a folding editor" t)
(load-library "folding")
(defun folding-mode-find-file-hook ()
"One of the hooks called whenever a `find-file' is successful."
(and (assq 'folded-file (buffer-local-variables))
folded-file
(folding-mode 1)
(kill-local-variable 'folded-file)))
(setq fold-fold-on-startup t)
(folding-mode-add-find-file-hook)

;;修改folding.el默认的快捷键，以方便自己使用
;;我大部分的快捷键在最后一帖中将会讲到
(setq fold-keys-already-setup nil)
(add-hook 'folding-mode-hook
(function (lambda()
(unless fold-keys-already-setup
(setq fold-keys-already-setup t)
(define-prefix-command 'folding-mode-prefix)
(define-key 'folding-mode-prefix "n" 'folding-fold-region)
(define-key 'folding-mode-prefix "x" 'folding-toggle-enter-exit)
(define-key 'folding-mode-prefix "w" 'folding-whole-buffer)
(define-key 'folding-mode-prefix "o" 'folding-open-buffer)
(define-key 'folding-mode-prefix "q" 'folding-toggle-show-hide)
(define-key 'folding-mode-prefix "b" 'folding-previous-visible-heading)
(define-key 'folding-mode-prefix "f" 'folding-next-visible-heading)
)
(local-set-key (kbd "<f8> f") 'folding-mode-prefix))))

;;(autoload 'folding-mode          "folding" "Folding mode" t)
;;(autoload 'turn-off-folding-mode "folding" "Folding mode" t)
;;(autoload 'turn-on-folding-mode  "folding" "Folding mode" t)
;;(require 'folding)
;;(declare (special folding-folding-on-startup
;;		  ))
    
;; (setq folding-folding-on-startup t)
;; (folding-mode-add-find-file-hook)

;;{{{ Set some useful default fold marks

(folding-add-to-marks-list 'ada-mode               "-- {{{" "-- }}}" nil t)
(folding-add-to-marks-list 'asm-mode               "; {{{"  "; }}}" nil t)
(folding-add-to-marks-list 'awk-mode               "# {{{"  "# }}}" nil t)
(folding-add-to-marks-list 'Bison-mode             "/* {{{" "/* }}} */" " */" t)
(folding-add-to-marks-list 'LaTeX-mode             "%{{{"   "%}}}" nil t)
(folding-add-to-marks-list 'TeX-mode               "%{{{"   "%}}}" nil t)
(folding-add-to-marks-list 'bibtex-mode            "%{{{"   "%}}} */" nil t)
(folding-add-to-marks-list 'bison-mode             "/* {{{" "/* }}} */" " */" t)
(folding-add-to-marks-list 'c++-mode               "// {{{" "// }}}" nil t)
(folding-add-to-marks-list 'c-mode                 "/* {{{" "/* }}} */" " */" t)
(folding-add-to-marks-list 'dcl-mode               "! {{{"  "! }}}" nil t)
(folding-add-to-marks-list 'change-log-mode        "{{{"    "}}}" nil t)
(folding-add-to-marks-list 'cperl-mode             "# {{{"  "# }}}" nil t)
(folding-add-to-marks-list 'emacs-lisp-mode        ";;{{{"  ";;}}}" nil t)
(folding-add-to-marks-list 'erlang-mode            "%%{{{"  "%%}}}" nil t)
(folding-add-to-marks-list 'finder-mode            "{{{"    "}}}" nil t)
(folding-add-to-marks-list 'fortran-mode           "! {{{"  "! }}}" nil t)
(folding-add-to-marks-list 'f90-mode               "! {{{"  "! }}}" nil t)
(folding-add-to-marks-list 'generic-mode           ";# "    ";\$" nil t)
(folding-add-to-marks-list 'gofer-mode             "-- {{{" "-- }}}" nil t)
(folding-add-to-marks-list 'html-mode   "<!-- {{{ " "<!-- }}} -->" " -->" t)
(folding-add-to-marks-list 'icon-mode              "# {{{" "# }}}" nil t)
(folding-add-to-marks-list 'indented-text-mode     "{{{"    "}}}" nil t)
(folding-add-to-marks-list 'java-mode              "// {{{" "// }}}" nil t)
(folding-add-to-marks-list 'javascript-mode        "// {{{" "// }}}" nil t)
(folding-add-to-marks-list 'jde-mode               "// {{{" "// }}}" nil t)
(folding-add-to-marks-list 'ksh-mode               "# {{{"  "# }}}" nil t)
(folding-add-to-marks-list 'latex-mode             "%{{{"   "%}}}" nil t)
(folding-add-to-marks-list 'lisp-interaction-mode  ";;{{{"  ";;}}}" nil t)
(folding-add-to-marks-list 'lisp-mode              ";;{{{"  ";;}}}" nil t)
(folding-add-to-marks-list 'm4-mode                "# {{{" "# }}}" nil t)
(folding-add-to-marks-list 'makefile-mode          "# {{{"  "# }}}" nil t)
(folding-add-to-marks-list 'matlab-mode            "%%%{{{" "%%%}}}" nil t)
(folding-add-to-marks-list 'meta-mode              "% {{{" "% }}}" nil t)
(folding-add-to-marks-list 'ml-mode                "(* {{{" "(* }}} *)" " *)" t)
(folding-add-to-marks-list 'modula-2-mode          "(* {{{" "(* }}} *)" " *)" t)
(folding-add-to-marks-list 'nroff-mode             "\\\\ {{{" "\\\\ }}}" nil t)
(folding-add-to-marks-list 'occam-mode             "-- {{{" "-- }}}" nil t)
(folding-add-to-marks-list 'orwell-mode            "{{{"    "}}}" nil t)
(folding-add-to-marks-list 'pascal-mode            "{ ((( " "{ ))) }" " }" t)
(folding-add-to-marks-list 'php-mode               "// {{{" "// }}}" nil t)
(folding-add-to-marks-list 'perl-mode              "# {{{"  "# }}}" nil t)
(folding-add-to-marks-list 'plain-TeX-mode         "%{{{"   "%}}}" nil t)
(folding-add-to-marks-list 'plain-tex-mode         "%{{{"   "%}}}" nil t)
(folding-add-to-marks-list 'prolog-mode            "% {{{"   "% }}}" nil t)
(folding-add-to-marks-list 'python-mode            "# {{{"  "# }}}" nil t)
(folding-add-to-marks-list 'rexx-mode              "/* {{{" "/* }}} */" " */" t)
(folding-add-to-marks-list 'sh-mode                "# {{{"  "# }}}" nil t)
(folding-add-to-marks-list 'sh-script-mode         "# {{{"  "# }}}" nil t)
(folding-add-to-marks-list 'shellscript-mode       "# {{{"  "# }}}" nil t)
(folding-add-to-marks-list 'sgml-mode   "<!-- [[[ " "<!-- ]]] -->" " -->" t)
(folding-add-to-marks-list 'simula-mode            "! {{{"  "! }}}" nil t)
(folding-add-to-marks-list 'sml-mode               "(* {{{" "(* }}} *)" " *)" t)
(folding-add-to-marks-list 'sql-mode               "-- {{{"  "-- }}}" nil t)
(folding-add-to-marks-list 'tcl-mode               "#{{{"   "#}}}" nil t)
(folding-add-to-marks-list 'tex-mode               "%{{{"   "%}}}" nil t)
(folding-add-to-marks-list 'texinfo-mode   "@c {{{" "@c {{{endfold}}}" " }}}" t)
(folding-add-to-marks-list 'text-mode              "{{{"    "}}}" nil t)
(folding-add-to-marks-list 'vhdl-mode              "# {{{"  "# }}}" nil t)
(folding-add-to-marks-list 'xerl-mode              "%%{{{"  "%%}}}" nil t)
(folding-add-to-marks-list 'xrdb-mode              "! {{{"  "! }}}" nil t)

;; heavy shell-perl-awk programmer in fundamental-mode need # prefix...

(folding-add-to-marks-list 'fundamental-mode       "# {{{" "# }}}" nil t)

;;}}}
