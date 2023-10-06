(in-package #:enhanced-multiple-value-bind)

(defun %apparent-lambda-list-keyword-p (symbol)
  (let ((name (symbol-name symbol)))
    (and (plusp (length name))
         (char= (char name 0) #\&))))

(defmacro multiple-value-bind (lambda-list values-form &body body)
  (if (member-if #'%apparent-lambda-list-keyword-p lambda-list)
      `(multiple-value-call (lambda ,lambda-list ,@body) ,values-form)
      `(cl:multiple-value-bind ,lambda-list ,values-form ,@body)))
