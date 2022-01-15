;;; major-mode-icons-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "major-mode-icons" "major-mode-icons.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from major-mode-icons.el

(defvar major-mode-icons-mode t "\
Non-nil if Major-Mode-Icons mode is enabled.
See the `major-mode-icons-mode' command
for a description of this minor mode.")

(custom-autoload 'major-mode-icons-mode "major-mode-icons" nil)

(autoload 'major-mode-icons-mode "major-mode-icons" "\
A minor mode of showing icon for major-mode of current buffer.

If called interactively, toggle `Major-Mode-Icons mode'.  If the
prefix argument is positive, enable the mode, and if it is zero
or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "major-mode-icons" '("major-mode-icons-" "powerline-major-mode-icons"))

;;;***

;;;### (autoloads nil nil ("major-mode-icons-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; major-mode-icons-autoloads.el ends here
