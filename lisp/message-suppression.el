;; message-suppression.el
;; a quick hack by Aaron (me@aaron-miller.me), 2013-11-12
;; half a solution for http://superuser.com/questions/669701/emacs-disable-some-minibuffer-messages
;; NB this does nothing until you 
;; M-x customize-group RET message-suppression RET
;; and adjust to taste

(defgroup message-suppression nil
  "Customization options for selective message suppression."
  :prefix "message-suppression")

(defcustom message-suppression-enabled nil
  "Whether or not to suppress messages listed in
`message-suppress-these'."
  :group 'message-suppression
  :tag "Suppress some messages?"
  :type '(choice (const :tag "No" nil)
                 (const :tag "Yes" t)))

(defcustom message-suppression-to-messages-buffer t
  "Whether or not to insert messages suppressed from the
minibuffer into the *Messages* buffer."
  :group 'message-suppression
  :tag "Insert suppressed messages into *Messages* buffer?"
  :type '(choice (const :tag "No" nil)
                 (const :tag "Yes" t)))

(defcustom message-suppression-these nil
  "A list of messages which the `message-except-these' advice
should suppress from being echoed in the minibuffer. Messages
are matched by `member', i.e., only exact strings match.

NB! Per the Emacs manual, calls from C code to primitives (such
as `message') ignore advice entirely, which means some messages
cannot be suppressed by this mechanism. ('Advising
Functions' in the Emacs Lisp Reference Manual, q.v.)"
  :group 'message-suppression
  :tag "Messages to suppress"
  :type '(repeat (string))
  :link '(info-link "(elisp)Advising Functions"))

(defadvice message (around message-suppress-advice)
  "Suppress messages listed in `message-suppress-these' from being
  echoed in the minibuffer."
  (let ((message-string nil)
        (current-buffer nil))
    (if (and message-suppression-enabled
             (length (ad-get-args 0))
             (stringp (car (ad-get-args 0)))
             ;; message-string doesn't get set until here because `format'
             ;; will complain if its first argument isn't a string
             (setq message-string (apply 'format (ad-get-args 0)))
             (member message-string
                     message-suppression-these))
        ;; we won't call `message', but we might echo to *Messages*
        (and message-suppression-to-messages-buffer
             (progn
               (setq current-buffer (current-buffer))
               (switch-to-buffer (get-buffer-create "*Messages*"))
               (goto-char (point-max))
               (insert (make-string 1 10))
               (insert message-string)
               (switch-to-buffer current-buffer)))
      ad-do-it)))

(ad-activate 'message)
