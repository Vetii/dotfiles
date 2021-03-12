(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(wombat))
 '(display-line-numbers 'relative)
 '(explicit-shell-file-name "/bin/bash")
 '(frame-background-mode nil)
 '(haskell-interactive-popup-errors nil)
 '(indent-tabs-mode nil)
 '(lsp-clients-clangd-executable "clangd-6.0")
 '(org-format-latex-options
   '(:foreground default :background default :scale 1.5 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
                 ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(org-src-preserve-indentation nil)
 '(package-selected-packages
   (quote
    (ivy helm racket-mode vala-mode yasnippet-classic-snippets evil-magit magit yasnippet-snippets flycheck yasnippet lsp-ui company-lsp company lsp-mode htmlize slime evil ##)))
 '(sentence-end-double-space nil))

;; Evil mode
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Activate evil-mode
(require 'evil)
(evil-mode 1)

;; Snippets
(require 'yasnippet)
(add-hook 'lsp-mode-hook #'yas-minor-mode)
(yas-global-mode 1)

;; LSP Mode
(require 'lsp-mode)
(add-hook 'prog-mode-hook #'lsp)
;; LSP Mode: Add UI (Better hovering and stuff)
(require 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
;; (add-hook 'lsp-mode-hook 'flycheck-mode) ;; For displaying error messages

;; Add lsp completion to company-mode
(require 'company-lsp)
(push 'company-lsp company-backends)
; (add-hook 'after-init-hook 'global-company-mode)
; (global-set-key [C-tab] 'company-complete)

;; Automatic cleanup of whitespace when saving files.
(add-hook 'before-save-hook 'whitespace-cleanup)

;; IVY mode, for better completions and stuff.
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
; (global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

;; BABEL: Executing source code
;; Inside org documents
;; This selects which language to load
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (shell . t)
   (dot . t)))

;; Use the python3 for python code blocs
(setq org-babel-python-command "python3")
(setq python-shell-interpreter "/usr/bin/python3")

;; Make sure org-mode exports with minted
(setq org-latex-listings 'minted
      org-latex-packages-alist '(("" "minted"))
      org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;; Change some syntax tables, so that my_var is ONE word and not two words.
(add-hook 'python-mode-hook (lambda () (modify-syntax-entry ?_ "w")))
(add-hook 'java-mode-hook (lambda () (modify-syntax-entry ?_ "w")))
; (modify-syntax-entry ?_ "w" python-mode-syntax-table)
; (modify-syntax-entry ?_ "w" java-mode-syntax-table)

;; Include some plugins into org-mode
(eval-after-load "org"
                 '(require 'ox-md nil t))

;; Enable column mode
(setq column-number-mode t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#242424" :foreground "#f6f3e8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "PfEd" :family "Fira Code")))))
