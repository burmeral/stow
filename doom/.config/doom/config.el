
;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Startup banner
(setq fancy-splash-image "~/Pictures/bunnies.png")

(after! doom-dashboard
  (setq +doom-dashboard-functions
    '(+doom-dashboard-widget-banner
      +doom-dashboard-widget-shortmenu
      +doom-dashboard-widget-loaded))

  (add-hook! '+doom-dashboard-mode-hook
    (goto-char (point-min))
    (re-search-forward "\n\n" nil t)
    (insert (propertize "おかえり、ram\n\n"
                        'face '(:height 1.2 :foreground "#FFB4A5")))))

(setq +doom-dashboard-menu-sections
  '(("Open today's log"
     :icon (nerd-icons-faicon "nf-fa-calendar" :face 'doom-dashboard-menu-title)
     :action my/open-daily)
    ("Due dates"
     :icon (nerd-icons-faicon "nf-fa-clock_o" :face 'doom-dashboard-menu-title)
     :action (lambda () (find-file "~/Org/due.org")))
    ("Agenda"
     :icon (nerd-icons-faicon "nf-fa-list" :face 'doom-dashboard-menu-title)
     :action org-agenda)
    ("Open project"
     :icon (nerd-icons-faicon "nf-fa-folder" :face 'doom-dashboard-menu-title)
     :action projectile-switch-project)))

;; Inline display
(after! org
  (setq org-startup-with-inline-images t)
  (setq org-image-actual-width '(400)))  ; max width in pixels

(after! org
  ;; Heading sizes
  (custom-set-faces!
    '(org-level-1 :height 1.4 :weight bold :foreground "#FFB4A5")
    '(org-level-2 :height 1.2 :weight bold :foreground "#F3BA9C")
    '(org-level-3 :height 1.1 :foreground "#F7BB7E")
    '(org-document-title :height 1.6 :weight bold)
    '(org-table :foreground "#DCC0BB")
    '(org-todo :foreground "#BA1B00" :weight bold)
    '(org-done :foreground "#80543C" :strike-through t))

  ;; Hide markup symbols
  (setq org-hide-emphasis-markers t)

  ;; Better bullets
  (setq org-superstar-headline-bullets-list '("◉" "○" "✸" ".")))

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:

;;(setq doom-theme 'doom-one)

;; Matugen - Material you themeing

(add-to-list 'custom-theme-load-path "~/.config/doom/")

(when (file-exists-p "~/.config/doom/matugen-theme.el")
  (load-theme 'matugen t))

(defun my/reload-matugen-theme ()
  (load-file "~/.config/doom/matugen-theme.el")
  (load-theme 'matugen t))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!

;; Org directory
(setq org-directory "~/Org/")

;; Better agenda view
(setq org-agenda-span 'week
      org-agenda-start-on-weekday 1)

;; Warn X days before deadline
(setq org-deadline-warning-days 3)

;; Loads binds
(after! org-agenda
  (setq org-agenda-custom-commands
    '(("u" "Urgent — next 3 days"
       agenda ""
       ((org-agenda-span 3)
        (org-agenda-entry-types '(:deadline :scheduled))
        (org-deadline-warning-days 3)
        (org-agenda-sorting-strategy '(deadline-up priority-down))))
      ("w" "Major deadlines — next 14 days"
       tags-todo "+major|+exam"
       ((org-agenda-span 14)
        (org-deadline-warning-days 14))))))

;; Org binds
(map! :leader
      :desc "Org capture" "o c" #'org-capture
      :desc "Org agenda"  "o a" #'org-agenda
      :desc "Org agenda urgent" "o u"
        (lambda () (interactive) (org-agenda nil "u")))

(defun my/open-daily ()
  "Open or create today's daily org file."
  (interactive)
  (let ((file (format-time-string "~/Org/daily/%Y-%m-%d.org")))
    (if (file-exists-p file)
        (find-file file)
      (org-capture nil "d"))))

(map! :leader
      :desc "Open daily" "o d" #'my/open-daily)

;; Capture templates
(after! org-capture
  (setq org-capture-templates
    '(("d" "Daily" plain
       (file (lambda ()
               (let ((name (format-time-string "~/Org/daily/%Y-%m-%d.org")))
                 (unless (file-exists-p name)
                   (copy-file "~/Org/templates/daily-template.org" name))
                 name)))
       ""
       :immediate-finish t
       :jump-to-captured t)

      ("D" "Due date" entry
       (file+olp "~/Org/due.org" "Active")
       (file "~/Org/templates/due-template.org"))

      ("e" "Env/Code" entry
       (file+headline "~/Org/env.org" "Scratch")
       "* %^{Title}\n#+BEGIN_SRC %^{Language|python|c|bash} :results output\n%?\n#+END_SRC")

      ("t" "Quick task" entry
       (file+headline "~/Org/due.org" "Inbox")
       "* TODO %?\n  %U"))))

(setq org-agenda-files
  (append '("~/Org/due.org" "~/Org/env.org")
          (directory-files-recursively "~/Org/daily/" "\\.org$")))

;; Advance deadline reminder hook
(setq org-agenda-custom-commands
  '(("u" "Urgent — next 3 days"
     agenda ""
     ((org-agenda-span 3)
      (org-agenda-entry-types '(:deadline :scheduled))
      (org-deadline-warning-days 3)
      (org-agenda-sorting-strategy '(deadline-up priority-down))))

    ("w" "Major deadlines — next 14 days"
     tags-todo "+major|+exam"
     ((org-agenda-span 14)
      (org-deadline-warning-days 14)))))


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `with-eval-after-load' block, otherwise Doom's defaults may override your
;; settings. E.g.
;;
;;   (with-eval-after-load 'PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look them up).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;

;; Live code
(after! org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)
     (C . t)
     (latex . t)
     (shell . t))))

;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
