;; --  my custom keys
(defun math-keys-help ()
  (message "Keys Engage!")

  ;;move
  ;;(define-key global-map  [\M-up] 'scroll-down)
  ;;(define-key global-map  [\M-down] 'scroll-up)
  (define-key global-map  [\M-up] 'scroll-down-half)
  (define-key global-map  [\M-down] 'scroll-up-half)
  (global-set-key [next] 'scroll-up-half)
  (global-set-key [prior] 'scroll-down-half)
  ;;coding
  (global-set-key "\C-cbs" 'weblogger-start-entry)
  (global-set-key (kbd "C-S-x") 'zencoding-expand-line)
  (global-set-key (kbd "S-SPC") 'auto-complete)
  (global-set-key (kbd "C-S-SPC") 'ido-goto-symbol)
  (global-set-key (kbd "C-~") 'drupal-search-documentation)
  (global-set-key (kbd "C-`") 'php-search-documentation)
  (global-set-key (kbd "C-S-n") 'nav)
  (global-set-key (kbd "C-{") 'my-comment-dwim)
  ;;basic
  (global-set-key (kbd "<escape>") 'keyboard-escape-quit)
  (global-set-key (kbd "RET") 'newline-and-indent)
  (global-set-key (kbd "C-S-o") 'ifind-mode)
  (global-set-key (kbd "C-o") 'find-file)
  (global-set-key (kbd "C-s") 'save-buffer)
  (global-set-key (kbd "C-S-s") 'rename-file-and-buffer)
  (global-set-key (kbd "C-S-g") 'google)
  (global-set-key (kbd "C-a") 'mark-whole-buffer)
  (global-set-key (kbd "C-f") 'isearch-forward)
  (global-set-key (kbd "C-y") 'undo-tree-redo)
  (global-set-key (kbd "C-S-f") 'query-replace)
  (global-set-key (kbd "C-S-v") 'browse-kill-ring)
  ;;windowing
  (define-key global-map  [\C-left] 'previous-buffer)
  (define-key global-map  [\C-right] 'next-buffer)
  (global-set-key (kbd "<C-tab>") 'next-multiframe-window)
  (global-set-key (kbd "<C-S-tab>") 'previous-multiframe-window)
  (global-set-key (kbd "C-SPC") 'switch-to-buffer)
  (global-set-key (kbd "C-n") 'switch-to-buffer)
  (global-set-key (kbd "C-0") 'kill-buffer)
  ;;functions
  (global-set-key (kbd "<f1>") 'bm-toggle)
  (global-set-key (kbd "<f2>") 'bm-next)
  (global-set-key (kbd "<f3>") 'bm-previous)
  (global-set-key (kbd "<f4>") 'shell-here)
  (global-set-key (kbd "<f5>") 'toggle-windows-split)
  (global-set-key (kbd "<f6>") 'hsplit-window-switch-buffer)
  (global-set-key (kbd "<f7>") 'split-window-switch-buffer)
  (global-set-key (kbd "<f8>") 'delete-window)
  (global-set-key (kbd "<f9>") 'enlarge-window-horizontally)
  (global-set-key (kbd "<f10>") 'enlarge-window)
  (global-set-key (kbd "<f11>") 'tortoise-svn-commit)
  (global-set-key (kbd "<f12>") 'tortoise-svn-log)
  (global-set-key (kbd "<S-f11>") 'tortoise-git-commit)
  (global-set-key (kbd "<S-f12>") 'tortoise-git-log)
  (global-set-key (kbd "<C-S-f11>") 'tortoise-svn-commit-repository)
  (global-set-key (kbd "<C-S-f12>") 'tortoise-svn-log-repository)
  (define-key ctl-x-map (kbd "<f11>") 'tortoise-git-commit-repository)
  (define-key ctl-x-map (kbd "<f12>") 'tortoise-git-log-repository)
  ;;(global-set-key (kbd "C-x <f11>") 'tortoise-git-commit-repository)
  ;;(global-set-key (kbd "C-x <f12>") 'tortoise-git-log-repository)
  ;;misc
  (global-set-key (kbd "C-z") 'undo-tree-undo)
  (global-set-key (kbd "C-S-z") 'undo-tree-visualize)
  (define-key ctl-x-map "C" 'see-you-again)
  (custom-set-variables
  	'(cua-mode t nil (cua-base))))

;; -- improve isearch
(defun windows-isearch-hook ()
  (define-key isearch-mode-map (kbd "C-f") 'isearch-repeat-forward)
  (define-key isearch-mode-map (kbd "RET") 'isearch-repeat-forward)
  (define-key isearch-mode-map (kbd "<escape>") 'isearch-exit)
  (define-key isearch-mode-map (kbd "C-S-f") 'isearch-repeat-backward)
  (define-key isearch-mode-map (kbd "C-v") 'isearch-yank-kill)
  (define-key isearch-mode-map (kbd "<up>") 'isearch-ring-retreat)
  (define-key isearch-mode-map (kbd "<down>") 'isearch-ring-advance))
(add-hook 'isearch-mode-hook 'windows-isearch-hook)

;; -- hooks for nice indenting keys
(add-hook 'find-file-hooks (function (lambda ()
 (unless (eq major-mode 'org-mode)
(local-set-key (kbd "<tab>") 'indent-or-complete)))))

(if (not (eq  major-mode 'org-mode))
    (progn
      (define-key global-map "\t" 'indent-or-complete)
      (define-key global-map [S-tab] 'my-unindent)
      (define-key global-map [C-S-tab] 'my-unindent)))
