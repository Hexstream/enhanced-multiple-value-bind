(asdf:defsystem #:enhanced-multiple-value-bind

  :author "Jean-Philippe Paradis <hexstream@gmail.com>"

  ;; See the UNLICENSE file for details.
  :license "Public Domain"

  :description "Provides an enhanced MULTIPLE-VALUE-BIND macro that adds support for lambda keywords by expanding to a MULTIPLE-VALUE-CALL when necessary. This makes catching multiple-value &rest and &key much more lightweight and convenient. A MULTIPLE-VALUE-&BIND alias is supported."

  :depends-on ()

  :version "1.0.1"
  :serial cl:t
  :components ((:file "package")
	       (:file "main"))

  :in-order-to ((asdf:test-op (asdf:test-op #:enhanced-multiple-value-bind_tests))))
