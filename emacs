(setq rcs-active nil)
(setq vc-handled-backends nil)

;; .emacs

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Use the predefined fontset 
;"fontset-standard"
;(set-face-font 'default "fontset-standard")

;; End Point customizations

;; Always end a file with a newline
(setq require-final-newline t)

;; Stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)

;; No ~/.saves-pid-host files
(setq auto-save-list-file-prefix nil)

;; 4-space tab indents
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; Found at http://www.emacswiki.org/emacs/SmartTabs
;;(setq-default tab-width 4) ; or any other preferred value
;;(setq cua-auto-tabify-rectangles nil)
;;(defadvice align (around smart-tabs activate)
;;  (let ((indent-tabs-mode nil)) ad-do-it))
;;(defadvice align-regexp (around smart-tabs activate)
;;  (let ((indent-tabs-mode nil)) ad-do-it))
;;(defadvice indent-relative (around smart-tabs activate)
;;  (let ((indent-tabs-mode nil)) ad-do-it))
;;(defadvice indent-according-to-mode (around smart-tabs activate)
;;  (let ((indent-tabs-mode indent-tabs-mode))
;;    (if (memq indent-line-function
;;              '(indent-relative
;;                indent-relative-maybe))
;;        (setq indent-tabs-mode nil))
;;    ad-do-it))
;;(defmacro smart-tabs-advice (function offset)
;;  (defvaralias offset 'tab-width)
;;  `(defadvice ,function (around smart-tabs activate)
;;     (cond
;;      (indent-tabs-mode
;;       (save-excursion
;;         (beginning-of-line)
;;         (while (looking-at "\t*\\( +\\)\t+")
;;           (replace-match "" nil nil nil 1)))
;;       (setq tab-width tab-width)
;;       (let ((tab-width fill-column)
;;             (,offset fill-column))
;;         ad-do-it))
;;      (t
;;       ad-do-it))))
;;(smart-tabs-advice c-indent-line c-basic-offset)
;;(smart-tabs-advice c-indent-region c-basic-offset)


;; My customizations (some are overrides of the above)
;;(setq load-path (cons "/usr/share/emacs/22.0.50/lisp" load-path))
(setq load-path (cons "~/site_lisp" load-path))

;; No backup files (file~)
(setq make-backup-files nil)

;(setq make-backup-files t)
(setq auto-save-directory "~/tmp")
;(setq kept-new-versions 12)
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;(require 'backup-dir)
;(add-to-list 'bkup-backup-directory-info
;             (list tramp-file-name-regexp ""))

;; turn on font-lock mode
(require 'font-lock)
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;; enable visual feedback on selections
(setq transient-mark-mode t)

;(menu-bar-mode -1)
(setq win32-quote-process-args t)
(setq shell-command-switch "-c")
;; (setq interprogram-cut-function "y")

;; Printing from emacs
;(setq lpr-command "c:\\bin\\uxutl\\pr.exe")
(setq lpr-add-switches nil)

;; Emacs server
;(require 'gnuserv)
;(gnuserv-start)
;(setq gnuserv-frame (selected-frame))
(setq special-display-buffer-names
      '("*Help*" "*info*"))

;; Fonts, colors and screen layout
;(setq win32-enable-italics t)  ; This must be done before font settings!
;(set-default-font
; "-*-lucidatypewriter-medium-r-*-*-14-100-*-*-*-*-*-*")
;(set-face-font 'default
;	       "-*-lucidatypewriter-medium-r-*-*-14-100-*-*-*-*-*-ansi")
;(set-face-font 'bold 
;	       "-*-lucidatypewriter-bold-r-*-*-14-100-*-*-*-*-*-ansi")
;(set-face-font 'italic
;	       "-*-lucidatypewriter-medium-i-*-*-14-100-*-*-*-*-*-ansi")
;(set-face-font 'bold-italic 
;	       "-*-lucidatypewriter-bold-i-*-*-14-100-*-*-*-*-*-ansi")

;(setq initial-frame-alist 
;      '((top . 60) (left . 240)))

(setq current-font-narrow-width   79)
;(set-cursor-size                  88)
; select colors for improved retinal lifetime

;(require 'color-theme)
(require 'color-theme-solarized)
(eval-after-load "color-theme"
  '(progn
     ;(color-theme-initialize)
     (color-theme-solarized-dark)))

(set-frame-height (selected-frame) 52)
(set-frame-width (selected-frame) 120)
(setq frame-title-format
      '(:eval
        (if buffer-file-name
            (replace-regexp-in-string
             (getenv "HOME") "~"
             (concat (file-name-directory buffer-file-name) "%b") )
          (buffer-name)
          )))

;(require 'faces)
;(require 'x-faces)
;(defvar choose-color-faces-done nil)
;(if (and (boundp 'emacs-major-version)
;	 (> emacs-major-version 19))
;    (progn
;      (if choose-color-faces-done nil
;	;(fset 'choose-color-internal-set-face-1 (symbol-function 'internal-set-face-1))
;	(defun internal-set-face-1 (face name value index frame)
;	  "Substitute to `internal-set-face-1' from faces.el. Uses `choose-color'."
;	  (choose-color-internal-set-face-1 face name (choose-color value) index frame))
;	(setq choose-color-faces-done t))))
;(autoload 'choose-color "choose-color" "Choose color wisely.")

;; set the icon and frame titles %f file name, %b buffer name
(setq frame-title-format "%b")
(setq icon-title-format "%f")

(require 'resize-help-window)
(help-window-resize-mode 1)

(require 'cursor)

;(defun insert-cursor ()             (set-cursor-color my-fg))
;(defun overwrite-cursor ()          (set-cursor-color my-mg))

;; Miscellaneous features
;(show-paren-mode 1)
;(set-message-beep 'ok)
(setq track-eol t)
(setq version-control t)
(setq kept-new-versions 4)
(setq trim-versions-without-asking t)
(setq dabbrev-case-replace nil)
(setq dabbrev-case-fold-search t)
(setq dabbrev-upcase-means-case-search nil)
(setq query-replace-highlight t)
(setq search-highlight t)

;; Set tab stops
(setq tab-stop-list
  '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80))

;; Mouse control
(require 'avoid)
(if window-system (mouse-avoidance-mode 'animate))
(or (assq 'mouse-avoidance-mode minor-mode-alist)
    (setq minor-mode-alist (cons '(mouse-avoidance-mode " Avoid")
				 minor-mode-alist)))

;; Variable documentation support
(require 'varaprop)
(define-key help-map "\C-v" 'variable-apropos)

;; Recent files on menu toolbar
(require 'recentf)
(recentf-mode)

;; Jiggle cursor on buffer switch
(require 'jiggle)
(jiggle-mode 0)
(jiggle-searches-too 1)
(global-set-key (read-kbd-macro "C-c C-SPC") 'jiggle-cursor)

;; ishl mode

;(require 'ishl)
;(ishl-mode)


(add-to-list 'load-path "/home/jeff/site_lisp/guess-style")
(autoload 'guess-style-set-variable "guess-style" nil t)
(autoload 'guess-style-guess-variable "guess-style")
(autoload 'guess-style-guess-all "guess-style" nil t)

;; HTML mode
;(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
;(setq auto-mode-alist (cons '("\.html$" . html-helper-mode) auto-mode-alist))
;(setq auto-mode-alist (cons '("\.htm$"  . html-helper-mode) auto-mode-alist))
;; for MVC2 work
;(setq auto-mode-alist (cons '("\.tst$"  . html-helper-mode) auto-mode-alist))
(add-hook 'html-mode-common-hook 'guess-style-guess-all)
(add-hook 'html-mode-hook 'turn-off-auto-fill)
(add-hook 'html-mode-hook
          (lambda()
            (setq sgml-basic-offset 4)
            ;;(setq indent-tabs-mode t)
            )
)

;(setq load-path (cons "path_to_html-helper-mode_directory" load-path))
;(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
;(setq auto-mode-alist (cons '("\\.html$" . html-helper-mode) auto-mode-alist))


;; Recognize server-parsed HTML files
(setq auto-mode-alist (cons '("\\.shtml$" . html-helper-mode) auto-mode-alist))

;; Insert new document HTML template
;(setq html-helper-build-new-buffer t)

;; Insert address
(setq html-helper-address-string 
  "<a href=\"your_URL\">your_name &lt;your_e-mail_address&gt;</a>")

;; Enable time stamp
;;(setq html-helper-do-write-file-hooks t)

;; Enable hyperlink prompt
(setq tempo-interactive t)

;; SQL mode
(autoload 'sql-postgres "sql" "Interactive SQL mode." t)
(add-hook 'sql-mode-common-hook 'guess-style-guess-all)

;; C mode
(setq auto-mode-alist (cons '("\.pc$" . c-mode) auto-mode-alist))
(setq c-indent-level 2)
(setq c-continued-statement-offset 2)
(setq c-brace-offset -2)
(setq c-label-offset -2)
(setq c-auto-newline t)
(setq comment-multi-line t)

;; Perl mode
(fset 'perl-mode 'cperl-mode)
(add-hook 'cperl-mode-common-hook 'guess-style-guess-all)
(autoload 'cperl-mode "cperl-mode" "alternate mode for editing Perl programs" t)
 (setq auto-mode-alist
      (append '(("\\.\\([pP][Llmh]\\|al\\|\\t\\)$" . cperl-mode))  auto-mode-alist ))
 (setq auto-mode-alist
      (append '(("\\.cgi$" . cperl-mode))  auto-mode-alist ))
 (setq auto-mode-alist
      (append '(("\\.\\(sub\\|am\\|tag\\)$" . cperl-mode))  auto-mode-alist ))
 (setq interpreter-mode-alist (append interpreter-mode-alist
 				        '(("miniperl" . cperl-mode))))
 (setq cperl-merge-trailing-else nil)
(add-hook 'cperl-mode-hook '(lambda () (cperl-set-style "BSD")))
(custom-set-variables
 '(cperl-indent-level 4)
 '(cperl-tab-always-indent t)
 '(cperl-close-paren-offset -4)
 '(cperl-merge-trailing-else nil)
 '(cperl-continued-statement-offset 4)
 '(cperl-indent-parens-as-block t)
 )

(defun perltidy-region ()
    "Run perltidy on the current region."
    (interactive)
    (save-excursion
      (shell-command-on-region (point) (mark) "perltidy -q" nil t)))
(global-set-key "\M-t" `perltidy-region)

;; Generic mode
(require 'generic-mode)
(require 'generic-extras)

;; Text mode
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Fontifying and colorizing
;(eval-after-load "font-lock" '(require 'choose-color))
(cond ((fboundp 'global-font-lock-mode)
       ;; Turn on font-lock in all modes that support it
       (global-font-lock-mode t)
       ;; Maximum colors
       (setq font-lock-maximum-decoration t)))

;; PC keyboard mode
; (load "pc-mode")
; (pc-bindings-mode)
; (pc-selection-mode)

;; Key definitions
;(global-set-key "`" 'advertised-undo)
(global-set-key "\e#" 'goto-line)

;This doesn't work in XEmacs
;(require 'vi-dot)
;(global-set-key "\C-xz" 'vi-dot)

;(define-key ctl-x-map "\C-b" ('list-buffers t))
(global-set-key (kbd "C-x C-b") 'ibuffer)

(defun match-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg 1)))))
(global-set-key "%" 'match-paren)

(defun self-insert-char (char)
  "Insert CHAR respecting things like overwrite mode & auto-fill."
  (or (numberp char) (error "self-insert-char: arg %S not a #" char))
  (let ((last-command-char char))
    (self-insert-command 1)))

(defun ditto ()
  "Copy current column's character from previous line to current line."
  (interactive)
  (let ((col (current-column))
        (char nil))
    (save-excursion
      (forward-line -1)
      (move-to-column col)
      (or (looking-at "$")
          (setq char (following-char))))
    (if (not char)
        (error "End of line")
      (self-insert-char char))))
(global-set-key "\C-\\" 'ditto);Ascii 92
(global-set-key "\C-j" 'indent-relative)
(defun skip-whitespace ()
  "Skip whitespace"
  (skip-chars-forward " \t"))

(setq win32-alt-is-meta nil)
(global-set-key [(alt b)] 'backward-sentence)
(global-set-key [(alt f)] 'forward-sentence)
(global-set-key "\C-x?" 'describe-key-briefly)
;(global-set-key [(f3)] 'nonincremental-repeat-search-forward)
(global-set-key [(f4)] 'find-file)
(global-set-key [(control f3)] 'nonincremental-repeat-search-backward)
(global-set-key [(control f4)] 'kill-this-buffer)
(global-set-key "\C-x\C-w" 'skip-whitespace)

(defun increment-number-at-point ()
  (interactive)
  (skip-chars-backward "0123456789")
  (or (looking-at "[0123456789]+")
      (error "No number at point"))
  (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))

(global-set-key (kbd "C-c +") 'increment-number-at-point)

;(require 'switch-buffer)
;(global-set-key "\C-c\C-b"      'wm-switch-buffer)

(add-hook 'after-save-hook
  'executable-make-buffer-file-executable-if-script-p)

(require 'bs)

;(require 'tramp)
;(setq tramp-default-method "ssh")
;(tramp-set-completion-function "ssh"
;'((tramp-parse-sconfig "/etc/ssh_config")
;(tramp-parse-sconfig "~/.ssh/config")))

;(defadvice tramp-handle-write-region
;(after tramp-write-beep-advice activate)
;" make tramp beep after writing a file."
;(interactive)
;(beep))

;(defadvice tramp-handle-do-copy-or-rename-file
;(after tramp-copy-beep-advice activate)
;" make tramp beep after copying a file."
;(interactive)
;(beep))

;(defadvice tramp-handle-insert-file-contents
;(after tramp-copy-beep-advice activate)
;" make tramp beep after copying a file."
;(interactive)
;(beep))

;(load "sorter" nil t)
;(define-key dired-mode-map "s" 'dired-toggle-sort)
;(define-key dired-mode-map "a" 'dired-toggle-hidden)

;; fix up the menu bar to use lpr-buffer instead of print-buffer
;(define-key menu-bar-tools-menu [lpr-buffer] '("Lpr Buffer" . lpr-buffer))
;(define-key menu-bar-tools-menu [lpr-region] '("lpr Region" . lpr-region))
;(define-key menu-bar-tools-menu [print-buffer] nil)
;(define-key menu-bar-tools-menu [print-region] nil)

;; Diversions and toys

;; Using diminished minor modes saves room on mode line
;; (needs to be near bottom to ensure all referenced modes loaded)
(require 'diminish)
(diminish 'abbrev-mode "Abv")
(diminish 'jiggle-mode)
(diminish 'mouse-avoidance-mode "M")

(global-set-key (kbd "C-c C-d") 'kill-entire-line)

(mwheel-install)
(line-number-mode 1)

;(defun highlight-whitespace ()
;  "Highlight various forms of whitespace (`C-i')."
;  (font-lock-add-keywords nil '(("[\t]+" (0 'dwc-tab-face t))))
;  (font-lock-add-keywords nil '((" +$" (0 'dwc-trailing-space-face t)))))

;(add-hook 'font-lock-mode-hook 'highlight-whitespace)

;(require 'crypt)

; mmm-mode
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
;(require 'mmm-mode)
(require 'mmm-auto)
(setq mmm-global-mode 'maybe)

;(require 'visws)

; Outline-minor-mode key map
(define-prefix-command 'cm-map nil "Outline-")
; HIDE
(define-key cm-map "q" 'hide-sublevels)    ; Hide everything but the top-level headings
(define-key cm-map "t" 'hide-body)         ; Hide everything but headings (all body lines)
(define-key cm-map "o" 'hide-other)        ; Hide other branches
(define-key cm-map "c" 'hide-entry)        ; Hide this entry's body
(define-key cm-map "l" 'hide-leaves)       ; Hide body lines in this entry and sub-entries
(define-key cm-map "d" 'hide-subtree)      ; Hide everything in this entry and sub-entries
; SHOW
(define-key cm-map "a" 'show-all)          ; Show (expand) everything
(define-key cm-map "e" 'show-entry)        ; Show this heading's body
(define-key cm-map "i" 'show-children)     ; Show this heading's immediate child sub-headings
(define-key cm-map "k" 'show-branches)     ; Show all sub-headings under this heading
(define-key cm-map "s" 'show-subtree)      ; Show (expand) everything in this heading & below
; MOVE
(define-key cm-map "u" 'outline-up-heading)                ; Up
(define-key cm-map "n" 'outline-next-visible-heading)      ; Next
(define-key cm-map "p" 'outline-previous-visible-heading)  ; Previous
(define-key cm-map "f" 'outline-forward-same-level)        ; Forward - same level
(define-key cm-map "b" 'outline-backward-same-level)       ; Backward - same level
(global-set-key "\M-o" cm-map)

(defmacro join (join-char &rest others) `(mapconcat 'identity ',others ,join-char))

(setq my-cperl-outline-regexp
      (concat
       "^"                              ; Start of line
       "[ \\t]*"                        ; Skip leading whitespace
       "\\("                            ; begin capture group \1
       (join "\\|"
             "=head[12]"                  ; POD header
             "package"                    ; package
             "=item"                      ; POD item
             "sub"                        ; subroutine definition
           )
       "\\)"                            ; end capture group \1
       "\\b"                            ; Word boundary
       ))
(setq cperl-mode-hook 'my-cperl-customizations)

(defun my-cperl-customizations ()
  "cperl-mode customizations that must be done after cperl-mode loads"
  (outline-minor-mode)
  (abbrev-mode)

  (defun cperl-outline-level ()
    (looking-at outline-regexp)
    (let ((match (match-string 1)))
      (cond
       ((eq match "=head1" ) 1)
       ((eq match "package") 2)
       ((eq match "=head2" ) 3)
       ((eq match "=item"  ) 4)
       ((eq match "sub"    ) 5)
       (t 7)
       )))

  (setq cperl-outline-regexp  my-cperl-outline-regexp)
  (setq outline-regexp        cperl-outline-regexp)
  (setq outline-level        'cperl-outline-level)
  (smart-tabs-advice cperl-indent-line cperl-indent-level)
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; the igrep package 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
(autoload (function igrep) "igrep" 
"*Run ´grep´ PROGRAM to match EXPRESSION in FILES..." t) 
(autoload (function igrep-find) "igrep" 
"*Run ´grep´ via ´find´..." t) 
(autoload (function dired-do-igrep) "igrep" 
"*Run ´grep´ on the marked (or next prefix ARG) files." t) 
(autoload (function dired-do-igrep-find) "igrep" 
"*Run ´grep´ via ´find´ on the marked (or next prefix ARG) directories." t) 
(autoload (function grep) "igrep" 
"*Run ´grep´ PROGRAM to match EXPRESSION in FILES..." t) 
(autoload (function egrep) "igrep" "*Run ´egrep´..." t) 
(autoload (function fgrep) "igrep" "*Run ´fgrep´..." t) 
(autoload (function agrep) "igrep" "*Run ´agrep´..." t) 
(autoload (function grep-find) "igrep" "*Run ´grep´ via ´find´..." t) 
(autoload (function egrep-find) "igrep" "*Run ´egrep´ via ´find´..." t) 
(autoload (function fgrep-find) "igrep" "*Run ´fgrep´ via ´find´..." t) 
(autoload (function agrep-find) "igrep" "*Run ´agrep´ via ´find´..." t) 
(autoload (function dired-do-grep) "igrep" 
"*Run ´grep´ on the marked (or next prefix ARG) files." t) 
(autoload (function dired-do-grep-find) "igrep" 
"*Run ´grep´ via ´find´ on the marked (or next prefix ARG) directories." t) 

(put 'narrow-to-region 'disabled nil)
