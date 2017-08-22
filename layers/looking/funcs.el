;; 默认风格 (frame)
(defun my-default-frame-face ()
  ;; Default font
  (qiang-set-font
   '("Monaco" "Consolas" "DejaVu Sans Mono" "Monospace") 12
   '("Microsoft YaHei UI" "微软雅黑" "新宋体" "AR PL UMing CN" "文泉驿正黑") 
   '("SimSun-ExtB" "HanaMinB" "MingLiU-ExtB"))
  (set-face-attribute 'default nil :font (font-spec))
  (set-frame-parameter (selected-frame) 'alpha '(100 100))
  (add-to-list 'initial-frame-alist '(alpha 100 100)) )
