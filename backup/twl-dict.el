(provide 'twl-dict)
;; youdao; langtool

;; youdao
;;     Enable Cache
(setq url-automatic-caching t)
;;     Example Key binding
(global-set-key (kbd "C-c d") 'youdao-dictionary-search-at-point+)
(global-set-key (kbd "C-c m") 'youdao-dictionary-search-from-input)
;;     Integrate with popwin-el (https://github.com/m2ym/popwin-el)
;;     (push "*Youdao Dictionary*" popwin:special-display-config)
;;     Set file path for saving search history
;;     (setq youdao-dictionary-search-history-file "~/.emacs.d/.youdao")
;;     Enable Chinese word segmentation support (支持中文分词)
;;     (setq youdao-dictionary-use-chinese-word-segmentation t)
;; langtool
(require 'langtool)
(setq langtool-language-tool-jar "~/.emacs.d/Manual/langtool/languagetool-commandline.jar"
      langtool-mother-tongue "nl"
      langtool-disabled-rules '("WHITESPACE_RULE"
                                "EN_UNPAIRED_BRACKETS"
                                "COMMA_PARENTHESIS_WHITESPACE"
                                "EN_QUOTES"))

;; eww dictionary
;;(defun bing-dict ()
;; "Search current word in bing dictionary."
;; (interactive)
;; (save-restriction
;; (let (start end)
;; (skip-chars-backward "A-Za-z0–9") (setq start (point))
;; (skip-chars-forward "A-Za-z0–9") (setq end (point))
;; (setq current-word (buffer-substring start end))
;; (eww (concat "http://cn.bing.com/dict/search?q=" current-word))
;; (if (not (string= (buffer-name) "*eww*"))
;; (switch-to-buffer-other-window "*eww*"))
;; (hl-line-mode "*eww*")
;; ;wait for 2 second, because the buffer will refresh soon and it go back to top line.
;; (sit-for 2)
;; (search-forward current-word nil t 2)
;; ;mark the word for 1 second 
;; (end-of-line)
;; (set-mark (line-beginning-position))
;; (sit-for 1)
;; (deactivate-mark)
;; ))
;;)
;;
;;(global-set-key (kbd "C-c q") 'bing-dict)

;; /////////////// ispell & flyspell \\\\\\\\\\\\\\\
   ;; Completion words longer than 4 characters
   

;;   (eval-after-load "auto-complete"
;;     '(progn
;;         (ac-ispell-setup)))

;;   (add-hook 'git-commit-mode-hook 'ac-ispell-ac-setup)
;;   (add-hook 'mail-mode-hook 'ac-ispell-ac-setup)

;;(setenv "PATH" "C:/Program Files/Aspell/bin/")
;;(add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/")
;;(setq ispell-program-name "aspell")
;;(setq ispell-personal-dictionary "c:/Program Files (x86)/Aspell/dict/ispell-personal-dictionary")
;;(require 'ispell)
;;(global-set-key (kbd "<f8>") 'ispell-word)
;;(global-set-key (kbd "C-<f8>") 'flyspell-mode)

;; grammar check
;;(require 'package)
;;(require 'grammar)
;;(load 'auto-complete-autoloads)
;;(load 'flyspell-lazy-autoloads)
;;(load 'popup-autoloads)

;;(load 'ac-ispell-autoloads)
;; Completion words longer than 4 characters


;;(add-hook 'git-commit-mode-hook 'ac-ispell-ac-setup)
;;(add-hook 'mail-mode-hook 'ac-ispell-ac-setup)

;;(setq ispell-program-name "~/.emacs.d/elpa/ac-ispell-0.7/ac-ispell.el")

;; auto-complete
;;   (eval-after-load "auto-complete"
;;     '(progn
;;	(ac-ispell-setup)))

;; flyspell-lazy
;;    (require 'flyspell-lazy)
;;    (flyspell-lazy-mode 1)
;; \\\\\\\\\\\\\\\ ispell & flyspell ///////////////

;;;; /////////////// sydict \\\\\\\\\\\\\\\
;; (add-to-list 'exec-path "~/plugin/stardict/")
;; (add-to-list 'load-path "~/plugin/stardict/")
;; ;;(load "stardict")
;; ;;(require 'stardict)
;; (load "sydict")
;; ;;(require 'sydict)
;; (setq sydict-dict-path "~/plugin/stardict/oxford-gb.dict")
;; ;(stardict-lookup dict-langdao "hello")
;;;; \\\\\\\\\\\\\\\ sydict ///////////////

