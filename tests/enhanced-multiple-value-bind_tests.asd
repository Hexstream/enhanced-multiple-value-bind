(asdf:defsystem #:enhanced-multiple-value-bind_tests

  :author "Jean-Philippe Paradis <hexstream@gmail.com>"

  ;; See the UNLICENSE file for details.
  :license "Public Domain"

  :description "ENHANCED-MULTIPLE-VALUE-BIND unit tests."

  :depends-on ("enhanced-multiple-value-bind"
               "parachute"
               "enhanced-eval-when")

  :serial cl:t
  :components ((:file "tests"))

  :perform (asdf:test-op (op c) (uiop:symbol-call '#:parachute '#:test '#:enhanced-multiple-value-bind_tests)))
