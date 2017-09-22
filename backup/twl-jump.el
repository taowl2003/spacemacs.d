(provide 'twl-jump)
;; go-to-char; go-to-register; ace-window; match-paren; wconf; search word;

;; go-to-char
(defun wy-go-to-char (n char)
  "Move forward to Nth occurence of CHAR.
Typing `wy-go-to-char-key' again will move forwad to the next Nth
occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (search-forward (string char) nil nil n)
  (while (char-equal (read-char)
		     char)
    (search-forward (string char) nil nil n))
  (setq unread-command-events (list last-input-event)))
(define-key global-map (kbd "<f8> j a") 'wy-go-to-char)
;; go-to-register
(defun ska-point-to-register()
  "Store cursorposition _fast_ in a register. 
Use ska-jump-to-register to jump back to the stored 
position."
  (interactive)
  (setq zmacs-region-stays t)
  (point-to-register 8))
(defun ska-jump-to-register()
  "Switches between current cursorposition and position
that was stored with ska-point-to-register."
  (interactive)
  (setq zmacs-region-stays t)
  (let ((tmp (point-marker)))
        (jump-to-register 8)
        (set-register 8 tmp)))
(global-set-key (kbd "C-c C-.") 'ska-point-to-register)
(global-set-key (kbd "C-c C-,") 'ska-jump-to-register)
(global-set-key (kbd "<f8> r") 'point-to-register)
(global-set-key (kbd "<f8> g") 'jump-to-register)
(point-to-register 1)
;; Ace-window & jump mode
(global-set-key (kbd "M-j") 'ace-window)
;;     ace-window in latex
(add-hook 'org-mode
          (lambda ()
            (local-set-key (kbd "M-j") 'ace-window)))
;;     ace-window in latex
(add-hook 'matlab-mode-hook
          (lambda ()
            (local-set-key (kbd "M-j") 'ace-window)))
;;     ace-jump-mode C-c Spc
(add-to-list 'load-path "~/.emacs.d/elpa/ace-jump-mode-20140616.115/")
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
(define-key global-map (kbd "C-c SPC") 'ace-jump-char-mode)
;;     ace-jump-mark, C-x Spc
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "<f8> j -") 'ace-jump-mode-pop-mark)
;;     ace-jump-mode is not compatible with org mode, so
;;     When org-mode starts it (org-mode-map) overrides the ace-jump-mode.
(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key (kbd "\C-c SPC") 'ace-jump-char-mode)))
;; match paren
(global-set-key "%" 'match-paren)
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg 1)))))
;; wconf
(add-hook 'desktop-after-read-hook      ;so we have all ;;buffers again
          (lambda ()
            (wconf-load)
            (wconf-switch-to-config 0)
            (add-hook 'kill-emacs-hook
                      (lambda ()
                        (wconf-store-all)
                        (wconf-save))))
          'append)

(global-set-key (kbd "C-c w s") #'wconf-store)
(global-set-key (kbd "C-c w S") #'wconf-store-all)
(global-set-key (kbd "C-c w r") #'wconf-restore)
(global-set-key (kbd "C-c w R") #'wconf-restore-all)
(global-set-key (kbd "C-c w w") #'wconf-switch-to-config)
(global-set-key (kbd "C-<prior>") #'wconf-use-previous)
(global-set-key (kbd "C-<next>") #'wconf-use-next)
;; isearch-forward-word
(global-set-key (kbd "M-s w") 'isearch-forward-word)
;;     in matlab
;;(add-hook 'matlab-mode-hook
;;          (lambda ()
;;            (local-set-key (kbd "M-s w") 'iserach-forward-word)))

