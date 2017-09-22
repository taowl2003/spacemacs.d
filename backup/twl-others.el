(provide 'twl-others)
;; //evil; magit

;;;; evil
;;(require 'evil)
;;(define-key evil-emacs-state-map (kbd "C-o") 'evil-execute-in-normal-state)
;;(evil-mode 1)
;;(setq evil-default-state 'emacs) 
;; magit
(add-to-list 'exec-path "c:/Program Files/Git/bin/")
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)
