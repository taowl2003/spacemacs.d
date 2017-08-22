(spacemacs/declare-prefix "ag" "gtd")

;; basic setup -- 4.2
(spacemacs/set-leader-keys "agl" 'org-store-link)
(spacemacs/set-leader-keys "aga" 'org-agenda)
(spacemacs/set-leader-keys "agb" 'org-iswitchb)

;; key binding -- 4.6 V
;;     jump: often
;; (global-set-key (kbd "<f5>") 'bookmark-jump)
;; (global-set-key (kbd "<f6>") 'bookmark-set)
;; (global-set-key (kbd "C-<f9>") 'previous-buffer)
;; (global-set-key (kbd "C-<f10>") 'next-buffer)
;;     clock: often
(global-set-key (kbd "<f9> I") 'bh/punch-in);;'org-clock-out)
(global-set-key (kbd "<f9> SPC") 'bh/clock-in-select-task);;'org-clock-select-task)
(global-set-key (kbd "<f11>") 'org-clock-goto)
(global-set-key (kbd "C-<f11>") 'org-clock-in)
;;     used
(global-set-key (kbd "<f7>") 'bh/set-truncate-lines)
(global-set-key (kbd "<f9> v") 'visible-mode)
(global-set-key (kbd "C-x n r") 'narrow-to-region)
(global-set-key (kbd "M-<f9>") 'org-toggle-inline-images)
(global-set-key (kbd "<f9> c") 'calendar)
(global-set-key (kbd "<f9> h") 'bh/hide-other)
(global-set-key (kbd "<f9> n") 'bh/toggle-next-task-display)
;; capture -- 6.1
(global-set-key (kbd "C-c c") 'org-capture)
