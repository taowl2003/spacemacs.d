(setq org-clock-continuously t)  ;; 连续时钟
(setq org-clock-mode-line-total 'current)  ;; 显示当前时长
;; tags
(setq org-tag-persistent-alist '(("errands" . ?e) ("work" . nil)
		      (:startgroup . nil) ("family" . nil)
                      ("engineering" . nil) ("faculty" . nil)
		      ("research" . nil) ("knowledge" . nil)
                      (:endgroup . nil)
		      ("ARRANGED" . ?a) ("HOLD" . nil)
                      ("@read" . ?r) ("@references" . nil)
                      ("@computer" . ?c) ("@out" . ?o)
		      ("@phone" . ?p) ("@mail" . ?x)
		      ("@writing" . nil)
		      (:startgroup . nil)
                      ("#day" . ?d) ("#week" . ?w)
		      ("#month" . ?m) ("#year" . ?y)
		      (:endgroup . nil)
		      ("FLAGGED" . ??)
                      ))
;; agenda files -- 4.4 V
(setq org-agenda-files (list "d:/Sync/CloudStation/App/Emacs/org/researchProj.org"
			     "d:/Sync/CloudStation/App/Emacs/org/riverProj.org"
			     "d:/Sync/CloudStation/App/Emacs/org/othersProj.org"
			     "d:/Sync/CloudStation/App/Emacs/org/bibliography.org"
			     "d:/Sync/CloudStation/App/Emacs/org/knowledge.org"
			     "d:/Sync/CloudStation/App/Emacs/org/faculty.org"
			     "d:/Sync/CloudStation/App/Emacs/org/family.org"
			     "d:/Sync/CloudStation/App/Emacs/org/journal.org"
			     "d:/Sync/CloudStation/App/Emacs/org/inbox.org"
			     "d:/Sync/CloudStation/App/Emacs/org/articals.org"
			     ))
; (setq org-agenda-files (list "~/org/researchProj.org"
;                              "~/org/riverProj.org"
;                              "~/org/othersProj.org"
;                              "~/org/bibliography.org"
;                              "~/org/knowledge.org"
;                              "~/org/faculty.org"
;                              "~/org/family.org"
;                              "~/org/journal.org"
;                              "~/org/inbox.org"
;                              "~/org/articals.org"
;                              ))

;; task status, surface -- 5.1 V
(setq org-todo-keywords
     (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
        (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "INTERRUPT"))))
(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
	      ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
	      ("CANCELLED" :foreground "forest green" :weight bold)
	      ("INTERRUPT" :foreground "forest green" :weight bold))))
;; (setq org-todo-keywords
;;      (quote ((sequence "TODO(t)" "NEXT(n)" "ARRANGED(a)" "|" "DONE(d)")
;;	      (sequence "HOLD(h@/!)" "|" "MEETING" "INTERRUPT"))))
;;(setq org-todo-keyword-faces
;;      (quote (("TODO" :foreground "red" :weight bold)
;;              ("ARRANGED" :foreground "orange" :weight bold)
;;              ("NEXT" :foreground "blue" :weight bold)
;;              ("HOLD" :foreground "magenta" :weight bold)
;;	      ("MEETING" :foreground "forest green" :weight bold)
;;	      ("INTERRUPT" :foreground "forest green" :weight bold)
;;              ("DONE" :foreground "forest green" :weight bold))))

;; task status switch and trgger -- 5.2 V, 5.3V
(setq org-use-fast-todo-selection t)
(setq org-treat-S-cursor-todo-selection-as-state-change nil)
(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING") ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("CANCELLED") ("HOLD") ("WAITING"))
              ("NEXT" ("CANCELLED") ("HOLD") ("WAITING"))
              ("DONE" ("CANCELLED") ("HOLD") ("WAITING")))))
;;(setq org-todo-state-tags-triggers
;;      (quote (("ARRANGED" ("NEXT") ("HOLD") ("ARRANGED" . t))
;;              ("TODO" ("NEXT") ("ARRANGED"))
;;              ("NEXT" ("ARRANGED") ("NEXT" . t))
;;              ("HOLD" ("ARRANGED") ("HOLD" . t))
;;              (done ("ARRANGED") ("NEXT") ("HOLD"))
;;              ("DONE" ("ARRANGED") ("NEXT") ("HOLD")))))
;; capture tasks -- 6.1
(setq org-capture-templates
      (quote (("t" "Todo" entry (file+headline "d:/Sync/CloudStation/App/Emacs/org/inbox.org" "<Inbox>")
               "* TODO %?\n %i\n" :clock-in t :clock-resume t)
;;	      ("d" "Dictionary" entry (file+headline "~/org/inbox.org" "<Inbox>")
;;	       "* TODO Dictionary: %?\n" :clock-in t :clock-resume t)
	      ("n" "Note" entry (file+headline "d:/Sync/CloudStation/App/Emacs/org/inbox.org" "<Inbox>")
               "* %? :reference:\n" :clock-in t :clock-resume t)
;;	      ("l" "Log of time" entry (file+headline "~/org/inbox.org" "<Inbox>")
;;               "* %U: %?\n" :clock-in t :clock-resume t)
;;              ("m" "Meeting" entry (file+headline "~/org/Errands.org" "<Inbox>")
;;	       "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
              ("i" "Interrupt" entry (file+headline "d:/Sync/CloudStation/App/Emacs/org/inbox.org" "<Inbox>")
	       "* INTERRUPT by %? :INTERRUPT:\n%U" :clock-in t :clock-resume t)
	      ("h" "Habit" entry (file+headline "d:/Sync/CloudStation/App/Emacs/org/inbox.org" "<Inbox>")
               "* TODO %?\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: TODO\n:END:\n")
	      ("j" "Journal" entry (file+datetree "d:/Sync/CloudStation/App/Emacs/org/journal.org")
               "* %?\n%U\n" :clock-in t :clock-resume t)
	      ("r" "week review" entry (file+datetree "d:/Sync/CloudStation/App/Emacs/org/journal.org")
               "* %(format-time-string \"%Y-%W\")(-7)-Review %? :#diary:#week:\n%U\n- 时间开销\n  - 研究: \n  - 阅读: \n  - 工程: \n  - 院系: \n  - 组织: \n- 上周计划\n  \n- 主要完成任务\n  \n- 回顾\n\n- 总结\n\n" :clock-in t :clock-resume t)
	      ("p" "week plan" entry (file+datetree "d:/Sync/CloudStation/App/Emacs/org/journal.org")
               "* %(format-time-string \"%Y-%W\")(-7)-Plan%? :#plan:#week:\n%U\n- [ ] \n" :clock-in t :clock-resume t)
	      )))
;;     Remove empty LOGBOOK drawers on clock out
(defun bh/remove-empty-drawer-on-clock-out ()
  (interactive)
  (save-excursion
    (beginning-of-line 0)
    (org-remove-empty-drawer-at (point))))
    ;; (org-remove-empty-drawer-at "LOGBOOK" (point))))
(add-hook 'org-clock-out-hook 'bh/remove-empty-drawer-on-clock-out 'append)
;; refile -- 7.1
;;     Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))
;;     Use full outline paths for refile targets - we file directly with IDO
(setq org-refile-use-outline-path t)
;;     Targets complete directly with IDO
(setq org-outline-path-complete-in-steps nil)
;;     Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))
;;     Use IDO for both buffer and file completion and ido-everywhere to t
(setq org-completion-use-ido t)
(setq ido-everywhere t)
(setq ido-max-directory-size 100000)
(ido-mode (quote both))
;;     Use the current window when visiting files and buffers with ido
(setq ido-default-file-method 'selected-window)
(setq ido-default-buffer-method 'selected-window)
;;     Use the current window for indirect buffer display
(setq org-indirect-buffer-display 'current-window)
;;     Refile settings -- Exclude DONE state tasks from refile targets
(defun bh/verify-refile-target ()
  "Exclude todo keywords with a done state from refile targets"
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))
(setq org-refile-target-verify-function 'bh/verify-refile-target)
;; 8.1
;; Do not dim blocked tasks
(setq org-agenda-dim-blocked-tasks nil)

;; Compact the block agenda view
(setq org-agenda-compact-blocks t)

(setq org-agenda-auto-exclude-function 'bh/org-auto-exclude-function)
;; Custom agenda command definitions
(setq org-agenda-custom-commands
      (quote (("N" "Notes" tags "NOTE"
               ((org-agenda-overriding-header "Notes")
                (org-tags-match-list-sublevels t)))
              ("h" "Habits" tags-todo "STYLE=\"habit\""
               ((org-agenda-overriding-header "Habits")
                (org-agenda-sorting-strategy
                 '(todo-state-down effort-up category-keep))))
              (" " "Agenda"
               ((agenda "" nil)
                (tags "INBOX"
                      ((org-agenda-overriding-header "-- 待入库任务")
                       (org-tags-match-list-sublevels t)))
                (tags-todo "-CANCELLED/!NEXT"
                           ((org-agenda-overriding-header (concat "-- 当前项目任务汇总"
                                                                  (if bh/hide-scheduled-and-waiting-next-tasks
                                                                      ""
                                                                    " (including ARRANGED and SCHEDULED tasks)")))
                            (org-agenda-skip-function 'bh/skip-projects-and-habits-and-single-tasks)
;;                            (org-tags-match-list-sublevels t)
                            (org-tags-match-list-sublevels 'indented)
                            (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-sorting-strategy
                             '(todo-state-down effort-up category-keep))))
;;                (tags-todo "-CANCELLED/!NEXT"
;;                           ((org-agenda-overriding-header (concat "-- 当前(项目或独立)任务汇总"
;;                                                                  (if bh/hide-scheduled-and-waiting-next-tasks
;;                                                                      ""
;;                                                                    " (including ARRANGED and SCHEDULED tasks)")))
;;                          ;;(org-agenda-skip-function 'bh/skip-non-tasks)
;;                            (org-tags-match-list-sublevels t)
;;                            (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
;;                            (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)))
                (tags-todo "-HOLD-CANCELLED/!"
                           ((org-agenda-overriding-header "-- 手头项目")
                            (org-agenda-skip-function 'bh/skip-non-projects)
                            (org-tags-match-list-sublevels 'indented)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-INBOX-CANCELLED-ARRANGED-HOLD/!"
                           ((org-agenda-overriding-header (concat "-- 独立任务汇总"
                                                                  (if bh/hide-scheduled-and-waiting-next-tasks
                                                                      ""
                                                                    " (including ARRANGED and SCHEDULED tasks)")))
                            (org-agenda-skip-function 'bh/skip-project-tasks)
                            (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-HOLD/!"
                           ((org-agenda-overriding-header "-- 待办项目")
                            (org-agenda-skip-function 'bh/skip-non-stuck-projects)
                            (org-tags-match-list-sublevels 'indented)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-INBOX-CANCELLED-ARRANGED-HOLD/!"
                           ((org-agenda-overriding-header (concat "-- 项目待办任务(或项目)汇总"
                                                                  (if bh/hide-scheduled-and-waiting-next-tasks
                                                                    ""
                                                                    " (including ARRANGED and SCHEDULED tasks)")))
                            (org-agenda-skip-function 'bh/skip-non-project-tasks)
                            (org-tags-match-list-sublevels 'indented)
                            (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
;;		(tags "HOLD"
;;		      ((org-agenda-overriding-header "-- 挂起的任务")))
                (tags-todo "-CANCELLED+ARRANGED|HOLD/!"
                           ((org-agenda-overriding-header (concat "-- 等待任务(未验证)"
                                                                  (if bh/hide-scheduled-and-waiting-next-tasks
                                                                      ""
                                                                    " (including ARRANGED and SCHEDULED tasks)")))
                            (org-agenda-skip-function 'bh/skip-non-tasks)
                            (org-tags-match-list-sublevels nil)
                            (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)))
;;                (tags-todo "-CANCELLED+ARRANGED|HOLD/!"
;;                           ((org-agenda-overriding-header (concat "-- 等待任务(未验证)"
;;                                                                  (if bh/hide-scheduled-and-waiting-next-tasks
;;                                                                      ""
;;                                                                    " (including ARRANGED and SCHEDULED tasks)")))
;;                            (org-agenda-skip-function 'bh/skip-non-tasks)
;;                            (org-tags-match-list-sublevels nil)
;;                            (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
;;                            (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)))
                (tags "-INBOX/"
                      ((org-agenda-overriding-header "-- 待存档任务")
                       (org-agenda-skip-function 'bh/skip-non-archivable-tasks)
                       (org-tags-match-list-sublevels nil))))
               nil))))
;; 9.1
;;
;; Resume clocking task when emacs is restarted
;;
;; Show lot of clocking history so it's easy to pick items off the C-F11 list
(setq org-clock-history-length 23)
;; Resume clocking task on clock-in if the clock is open
(setq org-clock-in-resume t)
;; Change tasks to NEXT when clocking in
(setq org-clock-in-switch-to-state 'bh/clock-in-to-next)
;; Separate drawers for clocking and logs
(setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))
;; Save clock data and state changes and notes in the LOGBOOK drawer
(setq org-clock-into-drawer t)
(setq org-log-into-drawer t)
;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)
;; Do not prompt to resume an active clock
(setq org-clock-persist-query-resume nil)
;; Enable auto clock resolution for finding open clocks
(setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
;; Include current clocking task in clock reports
(setq org-clock-report-include-clocking-task t)
(add-hook 'org-clock-out-hook 'bh/clock-out-maybe 'append)
;; 10.2 column
; Set default column view headings: Task Effort Clock_Summary
(setq org-columns-default-format "%80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM")

; global Effort estimate values
; global STYLE property values for completion
(setq org-global-properties (quote (("Effort_ALL" . "0:15 0:30 0:45 1:00 2:00 3:00 4:00 5:00 6:00 0:00")
                                    ("STYLE_ALL" . "habit"))))
;; 10.3 report
;; Agenda log mode items to display (closed and state changes by default)
(setq org-agenda-log-mode-items (quote (closed state)))

(setq org-agenda-clockreport-parameter-plist
      (quote (:link t :maxlevel 3 :fileskip0 t :compact nil :narrow 80 )))
;; 14.1
(setq org-agenda-span 'day)
;; 14.2
(setq org-stuck-projects (quote ("" nil nil "")))

(defvar bh/hide-scheduled-and-waiting-next-tasks t)

;; 18.28
(setq org-list-demote-modify-bullet (quote (("-" . "+")
					    ("+" . "*")
                                            ("*" . "-")
                                            ("1." . "1)")
                                            ("1)" . "-")
                                            ("A." . "A)")
                                            ("A)" . "a.")
                                            ("a)" . "-")
                                            ("a." . "a)"))))
;; 18.4
;; (require 'org-checklist)

(add-hook 'org-after-todo-state-change-hook 'bh/mark-next-parent-tasks-todo 'append)
(add-hook 'org-clock-in-hook 'bh/mark-next-parent-tasks-todo 'append)
;; 18.54
(setq org-time-clocksum-format
      '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))
;; 19.9
(setq org-enable-priority-commands t)
(setq org-default-priority ?E)
(setq org-lowest-priority ?E)
;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'org-habit)
;; (setq org-log-done t)
;; (global-visual-line-mode t)
;; (org-clock-persistence-insinuate)
;; ;; 18.14
; Enable habit tracking (and a bunch of other modules)
(setq org-modules (quote (org-bbdb
                          org-bibtex
                          org-crypt
                          org-gnus
                          org-id
                          org-info
                          ;;org-jsinfo
                          org-habit
                          org-inlinetask
                          org-irc
                          ;;org-mew
                          org-mhe
                          org-protocol
                          org-rmail
                          ;;org-vm
                          ;;org-wl
                          org-w3m)))

; position the habit graph on the agenda to the right of the default
(setq org-habit-graph-column 50)
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on

(setq org-link-abbrev-alist
  '(("filepath"  . "d:/Sync/CloudStation/App/Emacs/org/LinkFiles/")
    ("bibpath"   . "d:/Sync/CloudStation/BibliographyLib/")))
;;  (font-lock-fontify-buffer))

;; org链接的默认打开程序
;;(require 'org)
;;(add-hook 'org-mode-hook
;;      '(lambda ()
;;;;         (delete '("\\.pdf\\'" . default) org-file-apps)
;;	 (add-to-list 'org-file-apps '("\\.doc\\'" . default))
;;	 (add-to-list 'org-file-apps '("\\.docx\\'" . default))
;;	 (add-to-list 'org-file-apps '("\\.xls\\'" . default))
;;	 (add-to-list 'org-file-apps '("\\.xlsx\\'" . default))))
;;(eval-after-load "org"
;;  '(progn
     ;; .txt files aren't in the list initially, but in case that changes
     ;; in a future version of org, use if to avoid errors
;;     (add-to-list 'org-file-apps '("\\.doc\\'" . default) t)))
;;;;;;;;;;;;;;;;;;;;;
;; \\\\\\\\\\\\\\\ org-mode ///////////////

