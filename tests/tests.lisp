(cl:defpackage #:enhanced-multiple-value-bind_tests
  (:use #:cl #:parachute)
  (:shadowing-import-from #:enhanced-multiple-value-bind #:multiple-value-bind)
  (:shadowing-import-from #:enhanced-eval-when #:eval-when)
  (:import-from #:enhanced-multiple-value-bind #:multiple-value-&bind))

(cl:in-package #:enhanced-multiple-value-bind_tests)

(eval-when t
  (defun replace-first (new-first form)
    (check-type form cons)
    `(,new-first ,@(cdr form)))
  (defun process (form-to-expected-expansion form)
    (flet ((expand (form)
             `(is equal
                  (macroexpand-1 ',form)
                  ',(funcall form-to-expected-expansion form))))
      `(progn
         ,(expand form)
         ,(expand (replace-first 'multiple-value-&bind form))))))

(defmacro test-passthrough (form)
  (process (lambda (form)
             (replace-first 'cl:multiple-value-bind form))
           form))

(defmacro test-upgrade (form)
  (process (lambda (form)
             (destructuring-bind (lambda-list values-form &body body) (cdr form)
               `(multiple-value-call (lambda ,lambda-list
                                       ,@body)
                  ,values-form)))
           form))

(define-test "main"

  (test-passthrough (multiple-value-bind (a b c) (values 1 2 3)
                      (list a b c)))
  (test-passthrough (multiple-value-bind (a b c d e f) (values 1 2 3)
                      (list a b c d e f)))
  (test-passthrough (multiple-value-bind () (values 1 2 3)))
  (test-passthrough (multiple-value-bind (||) t ||))
  (test-upgrade (multiple-value-bind (a b &rest rest) (values 1 2 3)
                  (values a b rest)))
  (test-upgrade (multiple-value-bind (a b c &optional) (values 1 2 3 4)))
  (test-upgrade (multiple-value-bind (&rest ||) t ||)))
