;; http://groups.google.com/group/gnu.emacs.gnus/browse_thread/thread/a673a74356e7141f

;; Set default mail account
(require 'nnir)
(setq gnus-select-method '(nnimap "GMX"
      (nnimap-address "imap.gmx.com")
      (nnimap-stream ssl)
      (nnir-search-engine imap)))

;; Set secondary accounts
(setq gnus-secondary-select-methods
      '((nnimap "Yahoo"
                (nnimap-address "imap.mail.yahoo.com")
                (nnir-search-engine imap))
        (nnimap "Mailoo"
                (nnimap-address "imaps.mailoo.org")
                (nnir-search-engine imap))
        (nnimap "iTelcel"
                (nnimap-address "imap.itelcel.com")
		(nnimap-stream network)
                (nnir-search-engine imap))
        (nnimap "Gmail"
                (nnimap-address "imap.gmail.com")
                (nnir-search-engine imap))
        (nnimap "OpenMailBox"
                (nnimap-address "imap.openmailbox.org")
                (nnir-search-engine imap))))

;; Set multiple SMTP accounts
(setq gnus-parameters
      '((".*"
	 (posting-style
	  (eval	(setq gnus-message-archive-group "Sent"))
	  (eval	(setq gnus-message-archive-method '(nnimap "GMX")))
	  ))
	("nnimap\\+GMX:.*"
	 (posting-style
	  (eval	(setq gnus-message-archive-group "Sent"))
	  (eval (setq gnus-message-archive-method '(nnimap "GMX")))
	  ))
	("nnimap\\+Yahoo:.*"
	 (posting-style
	  (address "@yahoo.com.mx")
	  (eval (setq smtpmail-smtp-server "smtp.mail.yahoo.com"))
	  (eval	(setq gnus-message-archive-group "nnimap+Yahoo:Sent"))
	  (eval	(setq gnus-message-archive-method '(nnimap "Yahoo")))
	  ))
	("nnimap\\+Mailoo:.*"
	 (posting-style
	  (address "@mailoo.org")
	  (eval (setq smtpmail-smtp-server "smtp.mailoo.org"))
	  (eval	(setq gnus-message-archive-group "nnimap+Mailoo:Sent"))
	  (eval	(setq gnus-message-archive-method '(nnimap "Mailoo")))
	  ))
	("nnimap\\+iTelcel:.*"
	 (posting-style
	  (address "@itelcel.com")
	  (eval (setq smtpmail-smtp-server "smtp.itelcel.com"))
	  (eval	(setq gnus-message-archive-group "nnimap+iTelcel:Sent"))
	  (eval	(setq gnus-message-archive-method '(nnimap "iTelcel")))
	  ))
	("nnimap\\+Gmail:.*"
	 (posting-style
	  (address "@gmail.com")
	  (eval (setq smtpmail-smtp-server "smtp.gmail.com"))
	  (eval	(setq gnus-message-archive-group "nnimap+Gmail:[Gmail]/Sent Mail"))
	  (eval (setq gnus-message-archive-method '(nnimap "Gmail")))
	  ))
	("nnimap\\+OpenMailBox:.*"
	 (posting-style
	  (address "@openmailbox.org")
	  (eval (setq smtpmail-smtp-server "smtp.openmailbox.org"))
	  (eval	(setq gnus-message-archive-group "nnimap+OpenMailBox:Sent"))
	  (eval (setq gnus-message-archive-method '(nnimap "OpenMailBox")))
	  ))
	)
)

(setq gnus-visible-headers
      '("^From:" "^Subject:" "^To:" "^Cc:" "Bcc:" "^Resent-To:" "^Message-ID:"
        "^Date:" "^Newsgroups:" "^Organization:" "Followup-To:"
        "Reply-To:" "^X-Newsreader:" "^X-Mailer:"
        "^X-Spam-Level:" "^List-Id:"))

;; All mails should be always displayed in the mailbox
(setq gnus-permanently-visible-groups ".*")
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
(setq gnus-treat-buttonize t)

(setq gnus-summary-display-arrow t)
(setq gnus-summary-thread-gathering-function 'gnus-gather-threads-by-references)

;; Summary line format strings
(setq gnus-summary-line-format  "%U%R%z %((%4,4k)  %&user-date;  %-32,32f %* %B%S%)\n"
      gnus-user-date-format-alist '((t . "%d.%m.%y %H:%M"))
      gnus-sum-thread-tree-indent          "  "
      gnus-sum-thread-tree-root            "● "
      gnus-sum-thread-tree-false-root      "◎ "
      gnus-sum-thread-tree-single-indent   "→ "
      gnus-sum-thread-tree-vertical        "│"
      gnus-sum-thread-tree-leaf-with-other "├─► "
      gnus-sum-thread-tree-single-leaf     "└─► ")

;; Dealing with some mimetypes
(setq mailcap-mime-data
      '(("application"
	 ("pdf"
	  (viewer . "emacsclient %s")
	  (type . "application/pdf")
	  (test . window-system)
	  ("print" . ,(concat "pdf2ps %s - | " mailcap-print-command)))
	 )))
