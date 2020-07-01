
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq user-full-name "Mohammad Faisal")
(setq user-mail-address "faisalhmohd@gmail.com")

(load "~/.emacs.d/config/css")
(load "~/.emacs.d/config/emacs")
(load "~/.emacs.d/config/html")
(load "~/.emacs.d/config/js")
(load "~/.emacs.d/config/lisp")
(load "~/.emacs.d/config/php")
(load "~/.emacs.d/config/python")
(load "~/.emacs.d/config/yaml")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (prettier-js add-node-modules-path org-mode rainbow-mode tide anzu elpy flycheck xclip use-package yasnippet-classic-snippets yasnippet php-mode aggressive-indent idle-highlight-mode gruvbox-theme spacemacs-theme rjsx-mode ido-vertical-mode auto-complete autopair))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(region ((t (:background "brightblue" :foreground "#f6f3e8")))))

(global-set-key [(control ?h)] 'delete-backward-char)
