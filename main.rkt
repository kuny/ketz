#lang racket/base

(module+ test
  (require rackunit))

;; Notice
;; To install (from within the package directory):
;;   $ raco pkg install
;; To install (once uploaded to pkgs.racket-lang.org):
;;   $ raco pkg install <<name>>
;; To uninstall:
;;   $ raco pkg remove <<name>>
;; To view documentation:
;;   $ raco docs <<name>>
;;
;; For your convenience, we have included LICENSE-MIT and LICENSE-APACHE files.
;; If you would prefer to use a different license, replace those files with the
;; desired license.
;;
;; Some users like to add a `private/` directory, place auxiliary files there,
;; and require them in `main.rkt`.
;;
;; See the current version of the racket style guide here:
;; http://docs.racket-lang.org/style/index.html

;; Code here


(require slideshow
         slideshow/pict)

(provide plemoljp
         helvetica
         h1 h2 h3 h4
         t
         vc vl vr
         hc ht hb
         tbox
         br sp
         -
         ketz
         ---
         img)

(define plemoljp "PlemolJPConsoleNF")

(define-syntax h1
  (syntax-rules ()
    [(h1 x)
     (text x plemoljp 60)]))

(define-syntax h2
  (syntax-rules ()
    [(h2 x)
     (text x plemoljp 50)]))

(define-syntax h3
  (syntax-rules ()
    [(h3 x)
     (text x plemoljp 40)]))

(define-syntax h4
  (syntax-rules ()
    [(h4 x)
     (text x plemoljp 30)]))

(define-syntax t+
  (syntax-rules ()
    [(f+ x)
     (text x plemoljp 24)]))

(define-syntax t
  (syntax-rules ()
    [(f x)
     (text x plemoljp 20)]))

(define-syntax t-
  (syntax-rules ()
    [(f- x)
     (text x plemoljp 14)]))



(define-syntax br
  (syntax-rules ()
    [(vspace x)
      (blank 0 x)]))

(define-syntax sp
  (syntax-rules ()
    [(hspace x)
      (blank x 0)]))


(define-syntax vc
  (syntax-rules ()
    [(vc x ...)
     (vc-append x ...)]))

(define-syntax vl
  (syntax-rules ()
    [(vl x ...)
     (vl-append x ...)]))

(define-syntax vr
  (syntax-rules ()
    [(vr x ...)
     (vr-append x ...)]))


(define-syntax hc
  (syntax-rules ()
    [(hc x ...)
     (hc-append x ...)]))

(define-syntax ht
  (syntax-rules ()
    [(ht x ...)
     (ht-append x ...)]))

(define-syntax hb
  (syntax-rules ()
    [(hb x ...)
     (hb-append x ...)]))

(define-syntax tbox
  (syntax-rules ()
    [(tbox x ...)
     (vl-append 
       (t x) ...)]))

(define-syntax -
  (syntax-rules ()
    [(- x)
     (item (t x))]))

(define-syntax ketz
  (syntax-rules (cover title name)
    [(ketz cover (title t)
                 (name c n))
     (slide
       (vc
         (vc
           (br 200)
             (h1 t)
             (h3 ""))
         (br 200)
         (hc
           (sp 400)
           (vl
             (t+ c)
             (t+ n)))))]

    [(ketz cover (title t s)
                 (name c n))
     (slide
       (vc
         (vc
           (br 200)
             (h1 t)
             (h3 s))
         (br 200)
         (hc
           (sp 400)
           (vl
             (t+ c)
             (t+ n)))))]

    [(ketz (title t) x ...)
     (slide
       #:title (h3 t)
       x ...)] 
    [(ketz x ...)
     (slide x ...)]))

(define-syntax ---
  (syntax-rules ()
    [(---)
     (filled-rectangle 800 1)]))

(define-syntax img
  (syntax-rules ()
    [(img path s)
     (scale (img path) s)]
    [(img path)
     (bitmap path)]))



(module+ test
  ;; Any code in this `test` submodule runs when this file is run using DrRacket
  ;; or with `raco test`. The code here does not run when this file is
  ;; required by another module.

  (check-equal? (+ 2 2) 4))

(module+ main
  ;; (Optional) main submodule. Put code here if you need it to be executed when
  ;; this file is run using DrRacket or the `racket` executable.  The code here
  ;; does not run when this file is required by another module. Documentation:
  ;; http://docs.racket-lang.org/guide/Module_Syntax.html#%28part._main-and-test%29

  (require racket/cmdline)
  (define who (box "world"))
  (command-line
    #:program "my-program"
    #:once-each
    [("-n" "--name") name "Who to say hello to" (set-box! who name)]
    #:args ()
    (printf "hello ~a~n" (unbox who))))
