(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(display-line-numbers (quote relative))
 '(frame-background-mode nil)
 '(lsp-clients-clangd-executable "clangd-6.0")
 '(org-src-preserve-indentation nil)
 '(package-selected-packages
   (quote
    (ivy geiser helm racket-mode magit cider haskell-mode flycheck-julia julia-mode flycheck yasnippet lsp-ui company-lsp company lsp-mode htmlize slime evil ##)))
 '(sentence-end-double-space nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

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
(add-hook 'lsp-mode-hook 'flycheck-mode) ;; For displaying error messages

;; Add lsp completion to company-mode
(require 'company-lsp)
(push 'company-lsp company-backends)
;; Configuration to be able to run racket in org-mode
(setq scheme-program-name "/usr/bin/racket")
(add-hook 'scheme-mode-hook 'geiser-mode)
(setq geiser-default-implementation 'racket)

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
(global-set-key (kbd "M-x") 'counsel-M-x)
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
   (clojure . t)
   (shell . t)
   (scheme . t)
   (haskell . t)))
   (dot . t)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#242424" :foreground "#f6f3e8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "PfEd" :family "Fira Code")))))
