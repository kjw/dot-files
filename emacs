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
(ido-mode +1)
(show-paren-mode +1)
(global-linum-mode +1)
(column-number-mode +1)
(size-indication-mode +1)
;(scroll-bar-mode -1)
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

