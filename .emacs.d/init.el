(evil-mode t)
(global-company-mode t)
(global-flycheck-mode t)
(add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++11")))
(yas-global-mode t)

