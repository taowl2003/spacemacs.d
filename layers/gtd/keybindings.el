(spacemacs/declare-prefix "\'" "gtd")

;; basic setup -- 4.2
;; (spacemacs/set-leader-keys "\'l" 'org-store-link)
(spacemacs/set-leader-keys "\'a" 'org-agenda)
;; (spacemacs/set-leader-keys "\'b" 'org-iswitchb)

;; key binding -- 4.6 V
;;     jump: often
;; (global-set-key (kbd "<f5>") 'bookmark-jump)
(spacemacs/set-leader-keys "\'\'" 'bookmark-jump)
(global-set-key (kbd "<C-f6>") '(lambda () (interactive) (bookmark-set "SAVED")))
(global-set-key (kbd "<f6>") '(lambda () (interactive) (bookmark-jump "SAVED")))
;; (global-set-key (kbd "<f6>") 'bookmark-set)
(spacemacs/set-leader-keys "\'m" 'bookmark-set)
;; (global-set-key (kbd "C-<f9>") 'previous-buffer)
;; (global-set-key (kbd "C-<f10>") 'next-buffer)
;;     clock: often
;; (global-set-key (kbd "<f9> I") 'bh/punch-in);;'org-clock-out)
(spacemacs/set-leader-keys "\'I" 'bh/punch-in)
;; (global-set-key (kbd "<f9> SPC") 'bh/clock-in-select-task);;'org-clock-select-task)
(spacemacs/set-leader-keys "\' SPC" 'bh/clock-in-select-task)
;; (global-set-key (kbd "<f11>") 'org-clock-goto)
(spacemacs/set-leader-keys "\'g" 'org-clock-goto)
;; (global-set-key (kbd "C-<f11>") 'org-clock-in)
(spacemacs/set-leader-keys "\'i" 'org-clock-in)
;;     used
(global-set-key (kbd "<f7>") 'bh/set-truncate-lines)
(global-set-key (kbd "<f9> v") 'visible-mode)
(global-set-key (kbd "C-x n r") 'narrow-to-region)
(global-set-key (kbd "M-<f9>") 'org-toggle-inline-images)
(global-set-key (kbd "<f9> c") 'calendar)
(global-set-key (kbd "<f9> h") 'bh/hide-other)
(global-set-key (kbd "<f9> n") 'bh/toggle-next-task-display)
(global-set-key (kbd "<f9> <f9>") 'bh/show-org-agenda)
;; capture -- 6.1
;; (global-set-key (kbd "C-c c") 'org-capture)
(spacemacs/set-leader-keys "\'c" 'org-capture)

;; 18.2.1
(global-set-key (kbd "<f5>") 'bh/org-todo)
(global-set-key (kbd "<S-f5>") 'bh/widen)
;; 18.18
(spacemacs/set-leader-keys "\'F" 'bh/restrict-to-file-or-follow)
(spacemacs/set-leader-keys "\'N" 'bh/narrow-to-subtree)
(spacemacs/set-leader-keys "\'P" 'bh/narrow-to-project)
(spacemacs/set-leader-keys "\'T" 'bh/org-todo)
(spacemacs/set-leader-keys "\'U" 'bh/narrow-up-one-level)
(spacemacs/set-leader-keys "\'W" 'bh/widen)
