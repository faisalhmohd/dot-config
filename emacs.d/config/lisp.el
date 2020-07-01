;; Set Lisp Indentation to 2
(setq lisp-body-indent 1)

;; Hide Line Numbers for EShell
(add-hook 'eshell-mode-hook
	  (lambda()
	   (linum-mode -1)
	   ))
