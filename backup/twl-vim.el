(provide 'twl-vim)

(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-key
  "e" 'find-file
  "b" 'switch-to-buffer
  "mx" 'smex
  "k" 'kill-buffer)
(evil-leader/set-leader "<SPC>")

;; (setq key-chord-two-keys-delay 0.5)
;; (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
;; (key-chord-mode 1)
(eval-after-load 'org-agenda
 '(progn
    (evil-set-initial-state 'org-agenda-mode 'normal)
    (evil-define-key 'normal org-agenda-mode-map
      (kbd "<RET>") 'org-agenda-switch-to
      (kbd "\t") 'org-agenda-goto

      "q" 'org-agenda-quit
       "r" 'org-agenda-redo
;;       "S" 'org-save-all-org-buffers
      "gj" 'org-agenda-goto-date
;;       "gJ" 'org-agenda-clock-goto
;;       "gm" 'org-agenda-bulk-mark
;;       "go" 'org-agenda-open-link
;;       "s" 'org-agenda-schedule
;;       "+" 'org-agenda-priority-up
;;       "," 'org-agenda-priority
;;       "-" 'org-agenda-priority-down
;;       "y" 'org-agenda-todo-yesterday
;;       "n" 'org-agenda-add-note
       "t" 'org-agenda-todo
;;       ":" 'org-agenda-set-tags
;;       ";" 'org-timer-set-timer
;;       "I" 'helm-org-task-file-headings
;;       "i" 'org-agenda-clock-in-avy
;;       "O" 'org-agenda-clock-out-avy
;;       "u" 'org-agenda-bulk-unmark
;;       "x" 'org-agenda-exit
       "j"  'org-agenda-next-line
       "k"  'org-agenda-previous-line
;;       "vt" 'org-agenda-toggle-time-grid
;;       "va" 'org-agenda-archives-mode
;;       "vw" 'org-agenda-week-view
       "vl" 'org-agenda-log-mode
;;       "vd" 'org-agenda-day-view
       "vc" 'org-agenda-show-clocking-issues
       "g/" 'org-agenda-filter-by-tag
;;       "o" 'delete-other-windows
;;       "gh" 'org-agenda-holiday
       "gv" 'org-agenda-view-mode-dispatch
       "f" 'org-agenda-later
       "b" 'org-agenda-earlier
       "c" 'helm-org-capture-templates
;;       "e" 'org-agenda-set-effort
;;       "n" nil  ; evil-search-next
;;       "{" 'org-agenda-manipulate-query-add-re
;;       "}" 'org-agenda-manipulate-query-subtract-re
;;       "A" 'org-agenda-toggle-archive-tag
       "." 'org-agenda-goto-today
;;       "0" 'evil-digit-argument-or-evil-beginning-of-line
;;       "<" 'org-agenda-filter-by-category
;;       ">" 'org-agenda-date-prompt
;;       "F" 'org-agenda-follow-mode
;;       "D" 'org-agenda-deadline
;;       "H" 'org-agenda-holidays
;;       "J" 'org-agenda-next-date-line
;;       "K" 'org-agenda-previous-date-line
;;       "L" 'org-agenda-recenter
;;       "P" 'org-agenda-show-priority
       "R" 'org-agenda-clockreport-mode
;;       "Z" 'org-agenda-sunrise-sunset
;;       "T" 'org-agenda-show-tags
;;       "X" 'org-agenda-clock-cancel
;;       "[" 'org-agenda-manipulate-query-add
       "g\\" 'org-agenda-filter-by-tag-refine
       "]" 'org-agenda-manipulate-query-subtract)))
 
;; (add-to-list 'load-path "~/.emacs.d/e;; lpa/evil-org-20170802.1428")
;; (require 'evil-org
;; (add-hook 'org-mode-hook 'evil-org-mode)
;; (evil-org-set-key-theme '(navigation insert textobjects additional))

;; (use-package evil-org
;;   :ensure t
;;   :after org
;;   :config
;;   (add-hook 'org-mode-hook 'evil-org-mode)
;;   (add-hook 'evil-org-mode-hook
;;             (lambda ()
;;               (evil-org-set-key-theme))))
;; (require 'hydra)
;; 
;; (setf evil-org-key-theme '(navigation insert textobjects additional))
;; (setf org-special-ctrl-a/e t)
;; 
;; (add-hook 'org-mode-hook
;;  (lambda ()
;;    (evil-org-mode)
;; 
;;    ;; Custom mappings
;;    (evil-define-key 'normal evil-org-mode-map
;;      (kbd "-") 'org-ctrl-c-minus
;;      (kbd "|") 'org-table-goto-column
;;      (kbd "M-o") (lambda (arg)
;;                    (interactive "P")
;;                    (evil-org-eol-call #'org-insert-heading arg))
;;      (kbd "M-t") (lambda (arg)
;;                    (interactive "P")
;;                    (evil-org-eol-call #'org-insert-todo-heading arg)))
;; 
;;    ;; Configure leader key
;;    (evil-leader/set-key-for-mode 'org-mode
;;      "." 'hydra-org-state/body
;;      "t" 'org-todo
;;      "T" 'org-show-todo-tree
;;      "v" 'org-mark-element
;;      "a" 'org-agenda
;;      "c" 'org-archive-subtree
;;      "l" 'evil-org-open-links
;;      "C" 'org-resolve-clocks)
;; 
;;    ;; Define a transient state for quick navigation
;; ))
;; 
