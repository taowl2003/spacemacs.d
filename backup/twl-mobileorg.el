(provide 'twl-mobileorg)

;; 电脑把org文件同步到该文件夹中
(setq org-mobile-directory "d:/sync/Dropbox/App/mobileorg")
;; 电脑要同步哪些org文件
(setq org-mobile-files (list "~/org/researchProj.org"
			     "~/org/riverProj.org"
			     "~/org/othersProj.org"
			     "~/org/bibliography.org"
			     "~/org/knowledge.org"
			     "~/org/faculty.org"
			     "~/org/family.org"
			     "~/org/journal.org"
			     "~/org/inbox.org"
			     "~/org/articals.org"
			     ))
;; 上面文件的绝对文件夹
(setq org-directory "d:/Sync/CloudStation/App/Emacs")
;; 手机端动作记录在这个文件
(setq org-mobile-inbox-for-pull "d:/sync/Dropbox/App/mobileorg/mobileRevise.org")
;; 可用的签名文件
(defcustom org-mobile-checksum-binary (or (executable-find "~/bin/md5sums.exe"))
 "Executable used for computing checksums of agenda files."
 :group 'org-mobile
 :type 'string)
;;  关闭emacs时将变化同步到org-mobile-目录中
(add-hook 'kill-emacs-hook
                     (lambda ()
                       (org-mobile-push)))
;; 打开emacs时将手机上的变化同步过来
(add-hook 'emacs-startup-hook
	  (lambda ()
		 (org-mobile-pull)))
