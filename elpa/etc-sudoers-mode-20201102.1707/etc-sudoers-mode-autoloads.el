;;; etc-sudoers-mode-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "etc-sudoers-mode" "etc-sudoers-mode.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from etc-sudoers-mode.el

(autoload 'etc-sudoers-mode "etc-sudoers-mode" "\
Generic mode for sudoers configuration files.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("/sudoers\\>" . etc-sudoers-mode))

(autoload 'etc-sudoers-mode-visudo "etc-sudoers-mode" "\
Edit the sudoers file via visudo, which will validate the file for you." t nil)

(register-definition-prefixes "etc-sudoers-mode" '("etc-sudoers-mode-"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; etc-sudoers-mode-autoloads.el ends here
