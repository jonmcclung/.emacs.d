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

(add-to-list 'load-path "~/.emacs.d/lisp/")
(load "asm86-mode")
(setq auto-mode-alist
      (append '(("\\.asm\\'" . asm86-mode) ("\\.s\\'" . asm86-mode) ("\\.S\\'" . asm86-mode))
              auto-mode-alist))


;;; MISC. CUSTOMIZATION ;;;
;; The first statement below is essential to avoid FS problems, because  
;; windows is not good at handling >3 character extensions. This may not
;; be a problem on later versions of Windows. 
(setq make-backup-files nil)         ; no more of those annoying ~ files
(setq auto-save-default nil)         ; turn off auto-saving
(global-set-key [?\M-g] 'goto-line)  ; easier to jump to specific lines (M-g)


;;; ASM86 MODE "INSTALLATION" ;;;

;; This command loads the .elc file that defines Asm86 mode.  Be sure
;; that the file path is correct (forward slashes, not back slashes,
;; separate directories), and make the file extension ".el" instead
;; of ".elc" if you downloaded the Lisp source version instead of the
;; byte-compiled version.
(autoload 'asm86-mode "~/linux/emacs/asm86-mode.elc")       ;loads "asm86-mode.elc"

;; Make Emacs load Asm86 mode for .asm files. This command 
;; does not need any modifications. 
(setq auto-mode-alist
      (append '(("\\.asm\\'" . asm86-mode) ("\\.inc\\'" . asm86-mode)) auto-mode-alist))


;;; Customization for syntax highlighting ;;;

;; Enable syntax highlighting for Asm86 Mode:
(add-hook 'asm86-mode-hook 'turn-on-font-lock)

;; Customize syntax colors. This is the "recommended" 
;; color scheme. 
(cond ((fboundp 'global-font-lock-mode)
       ;; Customize face attributes
       (setq font-lock-face-attributes
             ;; Symbol-for-Face Foreground Background Bold Italic Underline
             '((font-lock-comment-face       "DarkGreen")
               (font-lock-string-face        "Sienna")
               (font-lock-keyword-face       "RoyalBlue")
               (font-lock-function-name-face "Red")
               (font-lock-variable-name-face "Black")
               (font-lock-type-face          "Blue")
               (font-lock-constant-face      "Purple")
               ))
       ;; Load the font-lock package.
       (require 'font-lock)))


;;; CUSTOMIZE ASM86 MODE BEHAVIOR ;;;


(load "move-lines")
(load "message-suppression")
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))


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
(global-set-key (kbd "<C-tab>") 'mode-line-other-buffer)
(global-set-key (kbd "M-p") 'ace-window)
(global-set-key (kbd "M-r") 'move-lines-up)
(global-set-key (kbd "M-s") 'move-lines-down)
(global-set-key (kbd "C-x g") 'magit-status)

;; Use UTF-8 for all character encoding.
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(set-locale-environment "en.UTF-8")
(prefer-coding-system 'utf-8)
(setq utf-translate-cjk-mode nil) ; disable CJK coding/encoding

;; END MY ADDITIONS:::
