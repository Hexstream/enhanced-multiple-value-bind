(cl:defpackage #:enhanced-multiple-value-bind
  (:nicknames #:e-mvb)
  (:use #:cl)
  (:shadow #:multiple-value-bind)
  (:export #:multiple-value-bind))
