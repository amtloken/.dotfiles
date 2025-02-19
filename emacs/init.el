;; Init file facilitating loading of ORG-mode Emacs config.
;; Copyright (C) 2025 Arne Magnus Tveita Løken
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Pulic License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <https://www.gnu.org/licenses/>.

;; Tangle org file if needed
(let* ((default-directory user-emacs-directory)
       (org-file "configuration.org")
       (el-file "configuration.el")
       (changed-at (file-attribute-modification-time (file-attributes org-file))))
  (require 'org-macs)
  (unless (org-file-newer-than-p el-file changed-at)
    (require 'ob-tangle)
    (org-babel-tangle-file org-file el-file "emacs-lisp"))
  (load-file el-file))
