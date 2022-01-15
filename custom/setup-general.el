(menu-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-message t)
(defalias 'yes-or-no-p 'y-or-n-p)
(add-hook 'prog-mode-hook
          (lambda () (interactive)
            (setq show-trailing-whitespace 1)))
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq
 gdb-many-windows t
 gdb-show-main t)
(use-package company
  :init
  (global-company-mode 1)
  (delete 'company-semantic company-backends))
(global-set-key (kbd "C-c w") 'whitespace-mode)
(windmove-default-keybindings)
(provide 'setup-general)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-$") 'switch-to-prev-buffer)
(global-set-key (kbd "C-*") 'switch-to-next-buffer)
(global-set-key (kbd "C-M-y") 'recompile)

(global-set-key (kbd "C-M-*") 'eww-vf)
(defun shell-region (start end)
  "execute region in an inferior shell"
  (interactive "r")
  (shell-command  (buffer-substring-no-properties start end)))
(setq compilation-ask-about-save nil)
;(setq compilation-save-buffers-predicate '(lambda () nil))
(autoload 'run-prolog "prolog" "Start a Prolog sub-process." t)
(autoload 'prolog-mode "prolog" "Major mode for editing Prolog programs." t)
(setq prolog-system 'swi)
(setq auto-mode-alist (append '(("\\.pl$" . prolog-mode)
                                ("\\.m$" . mercury-mode))
                               auto-mode-alist))
(defun name-of-the-file ()
  "Gets the name of the file the current buffer is based on."
  (interactive)
  (insert (buffer-file-name (window-buffer (minibuffer-selected-window)))))
(global-set-key (kbd "C-c f") 'name-of-the-file)
(fset 'get-back
   (kmacro-lambda-form [?\C-u ?\C-x ?\C-x] 0 "%d"))
(global-set-key [f2] 'split-window-horizontally)
(fset 'd2u
      (kmacro-lambda-form
       [?\C-x ?h ?\C-u ?\M-| ?d ?o ?s ?2 ?u ?n ?i ?x return] 0 "%d"))
(fset 'd2e
      (kmacro-lambda-form
       [?\C-x ?h ?\M-x ?r ?e ?p ?l ?a ?c ?e ?- ?r ?e ?g ?e tab return ?\\ ?\( ?^ ?\\ ?s ?- ?* ?\C-q ?\C-j ?\\ ?\) ?\\ ?\{ ?2 ?, ?\\ ?\} return ?\C-q ?\C-j return] 0 "%d"))
(fset 'ddd
   (kmacro-lambda-form [?\M-x ?d ?2 ?u return ?\M-x ?d ?2 ?e return] 0 "%d"))

(fset 'move-comment-up-blank-line
   (kmacro-lambda-form [?\C-a return return ?\C-s ?/ ?/ return ?\C-b ?\C-b ?\C-k ?\C-p ?\C-y return ?\C-n ?\C-e] 0 "%d"))

(defun run-bash-on-region (&optional b e)
  "Run bash on script region"
  (interactive "r")
  (shell-command-on-region  b e  "/bin/bash"
                            nil  nil
                            "*Bash Error Buffer*"  t))

(global-set-key (kbd "C-M-!") 'run-bash-on-region)
(desktop-save-mode 1)
