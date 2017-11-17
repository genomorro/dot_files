;; Genomorro's dot emacs
;; Edgar Uriel Domínguez Espinoza
;; http://genomorro.webcindario.com

;; Sources:
;; http://emacs-fu.blogspot.com/
;; http://www.emacswiki.org/
;; http://www.blackhats.es/
;; http://www.masteringemacs.org/
;; http://tsdh.wordpress.com/
;; http://echosa.github.com/
;; http://emacsredux.com/
;; http://blog.patshead.com/

;; Location Variables

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq calendar-latitude 19.43)
(setq calendar-longitude -99.09)
(setq calendar-location-name "Ciudad de México, Distrito Federal, México")
(setq calendar-week-start-day 1)
(setq calendar-day-name-array ["Do" "Lu" "Ma" "Mi" "Ju" "Vi" "Sa"])
(setq calendar-month-name-array ["Enero" "Febrero" "Marzo" "Abril"
				 "Mayo" "Junio" "Julio" "Agosto"
				 "Setiembre" "Octubre" "Noviembre"
				 "Diciembre"])
;; General Settings
(let ((default-directory "~/.emacs.d/elpa/"))
      (normal-top-level-add-subdirs-to-load-path))
(require 'ac-math)
(require 'auto-complete-config)
(require 'auto-complete-pcmp)
(require 'ac-c-headers)
(require 'bbdb)
(require 'em-term)
(require 'epa-file)
(require 'eshell-did-you-mean)
(require 'eww)
(require 'hl-line)
(require 'ido)
(require 'linum)
(require 'multiple-cursors)
(require 'org)
(require 'ox-bibtex)
(require 'package)
(require 'pdf-occur)
(require 'popup)
(require 'server)
(require 'site-gentoo)
(require 'smtpmail)
(require 'speedbar)
(require 'tex-mode)
(require 'uniquify)
(require 'vline)
(require 'which-func)
(require 'yasnippet)
(unless (server-running-p)
  (server-start))
(setq inhibit-startup-message t)
(setq initial-scratch-message
  ";; scratch buffer created -- happy hacking\n \n")
(put 'narrow-to-region 'disabled nil)
(load "/usr/share/emacs/site-lisp/site-gentoo")
(fset 'yes-or-no-p 'y-or-n-p)
(global-unset-key "\C-z")
(global-unset-key (kbd "<menu>"))
(setq uniquify-buffer-name-style 'forward)           ; Making buffer names unique
(setq bookmark-default-file "~/.emacs.d/bookmarks"   ; No bookmarks in ~/
      bookmark-save-flag 1)                          ; autosave each change
(setq scroll-margin 0                                ; do smooth scrolling, ...
      scroll-conservatively 100000                   ; ... the defaults ...
      scroll-up-aggressively 0.0                     ; ... are very ...
      scroll-down-aggressively 0.0                   ; ... annoying
      scroll-preserve-screen-position t)             ; preserve screen pos with C-v/M-v
(setq epa-pinentry-mode 'loopback)                   ; Configure EasyPG Assistant to use loopback for pinentry
;; Package Manager
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
 			 ("melpa" . "https://melpa.org/packages/")
			 ("org" . "http://orgmode.org/elpa/")
			 ))
(setq package-pinned-packages '((yasnippet . "gnu")
				(org . "org")
				(org-plus-contrib . "org")))
;; Change cursor color according to mode
(setq read-only-color       "#dc322f")
;; valid values are t, nil, box, hollow, bar, (bar . WIDTH), hbar,
;; (hbar. HEIGHT); see the docs for set-cursor-type
(setq read-only-cursor-type 'bar)
(setq overwrite-color       "#cb4b16")
(setq overwrite-cursor-type 'hollow)
(setq normal-color          "#C3BF9F")
(setq normal-cursor-type    'box)
(defun set-cursor-according-to-mode ()
  "change cursor color and type according to some minor modes."
  (cond
   (buffer-read-only
    (set-cursor-color read-only-color)
    (setq cursor-type read-only-cursor-type))
   (overwrite-mode
    (set-cursor-color overwrite-color)
    (setq cursor-type overwrite-cursor-type))
   (t 
    (set-cursor-color normal-color)
    (setq cursor-type normal-cursor-type))))
(add-hook 'post-command-hook 'set-cursor-according-to-mode)
;; Color-theme
(setq custom-theme-directory "~/.emacs.d/elpa/elisp-local")
(setq custom-theme-load-path '("/home/genomorro/.emacs.d/themes/emacs-color-theme-solarized" custom-theme-directory t))
(set-frame-parameter nil 'background-mode 'dark)
(set-terminal-parameter nil 'background-mode 'dark)
(add-hook 'after-make-frame-functions
	  (lambda (frame)
	    (let ((mode (if (display-graphic-p frame) 'light 'dark)))
	      (set-frame-parameter frame 'background-mode mode)
	      (set-terminal-parameter frame 'background-mode mode))
	    (load-theme 'solarized t)))
(load-theme 'solarized t)
(set-frame-font "Liberation Mono-6")
;; Auto-Complete Mode
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(add-to-list 'ac-modes 'latex-mode)                  ; make auto-complete aware of {{{latex-mode}}}
(defun ac-common-setup ()                            ; add yasnippet to default ac-sources
  (setq ac-sources (append '(ac-source-yasnippet) ac-sources)))
(defun ac-latex-mode-setup ()                        ; add sources for latex
  (setq ac-sources
	(append '(ac-source-math-unicode
		  ac-source-math-latex
		  ac-source-latex-commands) ac-sources)))
(add-hook 'latex-mode-hook 'ac-latex-mode-setup)
(setq ac-math-unicode-in-math-p t)
(defun ac-c-mode-setup ()
  (semantic-mode 1)
  (setq ac-sources
	(append '(ac-source-c-headers
		  ac-source-c-header-symbols
		  ac-source-semantic-raw) ac-sources)))
(add-hook 'c-mode-hook 'ac-c-mode-setup)
;; Yasnippet
(setq yas-snippet-dirs
      (append '("~/.emacs.d/yasnippets/genomorro"    ; personal snippets
		"~/.emacs.d/yasnippets/rejeep"       ; just some rejeep's snippets
		) yas-snippet-dirs))
(yas-global-mode 1)
(yas-reload-all)
(setq yas-prompt-functions '(yas-ido-prompt yas-completing-prompt)) ; No dropdowns
;; Multiple cursors mode
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;; From active region to multiple cursors:
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-S-c C-e") 'mc/edit-ends-of-lines)
(global-set-key (kbd "C-S-c C-a") 'mc/edit-beginnings-of-lines)
;; php-mode site-lisp configuration
(autoload 'php-mode "php-mode" "Major mode for editing PHP code." t)
(add-to-list 'auto-mode-alist '("\\.php[s34]?\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc\\'" . php-mode))
;; PlantUML mode
(setq puml-plantuml-jar-path "/usr/local/bin/plantuml.jar")
(add-to-list 'auto-mode-alist '("\\.puml\\'" . puml-mode))
(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . puml-mode))
;; Markdown mode
(setq markdown-command "markdown2")
;; PDF-tools
(pdf-tools-install)
;; Modes
(column-number-mode t)		                     ; Show number of column in the mode-line
(size-indication-mode t)                             ; show file size in the mode-line
(mouse-avoidance-mode 'jump)                         ; Mouse ptr when cursor is too close
(which-function-mode t)                              ; Displays the current function name in the mode-line
(display-time-mode t)
(display-battery-mode t)
(setq battery-mode-line-format " [%b %p%% ] ")
(tool-bar-mode 0)
(menu-bar-mode 0)
(tooltip-mode 0)
(scroll-bar-mode 0)
(global-hl-line-mode t)
(type-break-mode t)
(pinentry-start t)
(setq use-file-dialog nil)
;; Enable copy/paste with clipboard
(setq select-enable-clipboard t                      ; copy-paste should work ...
      interprogram-paste-function                    ; ...with...
      'x-cut-buffer-or-selection-value)              ; ...other X clients
(setq locale-preferred-coding-systems '((".*" . utf-8)))
(set-language-environment "UTF-8")                   ; prefer utf-8 for language settings
(set-input-method nil)                               ; no funky input for normal editing;
(setq read-quoted-char-radix 10)                     ; use decimal, not octal
;; Save history between sessions
(setq savehist-additional-variables                  ; also save...
      '(search-ring regexp-search-ring)              ; ... my search entries
      savehist-file "~/.emacs.d/history")            ; keep my home clean
(savehist-mode t)                                    ; do customization before activate
;; Restore Windows configuration
(setq winner-dont-bind-my-keys t)                    ; winner conflicts with org
(global-set-key (kbd "<C-s-left>") 'winner-undo)
(global-set-key (kbd "<C-s-right>") 'winner-redo)
(winner-mode t)
;; Move between buffers in split screen
(global-set-key (kbd "<C-M-left>")  'windmove-left)
(global-set-key (kbd "<C-M-right>") 'windmove-right)
(global-set-key (kbd "<C-M-up>")    'windmove-up)
(global-set-key (kbd "<C-M-down>")  'windmove-down)
;; Formatting Text Files
(add-hook 'text-mode-hook
          (lambda ()
            (auto-fill-mode t)
            (setq default-justification 'full)
	    (setq fill-column 96))                   ; Nice for pretty print on landscape: 77 
          )
;; Spell settings
(setq ispell-program-name "aspell"
      ispell-extra-args '("--sug-mode=ultra"))
(global-set-key (kbd "C-c E") (lambda()(interactive)
				(ispell-change-dictionary "english") (flyspell-buffer))) 
(global-set-key (kbd "C-c S") (lambda()(interactive)
				(ispell-change-dictionary "spanish") (flyspell-buffer))) 
;; Pretty Print
(setq lpr-switches '("-p -o page-top=0 -o page-bottom=57 -o page-left=57 -o page-right=57 -o media=Letter -o portrait -o fit-to-page"))
(defun ps-save-buffer-in-pdf ()
  "Save a buffer in a PDF file"
  (interactive)
  (ps-print-buffer "/tmp/tmp.ps")
  (shell-command (concat "ps2pdf14 /tmp/tmp.ps " (buffer-name) ".pdf"))
  (shell-command "rm /tmp/tmp.ps")
  (message (concat "Saved to:  " (buffer-name) ".pdf")))
(setq ps-n-up-printing 1                                     ; Number of pages per sheet of paper ...
      ps-left-margin 57                                      ; ... and margins, right, left ...
      ps-right-margin 57                                     ; ... are 2 [cm]
      ps-bottom-margin 57
      ps-top-margin 57
      ps-header-offset 0
      ps-footer-offset 0
      ps-n-up-border-p nil                                   ; Print border of the page
      ps-print-color-p t
      ps-paper-type 'letter
      ps-print-header nil
      ps-header-font-size 6
      ps-header-title-font-size 7)
(defun ps-enable-header ()
  (interactive)
  (setq ps-print-header t
	ps-header-offset 5)
  (message "Header enable"))
(defun ps-disable-header ()
  (interactive)
  (setq ps-print-header nil
	ps-header-offset 0)
  (message "Header disable"))
(defun ps-set-print-landscape ()
  "Enable printing on landscape"
  (interactive)
  (defvar ps-landscape-mode)
  (defvar ps-number-of-columns)
  (defvar ps-inter-column)
  (setq ps-landscape-mode t                                    ; Horizontal layout if =t ...
        ps-number-of-columns 2                                 ; ... and set number of colums ...
        ps-inter-column (/ 72 2.54)                            ; ... the distance between them (1 [cm])
        fill-column 77)
  (message "Use C-x h M-q before print in landscape"))
(defun ps-set-print-portrait ()
  "Enable printing on portrait"
  (interactive)
  (setq fill-column 96)
  (message "Use C-x h M-q before print in portrait"))
;; Backups
(setq make-backup-files nil)
(setq auto-save-list-file-name nil)
(setq auto-save-default nil)
;; Tex mode
(setq tex-dvi-view-command "emacsclient")
(add-hook 'latex-mode-hook 'orgtbl-mode)
(add-hook 'latex-mode-hook 'turn-on-reftex)                    ; with Emacs latex mode
(setq latex-run-command "pdflatex")
(setq tex-start-options "-synctex=1")
(defun tex-print (&optional alt)                               ; preview for PDF files, Is it works with lpr?
  "Print the .pdf file made by \\[tex-region], \\[tex-buffer] or \\[tex-file].
Runs the shell command defined by `tex-dvi-print-command'.  If prefix argument
is provided, use the alternative command, `tex-alt-dvi-print-command'."
  (interactive "P")
  (let ((print-file-name-dvi (tex-append tex-print-file ".pdf"))
	test-name)
    (if (and (not (equal (current-buffer) tex-last-buffer-texed))
	     (buffer-file-name)
	     ;; Check that this buffer's printed file is up to date.
	     (file-newer-than-file-p
	      (setq test-name (tex-append (buffer-file-name) ".pdf"))
	      (buffer-file-name)))
	(setq print-file-name-dvi test-name))
    (if (not (file-exists-p print-file-name-dvi))
        (error "No appropriate `.pdf' file could be found")
      (if (tex-shell-running)
          (tex-kill-job)
        (tex-start-shell))
      (tex-send-command
       (if alt tex-alt-dvi-print-command tex-dvi-print-command)
       print-file-name-dvi
       t))))
;; Doc-view mode
(add-hook 'doc-view-mode-hook 'auto-revert-mode)               ; I want to see always the last version
(setq doc-view-continuous t)                                   ; Continuous scrolling for DocView mode
(setq doc-view-resolution 300)                                 ; Resolution (dpi) of the image
(add-to-list 'auto-mode-alist '("[.]odt$" . doc-view-mode))
;; Speedbar
(speedbar-add-supported-extension '(".php" ".yml"))
;; Shell mode
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)
(add-hook 'term-mode-hook (lambda()
                (yas-minor-mode -1)))
(defadvice term-sentinel (around my-advice-term-sentinel (proc msg))
  (if (memq (process-status proc) '(signal exit))
      (let ((buffer (process-buffer proc)))
        ad-do-it
        (kill-buffer buffer))
    ad-do-it))
(ad-activate 'term-sentinel)
(add-hook 'term-mode-hook 'goto-address-mode)
;; Eshell
(setq eshell-visual-commands
      (append '("alsamixer"
		"mocp"
		"ncmpcpp"		
		"rtorrent"
		"ssh"
		"wicd-curses"
		"vlc"
		) eshell-visual-commands))
(setq eshell-buffer-maximum-lines 4096)
(setq eshell-buffer-name "eshell")
(setq eshell-term-name "xterm-256color")
(setq eshell-ls-initial-args (quote ("-h")))
(add-to-list 'eshell-preoutput-filter-functions
             #'eshell-did-you-mean-output-filter)
(defun host-name ()
  "Returns the name of the current host minus the domain."
  (let ((hostname (downcase (system-name))))
    (save-match-data
      (substring hostname (string-match "^[^.]+" hostname) (match-end 0)))))
(setq eshell-prompt-function                        ; Change the default eshell prompt
      (lambda ()
	(concat "┌─[" (format-time-string "%H:%M:%S" (current-time))
		"][" (eshell/whoami) "@" (host-name)
		"][" (eshell/pwd)
		"]\n└" (if (= (user-uid) 0) "# " "$ "))))
(setq eshell-prompt-regexp "^[^#$\n]*[#$] ")
;(setq eshell-prompt-regexp "^\(.\{2\}\[.+\]$\)\|^\(.[\$#]\) ")
(put 'eshell-prompt-face 'face-alias 'eshell-prompt) ; backward-compatibility alias
(setq eshell-cmpl-cycle-completions nil)
(setq eshell-save-history-on-exit t)
;; SQL Mode
(setq sql-postgres-options '("-P" "pager=off" "-w"))
(setq sql-postgres-login-params '((user :default "postgres")
				  (port :default 5432)
				  (server :default "localhost")
				  (database :default "postgres")))
;; Mouse options
(xterm-mouse-mode t)
(mwheel-install t)
;; Highlight matching parentheses. Very useful for coding.
(show-paren-mode t)
(setq show-paren-style 'mixed)
;; Autocomplete parentheses and brackets
(electric-pair-mode t)
;; Ibuffer
(defalias 'list-buffers 'ibuffer)
(setq ibuffer-show-empty-filter-groups nil)
(setq ibuffer-saved-filter-groups
      '(("Genomorro"
	 ("C/C++"
	  (mode . c-mode)
	  (mode . c++-mode))
	 ("Dired"
	  (mode . dired-mode))
	 ("Emacs Config"
	  (or
	   (filename . ".emacs.d/")))
	 ("Emacs"
	  (or
	   (mode . lisp-interaction-mode)
	   (mode . lisp-mode)
	   (mode . emacs-lisp-mode)
	   (name . "^\\*Calendar\\*$")
	   (name . "^\\*scratch\\*$")
	   (name . "^\\*Messages\\*$")
	   (name . "^\\*Compile-Log\\*$")
	   (name . "^\\*Completions\\*$")))
	 ("ERC"
	  (mode . erc-mode))
	 ("Gnus"
	  (or
	   (mode . message-mode)
	   (mode . bbdb-mode)
	   (mode . mail-mode)
	   (mode . gnus-group-mode)
	   (mode . gnus-summary-mode)
	   (mode . gnus-article-mode)
	   (name . "^\\.bbdb$")
	   (name . "^\\.newsrc-dribble")))
	 ("Help"
	  (or 
	   (mode . Man-mode)
	   (name . "\*Help\*")
	   (name . "\*Apropos\*")
	   (name . "\*info\*")))
	 ("Java"
	  (mode . java-mode))
	 ("JavaScript"
	  (mode . javascript-mode))
	 ("Latex"
	  (or
	   (mode . latex-mode)
	   (mode . bibtex-mode)
	   (name . "\*tex-shell\*")))
	 ("Org-mode"
	  (mode . org-mode))
	 ("Web Dev"
	  (or
	   (mode . html-mode)
	   (mode . css-mode)
	   (mode . php-mode)))
	)))
(add-hook 'ibuffer-mode-hook
	  (lambda ()
	    (ibuffer-switch-to-saved-filter-groups "Genomorro")))
;; Gnus settings
(setq gnus-init-file "~/.emacs.d/gnus/gnus.el")                     ;
(setq gnus-startup-file "~/.emacs.d/gnus/newsrc")                   ; By default all files ...
(setq gnus-agent-directory "~/.emacs.d/gnus/News/agent/")           ; ... and folders related ...
(setq gnus-directory "~/.emacs.d/gnus/News/")                       ; ... with Gnus are located ...
(setq gnus-kill-files-directory "~/.emacs.d/gnus/News/")            ; ... in $HOME, that's awful ...
(setq gnus-registry-cache-file "~/.emacs.d/gnus/gnus.registry.eld") ; ... I moved this files ... 
(setq mail-source-directory "~/.emacs.d/gnus/Mail/")                ; ... inside emacs folder
(setq auth-sources '("~/.emacs.d/gnus/.authinfo"                    ;
		     "~/.emacs.d/gnus/.authinfo.gpg"))
(setq gnus-asynchronous t)
(setq message-default-mail-headers "Bcc: \n")
(setq send-mail-function 'smtpmail-send-it)
(setq message-send-mail-function 'smtpmail-send-it)
(setq user-full-name "Edgar Uriel Domínguez Espinoza")              ; My full name in the e-mail
(setq user-mail-address "edgar_uriel84@genomorro.name")             ; Default e-mail
(setq smtpmail-smtp-server "smtp.mailbox.org")
(setq smtpmail-smtp-service 465)
(setq epa-file-cache-passphrase-for-symmetric-encryption t)
(setq smtpmail-stream-type 'tls)
;; BBDB
(bbdb-initialize 'gnus 'message)
(setq bbdb-default-country "México")
(setq bbdb-file "~/.emacs.d/bbdb")
(setq bbdb-north-american-phone-numbers-p nil)
;; Web Browser
(setq browse-url-browser-function 'eww-browse-url)                  ; Use eww as default browser
(setq browse-url-generic-program (executable-find "conkeror")
      shr-external-browser 'browse-url-generic)
(define-key eww-mode-map "r" 'eww-reload)
(define-key eww-mode-map "B" 'eww-back-url)
(define-key eww-mode-map "F" 'eww-forward-url)
(define-key eww-mode-map "\\" 'eww-view-source)
(define-key eww-mode-map "c0" 'eww-copy-page-url)
(define-key eww-mode-map "g" 'eww-list-bookmarks)
(define-key eww-mode-map "f" 'eww-lnum-follow)
(define-key eww-mode-map "\C-cf" 'eww-lnum-universal)
;; Org Mode
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-startup-indented t)
(setq org-hide-leading-stars t)
(setq org-log-done t)
(setq org-directory "~/Documentos/Agenda/")
(setq org-agenda-files (list "~/Documentos/Agenda/notes.org"
			     "~/Documentos/Agenda/gtd.org"
			     ))
(setq org-tag-alist '(("DATE" . ?d) ("FINALCIAL" . ?f) ("PASSWORDS" . ?p) ("BOOKS" . ?b) ("CINEMA" . ?c) 
		      ("ENTERTAINMENT" . ?e) ("IDEAS" . ?i) ("AGENDA" . ?a) ("WORK" . ?w) ("SCHOOL" . ?s)
		      ("MUSIC" . ?m) ("GROUP" . ?g)))
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "|" "DONE" "SOLVED" "CANCELED")))
;; MobileOrg
(setq org-mobile-directory "~/.emacs.d/mobile/")
(setq org-mobile-inbox-for-pull "~/Documentos/Agenda/notes.org")
(defvar org-mobile-push-timer nil
  "Timer that `org-mobile-push-timer' used to reschedule itself, or nil.")
(defun org-mobile-push-with-delay (secs)
  (when org-mobile-push-timer
    (cancel-timer org-mobile-push-timer))
  (setq org-mobile-push-timer
        (run-with-idle-timer
         (* 1 secs) nil 'org-mobile-push)))
(add-hook 'after-save-hook 
 (lambda () 
   (when (eq major-mode 'org-mode)
     (dolist (file (org-mobile-files-alist))
       (if (string= (expand-file-name (car file)) (buffer-file-name))
           (org-mobile-push-with-delay 30)))
   )))
(run-at-time "00:05" 86400 '(lambda () (org-mobile-push-with-delay 1))) ; refreshes agenda file each day
(org-mobile-pull)                                                       ; run org-mobile-pull at startup
(defun install-monitor (file secs)
  (run-with-timer
   0 secs
   (lambda (f p)
     (unless (< p (second (time-since (elt (file-attributes f) 5))))
       (org-mobile-pull)))
   file secs))
(install-monitor (file-truename
                  (concat
                   (file-name-as-directory org-mobile-directory)
                          org-mobile-capture-file))
                 5)
;; Do a pull every 5 minutes to circumvent problems with timestamping
;; (ie. dropbox bugs)
(run-with-timer 0 (* 5 60) 'org-mobile-pull)
;; Org-Capture
(setq org-default-notes-file "~/Documentos/Agenda/notes.org")
(define-key global-map "\C-cr" 'org-capture)
(setq org-footnote-section "Notas al Pie"                               ; Head created automatically for footnotes
      org-footnote-auto-adjust t)                                       ; Renumber autocatically footnotes
;; Org-Capture templates
(setq org-capture-templates
      '(("t" "todo" entry (file+headline (lambda () (concat org-directory "gtd.org")) "2017")
	 "* TODO %^{Brief Description} %^G\n%U\n\n%?")
	("n" "note" entry (file+headline (lambda () (concat org-directory "notes.org")) "2017")
	 "* %^{Title} %^G\n%U\n\n%?")
	))
;; Org-babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '(;; other Babel languages
   (plantuml . t)))
(setq org-plantuml-jar-path
      (expand-file-name "/usr/local/bin/plantuml.jar"))
;; puml-mode and Org
(add-to-list
  'org-src-lang-modes '("plantuml" . puml))
;; Dired Mode
(put 'dired-find-alternate-file 'disabled nil)
(setq dired-listing-switches "-lh --group-directories-first --time-style=+%c")
(setq dired-recursive-copies 'always)
(setq dired-dwim-target t)
;; Ido Mode
(ido-mode 'both)                                     ; for buffers and files
(setq ido-ignore-buffers                             ; ignore these guys
      '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido" "^\*trace"
	"^\*compilation" "^\*GTAGS" "^session\.*" "^\*")
      org-completion-use-ido t                       ; use it for completing stuff in Org
      ido-case-fold  t                               ; be case-insensitive
      ido-enable-last-directory-history t            ; remember last used dirs
      ido-max-work-directory-list 30                 ; should be enough
      ido-max-work-file-list      50                 ; remember many
      ido-use-filename-at-point nil                  ; don't use filename at point (annoying)
      ido-use-url-at-point nil                       ; don't use url at point (annoying)
      ido-enable-flex-matching nil                   ; don't try to be too smart
      ido-max-prospects 8                            ; don't spam my minibuffer
      ido-confirm-unique-completion t)               ; wait for RET, even with unique completion
(setq ido-work-directory-list (
      append '("~/"
	       "~/.emacs.d"
	       "~/Desktop"  
	       "~/Documentos"
	       "~/Documentos/Odas experimentales y escritos de un tipo que busca heroína/aiaa"
	       "~/Documentos/Odas experimentales y escritos de un tipo que busca heroína/jmlr"
	       "~/Latex"    
	       "~/workspace"
	       ) ido-work-directory-list))
;; when using ido, the confirmation is rather annoying...
(setq confirm-nonexistent-file-or-buffer nil)
;; Newsticker
(setq newsticker-html-renderer 'w3m-region)
(setq newsticker-treeview-treewindow-width 40)
(setq newsticker-treeview-listwindow-height 30)
(setq newsticker-url-list '(("Barrapunto" "http://barrapunto.com/article.pl?sid=12/12/11/1817215&from=rss" nil nil nil)
			    ("Cultura Libre" "http://manzanamecanica.org/podcast.xml" nil nil nil)
			    ("Diario de Programación" "http://blog.chuidiang.com/feed/" nil nil nil)
			    ("El blog de Jesús Amieiro" "http://feeds.feedburner.com/ElBlogDeJesusAmieiro" nil nil nil)
			    ("Kriptópolis" "http://www.kriptopolis.org/rss" nil nil nil)
			    ("La Cofradía Digital" "http://cofradia.org/feed/" nil nil nil)
			    ("Software Libre" "http://www.somoslibres.org/backend.php" nil nil nil)
			    ("DiarioSalud.net" "http://www.diariosalud.net/cache/rss20.xml" nil nil nil)
			    ("Medicina en Demedicina" "http://feeds.feedburner.com/demedicina" nil nil nil)
			    ("MedlinePlus" "http://www.nlm.nih.gov/medlineplus/feeds/whatsnew_es.xml" nil nil nil)
			    ("Al hilo del tiempo" "http://feeds.feedburner.com/imer/alhilodeltiempo" nil nil nil)
			    ("DIXO » Fernanda Tapia" "http://feeds.feedburner.com/dixo-fernanda-tapia" nil nil nil)))
(setq newsticker-url-list-defaults '(("Emacs Wiki" "http://www.emacswiki.org/cgi-bin/wiki.pl?action=rss" nil 3600)
				     ("slashdot" "http://slashdot.org/index.rss" nil 3600)))
(setq newsticker-automatically-mark-items-as-old nil)
(setq newsticker-retrieval-interval 86400)
(setq newsticker-wget-arguments '("--timeout=30" "-q" "-O" "-"))
;(newsticker-start)
;; ERC
(setq erc-echo-notices-in-minibuffer-flag t)
(setq erc-log-mode t
      erc-save-buffer-on-part nil
      erc-save-queries-on-quit nil
      erc-log-write-after-send t
      erc-log-write-after-insert t)
;;      erc-log-insert-log-on-open t)
(setq erc-server-history-list '("irc.freenode.net"))
(setq erc-server "irc.freenode.net"
      erc-port 6667
      erc-nick "genomorro"
      erc-email-userid "edgar_uriel84@genomorro.name")
(setq erc-autojoin-channels-alist '(("freenode.net" "#emacs-es" "#lidsol" "#gentoo-es" "#conkeror")))
(setq erc-button-url-regexp
      "\\([-a-zA-Z0-9_=!?#$@~`%&*+\\/:;,]+\\.\\)+[-a-zA-Z0-9_=!?#$@~`%&*+\\/:;,]*[-a-zA-Z0-9\\/]")
(setq erc-keywords '((".*Online" (:foreground "#604B8A"))
                     (".*Busy" (:foreground "#F0DFAF"))
                     (".*Away" (:foreground "#DFAF8F"))
                     (".*Idle" (:foreground "#94BFF3"))
		     (".*Offline" (:foreground "#DCA3A3"))
                     ))
(setq erc-log-channels-directory "~/.emacs.d/erc-logs/")
(defun erc-notify-on-msg (msg)
  "Send a message via notify-send if a message specifically to me"
  (if (or (string-match "genomorro:" msg)
	  (and (not (string-match "\\*\\*\\*" msg))
	       (not (string-match "\<root\>" msg))))
      (let ((nameless-msg (replace-regexp-in-string "^\<.*?\> " "" msg)))
	(start-process-shell-command "notify" nil "aplay ~/.emacs.d/sounds/ReceiveIM.wav"))))
(add-hook 'erc-insert-pre-hook 'erc-notify-on-msg)
;; Pop-ups
(defun popup (title msg &optional sound)
  "Show a popup if we're on X, or echo it otherwise; TITLE is the title
of the message, MSG is the context. Optionally, you can provide an ICON and
a sound to be played"
  (interactive)
  (when sound (shell-command
	       (concat "aplay " sound " 2> /dev/null")))
  (if (eq window-system 'x)
      (shell-command (concat "xmessage "
			     "-title " title " " msg))
    ;; text only version
    (message (concat title ": " msg))))
(add-hook 'gnus-notify-hook
	  (lambda()
	    (popup "GNUS" "You have new mail!")))
;; Re-open read-only files as root automatically
(defadvice find-file (around th-find-file activate)
  "Open FILENAME using tramp's sudo method if it's read-only."
  (if (and (not (file-writable-p (ad-get-arg 0)))
           (y-or-n-p (concat "File "
                             (ad-get-arg 0)
                             " is read-only.  Open it as root? ")))
      (find-file-sudo (ad-get-arg 0))
    ad-do-it))
(defun find-file-sudo (file)
  "Opens FILE with root privileges."
  (interactive "F")
  (set-buffer (find-file (concat "/sudo::" file))))
;; Byte-Compile init.el after save changes
(defun byte-compile-current-buffer ()
  "`byte-compile' current buffer if it's emacs-lisp-mode and compiled file exists."
  (interactive)
  (when (and (eq major-mode 'emacs-lisp-mode)
             (file-exists-p (byte-compile-dest-file buffer-file-name)))
    (byte-compile-file buffer-file-name)))
(add-hook 'after-save-hook 'byte-compile-current-buffer)
;; Key bindings
;; Playing with font sizes
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
;; Automatically Adjust Font Size When Frame Width Changes
(defun font-scale-on-frame-width ()
  (if (< (frame-width) 96)
      (text-scale-set -0.6)
    (text-scale-set 0)))
(add-hook 'window-configuration-change-hook 'font-scale-on-frame-width)
;; Automatic config
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(package-selected-packages
   (quote
    (markdown-mode yasnippet yaml-mode xresources-theme vline twig-mode puml-mode org org-plus-contrib php-mode pdf-tools pass multiple-cursors magit golden-ratio eww-lnum eshell-did-you-mean conkeror-minor-mode bbdb base16-theme auto-complete-pcmp apu ac-math ac-c-headers))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
