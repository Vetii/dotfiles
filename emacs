(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(display-line-numbers (quote relative))
 '(frame-background-mode nil)
 '(package-selected-packages
   (quote
    (geiser helm racket-mode magit cider haskell-mode flycheck-julia julia-mode flycheck yasnippet lsp-ui company-lsp company lsp-mode htmlize slime evil ##)))
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
(add-hook 'prog-mode-hook 'company-mode)

(setq org-babel-clojure-backend 'cider)
(require 'cider)

;; Configuration to be able to run racket in org-mode
(setq scheme-program-name "/usr/bin/racket")
(add-hook 'scheme-mode-hook 'geiser-mode)
(setq geiser-default-implementation 'racket)

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
