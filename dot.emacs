
(global-set-key "\^H" 'backward-delete-char)
(setq transient-mark-mode nil)
(set-default-coding-systems 'utf-8-unix)
(tool-bar-mode -1)

;; ===== Automatically load abbreviations table =====

;; Note that emacs chooses, by default, the filename
;; "~/.abbrev_defs", so don't try to be too clever
;; by changing its name

(setq-default abbrev-mode t)
(setq save-abbrevs t)

;; ===== Turn off tab character =====

;;
;; Emacs normally uses both tabs and spaces to indent lines. If you
;; prefer, all indentation can be made from spaces only. To request this,
;; set `indent-tabs-mode' to `nil'. This is a per-buffer variable;
;; altering the variable affects only the current buffer, but it can be
;; disabled for all buffers.

;;
;; Use (setq ...) to set value locally to a buffer
;; Use (setq-default ...) to set value globally 
;;
(setq-default indent-tabs-mode nil) 

;; ========== Support Wheel Mouse Scrolling ==========

(mouse-wheel-mode t)

;; ========== Place Backup Files in Specific Directory ==========

;; Enable backup files.
(setq make-backup-files t)

;; Enable versioning with default values (keep five last versions, I think!)
(setq version-control t)

;; Save all backup file in this directory.
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))


;; ========== Enable Line and Column Numbering ==========

;; Show line-number in the mode line
(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)


;; (setq-default fill-column 72)


;; ===== Turn on Auto Fill mode automatically in all modes =====

;; Auto-fill-mode the the automatic wrapping of lines and insertion of
;; newlines when the cursor goes over the column limit.

;; This should actually turn on auto-fill-mode by default in all major
;; modes. The other way to do this is to turn on the fill for specific modes
;; via hooks.
(add-hook 'text-mode-hook 'auto-fill-mode)

;; ===== Make Text mode the default mode for new buffers =====
(setq default-major-mode 'text-mode)


;; ========= Set colours ==========

;; Set cursor and mouse-pointer colours

;; Set region background colour
(set-face-background 'region "white")

;; Set emacs background colour
;; list-colors-display to see available colors
(add-to-list 'default-frame-alist '(background-color . "linen"))

