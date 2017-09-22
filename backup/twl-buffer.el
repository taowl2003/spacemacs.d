(provide 'twl-buffer)
;; swbuff; tabbar; ibuffer; buffer-move; winner

;; swbuff
(require 'swbuff)
(global-set-key (kbd "C-<f9>") 'swbuff-switch-to-previous-buffer)
(global-set-key (kbd "C-<f10>") 'swbuff-switch-to-next-buffer)
(setq swbuff-exclude-buffer-regexps 
     '("^ " "\\*.*\\*"))
(setq swbuff-status-window-layout 'scroll)
(setq swbuff-clear-delay 3)
(setq swbuff-separator "|")
(setq swbuff-window-min-text-height 1)
;; tabbar
(require 'tabbar)
(global-set-key (kbd "C-<up>") 'tabbar-mode)
(global-set-key (kbd "C-<down>") 'tabbar-forward-group)
(global-set-key (kbd "C-<left>") 'tabbar-backward)
(global-set-key (kbd "C-<right>") 'tabbar-forward)
;; ibuffer
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
;; buffer-move
(require 'buffer-move)
(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)
;; winner mode
(winner-mode 1)
