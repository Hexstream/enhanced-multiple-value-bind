(cl:defpackage #:enhanced-multiple-value-bind_tests
  (:use #:cl #:parachute)
  (:shadowing-import-from #:enhanced-multiple-value-bind #:multiple-value-bind)
  (:shadowing-import-from #:enhanced-eval-when #:eval-when))

(cl:in-package #:enhanced-multiple-value-bind_tests)

(eval-when t
  (defun process (form-to-expected-expansion form)
    `(is equal
         ',(funcall form-to-expected-expansion form)
         (macroexpand-1 ',form))))

(defmacro test-passthrough (form)
  (process (lambda (form)
             `(cl:multiple-value-bind ,@(cdr form)))
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
