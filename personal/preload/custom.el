(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (xah-find zop-to-char zenburn-theme which-key volatile-highlights undo-tree smartrep smartparens smart-mode-line operate-on-number move-text magit projectile ov imenu-anywhere guru-mode grizzl god-mode gitignore-mode gitconfig-mode git-timemachine gist flycheck expand-region epl easy-kill diminish diff-hl discover-my-major dash crux browse-kill-ring beacon anzu ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; MY ADDITIONS:::
(setq visible-bell 1)
(set-default-font "Source Code Pro 14")  
(when window-system (set-frame-size (selected-frame) 80 24))
(scroll-bar-mode -1)
(autoload 'asm86-mode "C:/Program Files/emacs/ext/asm86-mode.el")
(setq auto-mode-alist
      (append '(("\\.asm\\'" . asm86-mode) ("\\.inc\\'" . asm86-mode))
              auto-mode-alist))
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

(defun my-tabber()
  (switch-to-buffer(other-buffer (current-buffer) t))
  )
(global-set-key (kbd "C-l") nil)
(global-set-key (kbd "C-l l") 'crux-move-beginning-of-line)
(global-set-key (kbd "C-l ;") 'move-end-of-line)
(global-set-key (kbd "C-o") 'forward-char)
(global-set-key (kbd "C-i") 'next-line)
(global-set-key (kbd "C-e") 'previous-line)
(global-set-key (kbd "C-n") 'backward-char)
(global-set-key (kbd "M-o") 'forward-word)
(global-set-key (kbd "M-i") 'forward-sentence)
(global-set-key (kbd "M-e") 'backward-sentence)
(global-set-key (kbd "M-n") 'backward-word)
(global-set-key (kbd "<C-tab>") 'my-tabber)
(global-set-key (kbd "M-p") 'ace-window)
;; Use UTF-8 for all character encoding.
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(set-locale-environment "en.UTF-8")
(prefer-coding-system 'utf-8)
(setq utf-translate-cjk-mode nil) ; disable CJK coding/encoding

;; END MY ADDITIONS:::
