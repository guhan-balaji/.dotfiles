;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "guhan-balaji"
      user-mail-address "guhanbalaji7@gmail.com")


;; vi escape with "jk" and "kj".
(setq evil-escape-unordered-key-sequence "jk")


;; Do not prompt confirmation when quitting emcas.
(setq confirm-kill-emacs nil)


;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "FantasqueSansMono Nerd Font Mono" :size 19)
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 18)
      doom-big-font (font-spec :family "Fira Code" :size 22))

(after!
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

(add-to-list 'default-frame-alist '(fullscreen . maximized))


;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-monokai-pro)


;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(use-package! org
  :config
  (setq org-directory "~/org/"
        org-log-done 'note
        org-log-done-with-time t
        org-hide-emphasis-markers t)
  (add-to-list 'org-modules 'ol-info))

(use-package! org-pandoc-import :after org)


;; Wiriteroom (zen mode) settings
(setq +zen-text-scale 1)


;; Tabs (centaur tabs)
 (use-package centaur-tabs
   :load-path "~/.emacs.d/other/centaur-tabs"
   :config
   (setq centaur-tabs-style "rounded"
         centaur-tabs-height 32
         centaur-tabs-set-icons t
         centaur-tabs-set-modified-marker t
         centaur-tabs-modified-marker "●"
         centaur-tabs-set-bar 'under
         x-underline-at-descent-line t)
   (centaur-tabs-headline-match)
   ;; (setq centaur-tabs-gray-out-icons 'buffer)
   ;; (centaur-tabs-enable-buffer-reordering)
   ;; (setq centaur-tabs-adjust-buffer-order t)
   (centaur-tabs-mode t)
   (setq uniquify-separator "/")
   (setq uniquify-buffer-name-style 'forward)
   (defun centaur-tabs-buffer-groups ()
     "`centaur-tabs-buffer-groups' control buffers' group rules.

 Group centaur-tabs with mode if buffer is derived from `eshell-mode' `emacs-lisp-mode' `dired-mode' `org-mode' `magit-mode'.
 All buffer name start with * will group to \"Emacs\".
 Other buffer group by `centaur-tabs-get-group-name' with project name."
     (list
      (cond
       ;; ((not (eq (file-remote-p (buffer-file-name)) nil))
       ;; "Remote")
       ((or (string-equal "*" (substring (buffer-name) 0 1))
            (memq major-mode '(magit-process-mode
                               magit-status-mode
                               magit-diff-mode
                               magit-log-mode
                               magit-file-mode
                               magit-blob-mode
                               magit-blame-mode
                               )))
        "Emacs")
       ((derived-mode-p 'prog-mode)
        "Editing")
       ((derived-mode-p 'dired-mode)
        "Dired")
       ((memq major-mode '(helpful-mode
                           help-mode))
        "Help")
       ((memq major-mode '(org-mode
                           org-agenda-clockreport-mode
                           org-src-mode
                           org-agenda-mode
                           org-beamer-mode
                           org-indent-mode
                           org-bullets-mode
                           org-cdlatex-mode
                           org-agenda-log-mode
                            diary-mode))
        "OrgMode")
       (t
        (centaur-tabs-get-group-name (current-buffer))))))
   :hook
   (dashboard-mode . centaur-tabs-local-mode)
   (term-mode . centaur-tabs-local-mode)
   (calendar-mode . centaur-tabs-local-mode)
   (org-agenda-mode . centaur-tabs-local-mode)
   (helpful-mode . centaur-tabs-local-mode)
   :bind
   ("C-<prior>" . centaur-tabs-backward)
   ("C-<next>" . centaur-tabs-forward)
   ("C-c t s" . centaur-tabs-counsel-switch-group)
   ("C-c t p" . centaur-tabs-group-by-projectile-project)
   ("C-c t g" . centaur-tabs-group-buffer-groups)
   (:map evil-normal-state-map
    ("g t" . centaur-tabs-forward)
    ("g T" . centaur-tabs-backward)))

;; Projectile
(setq projectile-project-search-path '("~/Projects/"))


;; Deft
(use-package! deft
  :bind ("<f8>" . deft)
  :commands deft
  :config
(setq default-directory "~/notes"
      deft-recursive t
      deft-use-filename-as-title t
      deft-use-filter-string-for-filename t
      deft-file-naming-rules '((noslash . "-")
                               (nospace . "-")
                               (case-fn . downcase))))
