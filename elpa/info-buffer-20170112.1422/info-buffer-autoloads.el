;;; info-buffer-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "info-buffer" "info-buffer.el" (0 0 0 0))
;;; Generated autoloads from info-buffer.el

(autoload 'info-buffer "info-buffer" "\
Display Info TOPIC in its own buffer.

Displays TOPIC on the current window, and reuses an existing
buffer if it is already showing TOPIC.

With prefix, or if REPLICATE is non-nil, never reuse an existing
buffer.

\(fn TOPIC REPLICATE)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "info-buffer" '("info-buffer--open")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; info-buffer-autoloads.el ends here
