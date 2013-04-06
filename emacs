;; ensure el-get is installed
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t) 
  (url-retrieve 
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el" 
   (lambda (s) 
     (let (el-get-master-branch)
     (goto-char (point-max))
     (eval-print-last-sexp)))))
(require 'el-get)

;; set up custom el-get sources
(setq el-get-sources
      '((:name magit
	       :after (progn
			(global-set-key (kbd "C-x C-z") 'magit-status)))
	(:name smex
	       :after (progn
			(global-set-key 
			 [(meta x)] 
			 (lambda ()
			   (interactive)
			   (or (boundp 'smex-cache)
			       (smex-initialize))
			   (global-set-key [(meta x)] 'smex)
			   (smex)))
			
			(global-set-key
			 [(shift meta x)]
			 (lambda ()
			   (interactive)
			   (or (boundp 'smex-cache)
			       (smex-initialize))
			   (global-set-key [(shift meta x)] 
					   'smex-major-mode-commands)
			   (smex-major-mode-commands)))))
	(:name auto-complete
	       :after (progn
			(require 'auto-complete-config)
			(ac-config-default)))
        (:name ace-jump-mode
	       :after (progn
			(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)))
	(:name js2-mode
	       :after (progn
			(setq-default js2-basic-offset 2)))))

(setq my-packages 
      (append 
       '(clojure-mode ruby-mode haml-mode 
	 paredit yari nrepl helm)
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)
(el-get 'wait)

;; backup temp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; move around windows
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

;; handy and not so handy modes
;(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(ido-mode +1)
(show-paren-mode +1)
(global-linum-mode +1)
(column-number-mode +1)
(size-indication-mode +1)
(blink-cursor-mode -1)
(setq inhibit-splash-screen +1)
(setq visible-bell +1)
(setq linum-format "%d ")

;; access international keys with right option
(setq ns-right-alternate-modifier 'none)

;; run as a server
(server-start)

;; haml-mode stuff
(add-hook 'haml-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (define-key haml-mode-map "\C-m" 'newline-and-indent)))

;; set zenburn
(add-to-list 'custom-theme-load-path "~/.emacs-themes/")
(load-theme 'zenburn t)

;; and set some face attributes
(set-default-font "Inconsolata-16")

;; OSX pbcopy/pbpaste integration
(setq pb-remote-host nil)
 
(defun set-pb-remote-host (host)
  (interactive "s")
  (setq pb-remote-host host))

(defun pbcopy-region (start end)
  (interactive "r")
  (if (region-active-p)
      (progn 
	(shell-command-on-region start end "pbcopy")
	(setq mark-active nil))))

(defun pbpaste-insert ()
  (interactive)
  (insert (shell-command-to-string "pbpaste")))

(defun pbcopy-remote-region (start end)
  (interactive "r")
  (if (region-active-p)
      (progn
	(shell-command-on-region start end (concat "ssh " pb-remote-host " pbcopy"))
	(setq mark-active nil))))

(defun pbpaste-remote-insert ()
  (interactive)
  (insert (shell-command-to-string (concat "ssh " host " pbpaste"))))

;; Move lines up and down
(defun move-line-down ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines 1))
    (forward-line)
    (move-to-column col)))

(defun move-line-up ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines -1))
    (move-to-column col)))

(global-set-key (kbd "M-[ B") 'move-line-down)
(global-set-key (kbd "M-[ a") 'move-line-up)

;; Make new lines above or below
(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))

(global-set-key (kbd "<C-return>") 'open-line-below)
(global-set-key (kbd "<C-S-return>") 'open-line-above)

;; Set a key for the buffer menu without using C-b since
;; that is taken by tmux.
(global-set-key (kbd "C-x M-b") 'buffer-menu)

;; Set location of org mode todo files
(defun read-lines (file-path)
  (with-temp-buffer
    (insert-file-contents file-path)
    (split-string (buffer-string) "\n" t)))

(setq org-agenda-files (read-lines "~/org-files/agenda"))

;; Set up easy access to a bunch of common views
(global-set-key (kbd "<f1>") 'org-agenda)
(global-set-key (kbd "<f2>") 'dired)
(global-set-key (kbd "<f3>") 'magit-status)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/org-files/projects/crmds.org" "~/org-files/projects/smallpub.org" "~/org-files/projects/conneg.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
