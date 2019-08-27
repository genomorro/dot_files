;; http://groups.google.com/group/gnu.emacs.gnus/browse_thread/thread/a673a74356e7141f

;; Set default mail account
(require 'nnir)
(setq gnus-select-method '(nnimap "Genomorro"
      (nnimap-address "mail.mailo.com")
      (nnimap-stream ssl)
      (nnir-search-engine imap)))

;; Set secondary accounts
(setq gnus-secondary-select-methods
      '((nnimap "Mailoo"
                (nnimap-address "imaps.mailoo.org")
                (nnir-search-engine imap))
        (nnimap "Gmail"
                (nnimap-address "imap.gmail.com")
                (nnir-search-engine imap))))

;; Set multiple SMTP accounts
(setq gnus-parameters
      '((".*"
	 (posting-style
	  (eval (setq smtpmail-smtp-server "mail.net-c.com"))
	  (eval	(setq gnus-message-archive-group "sent"))
	  (eval	(setq gnus-message-archive-method '(nnimap "Genomorro")))
	  ))
	("nnimap\\+Mailoo:.*"
	 (posting-style
	  (address "edgar_uriel84@mailoo.org")
	  (eval (setq smtpmail-smtp-server "smtps.mailoo.org"))
	  (eval	(setq gnus-message-archive-group "nnimap+Mailoo:Sent"))
	  (eval	(setq gnus-message-archive-method '(nnimap "Mailoo")))
	  ))
	("nnimap\\+Gmail:.*"
	 (posting-style
	  (address "apesta.gogle@gmail.com")
	  (eval (setq smtpmail-smtp-server "smtp.gmail.com"))
	  (eval	(setq gnus-message-archive-group "nnimap+Gmail:[Gmail]/Sent Mail"))
	  (eval (setq gnus-message-archive-method '(nnimap "Gmail")))
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
