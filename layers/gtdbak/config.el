(require 'org-id)

(require 'org-checklist)

(require 'org-habit)

(setq org-clock-mode-line-total 'current)

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

(setq org-agenda-files (list "~/org/researchProj.org"
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

(setq bh/keep-clock-running nil)

(setq org-capture-templates
      (quote (("t" "Todo" entry (file+headline "~/org/inbox.org" "<Inbox>")
               "* TODO %?\n %i\n" :clock-in t :clock-resume t)
;;	      ("d" "Dictionary" entry (file+headline "~/org/inbox.org" "<Inbox>")
;;	       "* TODO Dictionary: %?\n" :clock-in t :clock-resume t)
	      ("n" "Note" entry (file+headline "~/org/inbox.org" "<Inbox>")
               "* %? :reference:\n" :clock-in t :clock-resume t)
;;	      ("l" "Log of time" entry (file+headline "~/org/inbox.org" "<Inbox>")
;;               "* %U: %?\n" :clock-in t :clock-resume t)
;;              ("m" "Meeting" entry (file+headline "~/org/Errands.org" "<Inbox>")
;;	       "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
              ("i" "Interrupt" entry (file+headline "~/org/inbox.org" "<Inbox>")
	       "* INTERRUPT by %? :INTERRUPT:\n%U" :clock-in t :clock-resume t)
	      ("h" "Habit" entry (file+headline "~/org/inbox.org" "<Inbox>")
               "* TODO %?\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: TODO\n:END:\n")
	      ("j" "Journal" entry (file+datetree "~/org/journal.org")
               "* %?\n%U\n" :clock-in t :clock-resume t)
	      ("r" "week review" entry (file+datetree "~/org/journal.org")
               "* %(format-time-string \"%Y-%W\")(-7)-Review %? :#diary:#week:\n%U\n- 时间开销\n  - 研究: \n  - 阅读: \n  - 工程: \n  - 院系: \n  - 组织: \n- 上周计划\n  \n- 主要完成任务\n  \n- 回顾\n\n- 总结\n\n" :clock-in t :clock-resume t)
	      ("p" "week plan" entry (file+datetree "~/org/journal.org")
               "* %(format-time-string \"%Y-%U\")(-7)-Plan%? :#plan:#week:\n%U\n- [ ] \n" :clock-in t :clock-resume t)
	      )))

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

(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

(setq org-outline-path-complete-in-steps nil)

(setq org-refile-use-outline-path t)

(setq org-refile-allow-creating-parent-nodes (quote confirm))

(setq org-completion-use-ido t)

(setq ido-everywhere t)

(setq ido-max-directory-size 100000)

(setq ido-default-file-method 'selected-window)

(setq ido-default-buffer-method 'selected-window)

(setq org-indirect-buffer-display 'current-window)

(setq org-refile-target-verify-function 'bh/verify-refile-target)

(setq org-agenda-dim-blocked-tasks nil)

(setq org-agenda-compact-blocks t)

(setq org-agenda-auto-exclude-function 'bh/org-auto-exclude-function)

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

(setq org-clock-history-length 23)

(setq org-clock-in-resume t)

(setq org-clock-history-length 23)

(setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))

(setq org-clock-into-drawer t)

(setq org-log-into-drawer t)

(setq org-clock-out-remove-zero-time-clocks t)

(setq org-clock-out-when-done t)

(setq org-clock-persist t)

(setq org-clock-persist-query-resume nil)

(setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))

(setq org-clock-report-include-clocking-task t)

(setq org-columns-default-format "%80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM")

(setq org-global-properties (quote (("Effort_ALL" . "0:15 0:30 0:45 1:00 2:00 3:00 4:00 5:00 6:00 0:00")
                                    ("STYLE_ALL" . "habit"))))

(setq org-agenda-log-mode-items (quote (closed state)))

(setq org-agenda-clockreport-parameter-plist
      (quote (:link t :maxlevel 3 :fileskip0 t :compact nil :narrow 80 )))

(setq org-agenda-span 'day)

(setq org-stuck-projects (quote ("" nil nil "")))

(setq org-list-demote-modify-bullet (quote (("-" . "+")
                                            ("+" . "*")
                                            ("*" . "-")
                                            ("1." . "1)")
                                            ("1)" . "-")
                                            ("A." . "A)")
                                            ("A)" . "a.")
                                            ("a)" . "-")
                                            ("a." . "a)"))))

(setq org-time-clocksum-format
      '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))

(setq org-enable-priority-commands t)

(setq org-default-priority ?E)

(setq org-lowest-priority ?E)

(setq org-log-done t)

(setq org-link-abbrev-alist
      '(("filepath"  . "d:/Sync/CloudStation/App/Emacs/org/LinkFiles/")
        ("bibpath"   . "d:/Sync/CloudStation/BibliographyLib/")))

(setq org-clock-continuously t)

(defvar bh/organization-task-id "eb155a82-92b2-4f25-a3c6-0304591af2f9")

(add-hook 'org-clock-out-hook 'bh/remove-empty-drawer-on-clock-out 'append)

(org-clock-persistence-insinuate)
(ido-mode (quote both))
(add-hook 'org-clock-out-hook 'bh/clock-out-maybe 'append)
(advice-add 'org-clocktable-indent-string :override #'my-org-clocktable-indent-string)
(add-hook 'org-after-todo-state-change-hook 'bh/mark-next-parent-tasks-todo 'append)
(add-hook 'org-clock-in-hook 'bh/mark-next-parent-tasks-todo 'append)
(global-visual-line-mode t)
(org-clock-persistence-insinuate)

(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))

(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
