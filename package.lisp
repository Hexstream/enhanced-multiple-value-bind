(cl:defpackage #:enhanced-multiple-value-bind
  (:nicknames #:enhanced-mvb)
  (:use #:cl)
  (:shadow #:multiple-value-bind)
  (:export #:multiple-value-bind
           #:multiple-value-&bind))
