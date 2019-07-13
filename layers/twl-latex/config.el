
;; AucTex, helm-bibtex, ebib,  cdlatex, exportToLatex
(setenv "PATH" (concat (getenv "PATH") ";c:/texlive/2018/bin/win32/;c:/Program Files (x86)/Graphviz 2.28/bin/"))
(setq Org-Latex-Create-Formula-Image-Program 'imagemagick)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq org-latex-create-formula-image-program 'imagemagick)
(setq org-latex-create-formula-image-program 'dvipng)
(setq TeX-PDF-mode t)
(setq TeX-source-correlate-mode t)
(setq TeX-source-correlate-method 'synctex)
(setq TeX-view-program-list '(("Sumatra PDF" ("d:/Sync/Drive/App/Others/SumatraPDF.exe -reuse-instance"
                      (mode-io-correlate " -forward-search %b %n ") " %o"))))
;; (setq TeX-view-program-list '(("SumatraPDF" "c:/Programs/Sumatra_PDF/SumatraPDF.exe -reuse-instance %o")))

;;(add-to-list
;; 'TeX-expand-list
;; (list "%(extraopts)"
;;       (lambda nil TeX-command-extra-options)))

(eval-after-load 'tex
  '(progn
     (assq-delete-all 'output-pdf TeX-view-program-selection)
     (add-to-list 'TeX-view-program-selection '(output-pdf "Sumatra PDF"))))

;; helm-bibtex
(autoload 'helm-bibtex "helm-bibtex" "" t)
;;(setq helm-bibtex-bibliography '("~/org/Writing/MyCollection.bib"))
(setq bibtex-completion-bibliography '("d:/Sync/Drive/orgmode/orgfiles/writing/MyCitation.bib"))

;; ebib
(global-set-key "\C-ce" 'ebib)
;; cdlatex
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)   ; with AUCTeX LaTeX mode
;; (add-hook 'latex-mode-hook 'turn-on-cdlatex)   ; with Emacs latex mode

;; exportToLatex
(setq org-latex-classes
      '(("article"
         "\\documentclass[final]{IEEEtran}

\\usepackage{geometry}
\\geometry{verbose, tmargin=30mm, bmargin=20mm, lmargin=30mm, rmargin=20mm}
% \\usepackage{lineno}
% \\linenumbers

\\usepackage{dcolumn}
\\newcolumntype{d}[1]{D{.}{.}{#1}}
\\newcommand{\\tabincell}[2]{\\begin{tabular}{@{}#1@{}}#2\\end{tabular}}
"
         ("\\section{%s}" . "\\section*{%s}")
         ("\\subsection{%s}" . "\\subsection*{%s}")
         ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
         ("\\paragraph{%s}" . "\\paragraph*{%s}")
         ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
        ))
;; [FIXME]
;; 原本是不要讓 org 插入 hypersetup（因為 org-mode 這部份設計成沒辦法自訂，或許可以去 report 一下？）
;; 改成自行插入，但這樣 pdfcreator 沒辦法根據 Emacs 版本插入，pdfkeyword 也會無效。
(setq org-latex-with-hyperref t)
;; 把預設的 fontenc 拿掉
;; 經過測試 XeLaTeX 輸出 PDF 時有 fontenc[T1]的話中文會無法顯示。
;; hyperref 也拿掉，改從 classes 處就插入，原因見上面 org-latex-with-hyperref 的說明。
(setq org-latex-default-packages-alist
      '(("" "hyperref" nil)
;;        ("UTF8" "ctex" t)
        ("" "fixltx2e" nil)
        ("" "graphicx" t)
        ("" "longtable" nil)
        ("" "float" nil)
        ("" "wrapfig" nil)
        ("" "rotating" nil)
        ("normalem" "ulem" t)
        ("" "amsmath" t)
        ("" "textcomp" t)
        ("" "marvosym" t)
        ("" "wasysym" t)
        ("" "multicol" t)  ; 這是我另外加的，因為常需要多欄位文件版面。
        ("" "amssymb" t)
	("" "threeparttable" t)
	("" "multirow" t)
	("" "booktabs" t)
        "\\tolerance=1000"))
;; Use XeLaTeX to export PDF in Org-mode
(setq org-latex-pdf-process
      '("xelatex -interaction nonstopmode -output-directory %o %f"
        "bibtex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"))

;; org-ref
(setq reftex-default-bibliography '("d:/Sync/Drive/orgmode/orgfiles/writing/MyCitation.bib"))
(setq org-ref-bibliography-notes "d:/Sync/Drive/orgmode/orgfiles/bibliography.org"
      org-ref-default-bibliography '("d:/Sync/Drive/orgmode/orgfiles/writing/MyCitation.bib")
      org-ref-pdf-directory "d:/Sync/Drive/orgmode/BibliographyLib/")
(setq bibtex-completion-bibliography "d:/Sync/Drive/orgmode/orgfiles/writing/MyCitation.bib"
      bibtex-completion-library-path "d:/Sync/Drive/BibliographyLib/"
      bibtex-completion-notes-path "d:/Sync/Drive/orgmode/orgfiles/writing/helm-bibtex-notes")

;; open pdf with system pdf viewer (works on mac)
;; (setq bibtex-completion-pdf-open-function
;;   (lambda (fpath)
;;     (start-process "open" "*open*" "open" fpath)))
;; alternative
(setq bibtex-completion-pdf-open-function 'org-open-file)

;;
;;(require 'org-attach-screenshot)
;;(setq org-attach-screenshot-dirfunction  "~\org\LinkFiles\")

