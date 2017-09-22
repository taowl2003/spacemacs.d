(provide 'twl-edit)
;; hide region; hide lines; undo-tree; browse-kill-ring; register; copy word, line or paragraph

;;hide region
(require 'hide-region)
(global-set-key (kbd "C-c r") 'hide-region-hide)
(global-set-key (kbd "C-c R") 'hide-region-unhide)
;; hide lines
(require 'hide-lines)
(global-set-key (kbd "C-c l") 'hide-lines)
(global-set-key (kbd "C-c L") 'hide-lines-show-all)
;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode)
;; browse-kill-ring
(require 'browse-kill-ring)
(browse-kill-ring-default-keybindings)
;;    (global-set-key (kbd "C-c k") 'browse-kill-ring)
(require 'browse-kill-ring+)
;; register
(global-set-key (kbd "<f8> c k") 'copy-to-register)
(global-set-key (kbd "<f8> c p") 'insert-register)
;; macro save
(global-set-key (kbd "<f8> m n") 'name-last-kbd-macro)

;; 拷贝当前单词
(defun copy-word (&optional arg)
 "Copy words at point"
 (interactive "P")
 (let ((beg (progn (if (looking-back "[a-zA-Z0-9]" 1) (backward-word 1)) (point))) 
	(end (progn (forward-word arg) (point))))
 (copy-region-as-kill beg end))
)
(global-set-key (kbd "<f8> c w") 'copy-word)

;; 拷贝一行
(defun copy-line (&optional arg)
 "Save current line into Kill-Ring without mark the line"
 (interactive "P")
 (let ((beg (line-beginning-position)) 
	(end (line-end-position arg)))
 (copy-region-as-kill beg end))
)
(global-set-key (kbd "<f8> c y") 'copy-line)

;; 拷贝一段
(defun copy-paragraph (&optional arg)
 "Copy paragraphes at point"
 (interactive "P")
 (let ((beg (progn (backward-paragraph 1) (point))) 
	(end (progn (forward-paragraph arg) (point))))
 (copy-region-as-kill beg end))
)

(global-set-key (kbd "<f8> c r") 'copy-region-as-kill)
(global-set-key (kbd "<f8> c b") 'avy-copy-region)
