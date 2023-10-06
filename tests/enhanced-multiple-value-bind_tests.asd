(asdf:defsystem #:enhanced-multiple-value-bind_tests

  :author "Jean-Philippe Paradis <hexstream@hexstreamsoft.com>"

  :license "Unlicense"

  :description "enhanced-multiple-value-bind unit tests."

  :depends-on ("enhanced-multiple-value-bind"
               "parachute"
               "enhanced-eval-when")

  :serial cl:t
  :components ((:file "tests"))

  :perform (asdf:test-op (op c) (uiop:symbol-call '#:parachute '#:test '#:enhanced-multiple-value-bind_tests)))
