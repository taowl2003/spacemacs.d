(provide 'twl-gnus)

(setq user-full-name "taowl") 
(setq user-mail-address "taowl2003@sina.com") 

    (setq gnus-select-method '(nntp "foo.bar.com"))
    (add-to-list 'gnus-secondary-select-methods '(nntp "localhost"))
    (add-to-list 'gnus-secondary-select-methods '(nntp "news.gnus.org"))
    (add-to-list 'gnus-secondary-select-methods '(nnml ""))
    

;;(setq gnus-select-method '(nntp "news.easynews.com"))
;; or news.cn99.com

;; news-group
;; (setq gnus-default-subscribed-newsgroups
;;  '("gnu.emacs.help"     ;; 这里不错噢，有关 emacs 使用的问题都在这里讨论
;;    "cn.comp.os.linux")) ;; 这里也有一个 emacs 小团伙，
;;                         ;; 有空去凑个热闹吧，中文的哟
 

;;;;;;;;;;;;;;;;;;;;
;;   语言环境设定
;;;;;;;;;;;;;;;;;;;;
(set-language-environment 'Chinese-GB)
(setq gnus-default-charset 'chinese-iso-8bit
      gnus-group-name-charset-group-alist '((".*" . cn-gb-2312))
      gnus-summary-show-article-charset-alist
      '((1 . cn-gb-2312)
	(2 . gb18030)
	(3 . chinese-iso-8bit)
	(4 . gbk)
	(5 . big5)
	(6 . utf-8))
      gnus-newsgroup-ignored-charsets
      '(unknown-8bit x-unknown iso-8859-1))

;;;; chinese
;;(set-language-environment 'Chinese-GB)
;;(setq gnus-default-charset 'chinese-iso-8bit
;;   gnus-group-name-charset-group-alist '((".*" . chinese-iso-8bit))
;;   gnus-summary-show-article-charset-alist
;;       '((1 . chinese-iso-8bit)
;;         (2 . gbk)
;;         (3 . big5)
;;         (4 . utf-8))
;;   gnus-newsgroup-ignored-charsets
;;   '(unknown-8bit x-unknown iso-8859-1))

;; web plain
(eval-after-load "mm-decode"
  '(progn
     (add-to-list 'mm-discouraged-alternatives "text/html")
     (add-to-list 'mm-discouraged-alternatives "text/richtext")))

;;;;;;;;;;;;;;;;;;;;
;;自动显示图片
;;;;;;;;;;;;;;;;;;;;
;;(auto-image-file-mode)
;;(setq mm-inline-large-images t)
;;(add-to-list 'mm-attachment-override-types "image/*")


(setq gnus-posting-styles
      '((".*"
	 (name "taowl")
	 (address "taowl2003@sina.com")
	 (signature "taowl\ntaowl")
	 ))
)

(setq mail-sources
      '((pop :server "pop.sina.com"   ;; 在这里设置 pop3 服务器
             :user "taowl2003"            ;; 用户名
;;             :port "pop3"
             :password "xvtx44a1"))) ;; 密码


;; smtp
(setq gnus-secondary-select-methods '((nnfolder "")))

(setq user-full-name "WeiliangTao") ;; 外发的邮件采用这个名字
(setq user-mail-address "taowl2003@sina.com") ;;外发的邮件采用这个地址
(setq smtpmail-auth-credentials
    '(("smtp.sina.com"  ;; SMTP 服务器
       25
       "taowl2003"          ;; 用户名
       "xvtx44a1")))   ;; 密码
(setq smtpmail-default-smtp-server "smtp.sina.com")
(setq smtpmail-smtp-server "smtp.sina.com")
(setq message-send-mail-function 'smtpmail-send-it)

;;(setq gnus-use-cache 'passive)

;;(setq gnus-fetch-old-headers 'some)

;;(setq gnus-message-archive-group  
;;'((if (message-news-p)  
;;"nnfolder:mail.sent.news"  
;;"nnfolder:mail.sent.mail")))

