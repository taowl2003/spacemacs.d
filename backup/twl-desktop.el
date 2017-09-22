(provide 'twl-desktop)

;;(require 'session)
;;(add-hook 'after-init-hook 'session-initialize)

;;(require 'desktop+)
;;(desktop-load-default) 
;;(desktop-read)

;; /////////////// desktop pattern \\\\\\\\\\\\\\\
(desktop-save-mode 1)
;; \\\\\\\\\\\\\\\ desktop pattern ///////////////

;; ;; /////////////// desktop-frame \\\\\\\\\\\\\\\
;; (load "frame-restore")
;; (add-hook 'desktop-save-hook
;; (lambda ()
;; (desktop-frame-save "~/.emacs.d/Windows/")))
;; ;;其中 ~/ 为存放.emacs.framex文件的目录，可任意指定
;; (desktop-read)
;; (load "~/.emacs.framex")
;; ;; \\\\\\\\\\\\\\\ desktop-frame ///////////////
