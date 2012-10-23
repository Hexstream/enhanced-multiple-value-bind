(in-package #:enhanced-multiple-value-bind)

(defun %expand (lambda-list values-form body)
  (if (member-if (lambda (symbol)
                   (let ((name (symbol-name symbol)))
                     (and (plusp (length name))
                          (char= (char name 0) #\&))))
                 lambda-list)
      `(multiple-value-call (lambda ,lambda-list ,@body) ,values-form)
      `(cl:multiple-value-bind ,lambda-list ,values-form ,@body)))

(defmacro multiple-value-bind (lambda-list values-form &body body)
  (%expand lambda-list values-form body))

(defmacro multiple-value-&bind (lambda-list values-form &body body)
  (%expand lambda-list values-form body))
