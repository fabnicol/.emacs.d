(setq gc-cons-threshold 500000000)
(add-to-list 'load-path "~/.emacs.d/custom")
(add-to-list 'load-path "~/.emacs.d/metal-mercury-mode")
(add-to-list 'load-path "/home/fab/Build/ESS/lisp")
(autoload 'gid "idutils" nil t)
(put 'scroll-left 'disabled nil)
(require 'package)
(add-to-list 'package-archives
         '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)
(when (not package-archive-contents)
    (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(require 'metal-mercury-mode)
(autoload 'metal-mercury-mode "Mercury" "Major mode for editing Mercury programs." t)
(setq use-package-always-ensure t)
(require 'setup-general)
(require 'setup-cedet)
(require 'setup-editing)
(require 'setup-helm)
(use-package flycheck-mercury
   :defer t)
(menu-bar-mode 1)
(toggle-scroll-bar 1)
(load-theme 'tango-dark)
(use-package imenu
             :defer t)
(setq speedbar-show-unknown-files t)
(global-set-key [S-mouse-3] 'imenu-list-minor-mode)
(global-set-key [S-mouse-2] 'sr-speedbar-open)
(global-set-key [C-S-mouse-1] 'delete-window)
(require 'cc-mode)
(use-package semantic
  :defer 10
  :config
  ;(global-semanticdb-minor-mode 1)
  (global-semantic-idle-scheduler-mode 1))
(semantic-mode 1)
(setq c-default-style "gnu" )
(load "buffer-move")
(set-face-attribute 'default nil :height 180)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(astyle-custom-args
   '("--style=gnu" "--align-pointer=name" "--align-reference=name" "--unpad-paren" "--pad-oper" "--pad-comma" "-H"))
 '(display-fill-column-indicator-column 80)
 '(package-selected-packages
   '(astyle magit-libgit dash transient with-editor transient-dwim major-mode-icons markdown-preview-eww markdown-preview-mode magit-lfs 0blayout company-ctags flycheck epc npm-mode npm helm-xref ediprolog flycheck-mercury smartparens smex use-package-el-get nhexl-mode csv csv-mode ctags-update dante dired-git dired-rsync djvu docker docker-compose-mode docker-tramp dockerfile-mode download-region esxml etc-sudoers-mode function-args helm-fuzzy helm-fuzzy-find imenu-anywhere info-buffer info-colors magithub muse nav ov helm-google helpful helm-R zygospore yasnippet ws-butler volatile-highlights use-package undo-tree spacemacs-theme projectile-variable projectile-speedbar projectile-direnv project-explorer markdown-mode magit-delta imenu-list iedit helm-projectile format-all dtrt-indent dired-narrow counsel-projectile company-quickhelp company-c-headers comment-dwim-2 clean-aindent-mode anzu))
 '(safe-local-variable-values
   '((c-font-lock-extra-types "FILE" "bool" "language" "linebuffer" "fdesc" "node" "regexp")
     (c-indent-level . 4)))
 '(speedbar-show-unknown-files t)
 '(speedbar-use-imenu-flag nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(require 'man)
(set-face-attribute 'Man-overstrike nil :inherit 'bold :foreground "orange red")
(set-face-attribute 'Man-underline nil :inherit 'underline :foreground "forest green")
(add-hook 'shell-mode-hook 'compilation-shell-minor-mode)
(use-package smex
  :defer t)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(show-paren-mode 1)
(setq shell-command-switch "-ic")
(setq shell-file-name "bash")
(setq display-buffer-alist
  '(("^\\*R"
     nil
    (dedicated . t))))
(setq gc-cons-threshold (* 2 1000 1000))
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

(setq shell-file-name "bash")
