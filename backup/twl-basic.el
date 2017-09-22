(provide 'twl-basic)
;; dir; coding system; setup; recent files; keybind; package

(setq make-backup-files nil)
;; dir
(add-to-list 'load-path "~/.emacs.d/Manual/")
;; coding system
;; Use UTF-8 for all character encoding.
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
;;(set-selection-coding-system 'utf-8)
(set-locale-environment "en.UTF-8")
(prefer-coding-system 'utf-8)
(setq utf-translate-cjk-mode nil) ; disable CJK coding/encoding
(setq-default buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; backwards compatibility as default-buffer-file-coding-system
;; is deprecated in 23.2.
(if (boundp 'buffer-file-coding-system)
    (setq-default buffer-file-coding-system 'utf-8)
;;  (setq default-buffer-file-coding-system 'utf-8))
  (setq buffer-file-coding-system 'utf-8))

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
;;(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ENCODING ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C-h C RET
;; M-x describe-current-coding-system

(add-to-list 'file-coding-system-alist '("\\.tex" . utf-8) )
(add-to-list 'file-coding-system-alist '("\\.txt" . utf-8) )
(add-to-list 'file-coding-system-alist '("\\.org" . utf-8) )
(add-to-list 'file-coding-system-alist '("\\.el" . utf-8) )
(add-to-list 'file-coding-system-alist '("\\.scratch" . utf-8) )
(add-to-list 'file-coding-system-alist '("user_prefs" . utf-8) )

(add-to-list 'process-coding-system-alist '("\\.txt" . utf-8) )

(add-to-list 'network-coding-system-alist '("\\.txt" . utf-8) )

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;;(set-selection-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8)

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
;;(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; mnemonic for utf-8 is "U", which is defined in the mule.el
(setq eol-mnemonic-dos ":CRLF")
(setq eol-mnemonic-mac ":CR")
(setq eol-mnemonic-undecided ":?")
(setq eol-mnemonic-unix ":LF")

(defalias 'read-buffer-file-coding-system 'lawlist-read-buffer-file-coding-system)
(defun lawlist-read-buffer-file-coding-system ()
  (let* ((bcss (find-coding-systems-region (point-min) (point-max)))
         (css-table
          (unless (equal bcss '(undecided))
            (append '("dos" "unix" "mac")
                    (delq nil (mapcar (lambda (cs)
                                        (if (memq (coding-system-base cs) bcss)
                                            (symbol-name cs)))
                                      coding-system-list)))))
         (combined-table
          (if css-table
              (completion-table-in-turn css-table coding-system-alist)
            coding-system-alist))
         (auto-cs
          (unless find-file-literally
            (save-excursion
              (save-restriction
                (widen)
                (goto-char (point-min))
                (funcall set-auto-coding-function
                         (or buffer-file-name "") (buffer-size))))))
         (preferred 'utf-8)
         (default 'utf-8)
         (completion-ignore-case t)
         (completion-pcm--delim-wild-regex ; Let "u8" complete to "utf-8".
          (concat completion-pcm--delim-wild-regex
                  "\\|\\([[:alpha:]]\\)[[:digit:]]"))
         (cs (completing-read
              (format "Coding system for saving file (default %s): " default)
              combined-table
              nil t nil 'coding-system-history
              (if default (symbol-name default)))))
    (unless (zerop (length cs)) (intern cs))))
;; setup
(server-start)
(setq inhibit-startup-message t)
(setq kill-ring-max 300)
(put 'narrow-to-region 'disabled nil)
;; recent files
(require 'recentf)
(recentf-mode t)
;; keyrebinder
(global-set-key (kbd "C-M-SPC") 'set-mark-command)
;;     refill format 
(global-set-key (kbd "C-S-q") 'fill-paragraph)
;;     scroll next buffer
(global-set-key (kbd "C-M-v") 'indent-new-comment-line)
(global-set-key (kbd "C-M-S-v") 'kill-sentence)
(global-set-key (kbd "M-n") 'scroll-other-window)
(global-set-key (kbd "M-p") 'scroll-other-window-down)
;; package
;;     Also use Melpa for most packages
;;     (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;;     (add-to-list 'package-archives '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))
(add-to-list 'package-archives'
  ("elpa" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives'
  ("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives'
  ("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

