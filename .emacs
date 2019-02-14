;; Force initialization of Melpa packages
(setq package-enable-at-startup nil)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(custom-enabled-themes (quote (wombat)))
 '(delete-selection-mode nil)
 '(inhibit-startup-echo-area-message t)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice nil)
 '(mark-even-if-inactive t)
 '(menu-bar-mode nil)
 '(package-archives
   (quote
    (("melpa-stable" . "https://stable.melpa.org/packages/")
     ("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.milkbox.net/packages/"))))
 '(package-selected-packages (quote (evil undo-tree)))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(transient-mark-mode 1)
 '(truncate-lines t)
 '(visible-bell t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq default-cursor-type '(bar . 3))

;; General modes

; ibuffer - use ibuffer for buffer list (C-x C-b)
(defalias 'list-buffers 'ibuffer)

;; make buffer switch command show suggestions (C-x b)
(ido-mode 1)

;; Evil mode
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

