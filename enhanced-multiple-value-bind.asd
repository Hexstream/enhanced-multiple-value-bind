(asdf:defsystem #:enhanced-multiple-value-bind

  :author "Jean-Philippe Paradis <hexstream@hexstreamsoft.com>"

  :license "Unlicense"

  :description "Provides an enhanced MULTIPLE-VALUE-BIND macro that adds support for lambda keywords by expanding to a MULTIPLE-VALUE-CALL when necessary. This makes catching multiple-value &rest and &key much more lightweight and convenient."

  :depends-on ()

  :version "2.0"
  :serial cl:t
  :components ((:file "package")
	       (:file "main"))

  :in-order-to ((asdf:test-op (asdf:test-op #:enhanced-multiple-value-bind_tests))))
