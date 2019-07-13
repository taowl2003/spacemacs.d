
;; 电脑把org文件同步到该文件夹中
(setq org-mobile-directory "d:/Sync/public/twl/mobileorg")
;; 电脑要同步哪些org文件
(setq org-mobile-files (list "d:/Sync/Drive/orgmode/orgfiles/researchProj.org"
                             "d:/Sync/Drive/orgmode/orgfiles/riverProj.org"
                             "d:/Sync/Drive/orgmode/orgfiles/othersProj.org"
                             "d:/Sync/Drive/orgmode/orgfiles/bibliography.org"
                             "d:/Sync/Drive/orgmode/orgfiles/knowledge.org"
                             "d:/Sync/Drive/orgmode/orgfiles/faculty.org"
                             "d:/Sync/Drive/orgmode/orgfiles/family.org"
                             "d:/Sync/Drive/orgmode/orgfiles/journal.org"
                             "d:/Sync/Drive/orgmode/orgfiles/inbox.org"
                             "d:/Sync/Drive/orgmode/orgfiles/articals.org"
			     ))
;; 上面文件的绝对文件夹
(setq org-directory "d:/Sync/Drive/orgmode/orgfiles")
;; 手机端动作记录在这个文件
(setq org-mobile-inbox-for-pull "d:/Sync/public/twl/mobileorg/mobileRevise.org")
;; 可用的签名文件
(defcustom org-mobile-checksum-binary (or (executable-find "~/bin/md5sums.exe"))
 "Executable used for computing checksums of agenda files."
 :group 'org-mobile
 :type 'string)
;;  关闭emacs时将变化同步到org-mobile-目录中
;;(add-hook 'kill-emacs-hook
;;                     (lambda ()
;;                       (org-mobile-push)))
;; 打开emacs时将手机上的变化同步过来
;;(add-hook 'emacs-startup-hook
;;	  (lambda ()
;;		 (org-mobile-pull)))
