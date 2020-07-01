;; Package Management
(load "package")
(package-initialize)
(print package-archives)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))

;; Setup Packages
(setq my-packages 
 '(autopair
   auto-complete
   projectile
   web-mode
   ido-vertical-mode
   idle-highlight-mode
   rjsx-mode
   ag
   yaml-mode
   yasnippet
   yasnippet-snippets
   php-mode
   rainbow-mode
   magit
   elpy
   anzu
   tide
   )
)

(defun is-packages-installed ()
  (cl-loop for pkg in my-packages
        when (not (package-installed-p pkg)) do (cl-return nil)
        finally (cl-return t)))

(unless (is-packages-installed)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my-packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; Create backtraces on erros
(setq debug-on-error t)

;; Enable Yas Snipper Globally
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"))
(yas-global-mode 1)
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "C-t") 'yas-expand)

;; Enable Anzu | Display Search Results Better
(global-anzu-mode +1)

;; Splash Screen in Org Mode 
(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)

;; Require AG
(require 'ag)

;; Remove Menu bar
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Marking text
(delete-selection-mode t)
(transient-mark-mode t)
(setq x-select-enable-clipboard t)

;; Enable mouse
(xterm-mouse-mode 1)
(global-set-key (kbd "<mouse-4>") 'scroll-down-line)
(global-set-key (kbd "<mouse-5>") 'scroll-up-line)

;; Never backup files
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)

;; Just type y and n
(defalias 'yes-or-no-p 'y-or-n-p)

;; Key Bindings
(global-set-key (kbd "C-k") 'kill-whole-line)
(global-set-key (kbd "C-l") 'comment-or-uncomment-region)
(global-set-key (kbd "C-u") 'undo)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; Always show parentheses
(show-paren-mode t)

;; Use visual indicator instead of noises
(setq echo-keystrokes 0.1
      use-dialog-box nil)

;; Enable ido mode for navigating in filesystem
(ido-mode t)
(setq ido-enable-flex-matching t
      ido-use-virtual-buffers t)
(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

;; Auto pair brackets on creation
(require 'autopair)

;; turn on autocomplete
(ac-config-default)

;; Highlight words
(add-hook 'prog-mode-hook (lambda () (idle-highlight-mode t)))

;; Load wombat theme
(load-theme 'wombat t)

;; Color Codes
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;; Projectile Mode
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-p") 'projectile-command-map)

;; New line at end of file
(setq require-final-newline t)

;; Display line numbers
(global-linum-mode t)
(setq linum-format "%4d\u2502 ")

;; Org Agenda Files
(setq org-agenda-files (quote ("~/todo.org")))

;; Turn off Bell completely
(setq ring-bell-function 'ignore)

(defun move-line (n)
  "Move the current line up or down by N lines."
  (interactive "p")
  (setq col (current-column))
  (beginning-of-line) (setq start (point))
  (end-of-line) (forward-char) (setq end (point))
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (insert line-text)
    ;; restore point to original column in moved line
    (forward-line -1)
    (forward-char col)))

;; Move Line Up and Down
(defun move-line-up (n)
  "Move the current line up by N lines."
  (interactive "p")
  (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
  "Move the current line down by N lines."
  (interactive "p")
  (move-line (if (null n) 1 n)))

(global-set-key (kbd "M-<up>") 'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down)

;; Add Copy to clipboard
;; (xclip-mode 1)

;; Enable Cua Mode
(cua-mode 1)

;; Auto reload file if changed on disk
(global-auto-revert-mode t)

;; Tramp to use ssh instead of scp by default
(setq tramp-default-method "ssh")

;; Add Magit status shortcut
(global-set-key (kbd "C-x g") 'magit-status)

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; Highlight Current Line
(global-hl-line-mode 1)
(set-face-background 'hl-line "#000")
(set-face-foreground 'highlight nil)

;; Remove tabs and set width to 2
(setq-default indent-tabs-mode nil)

(put 'dired-find-alternate-file 'disabled nil)
