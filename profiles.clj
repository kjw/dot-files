{:user {:dependencies [[org.clojars.gjahad/debug-repl "0.3.3"]
                       [spyscope "0.1.4"]
                       [clj-ns-browser "1.3.1"]
                       [im.chit/vinyasa "0.1.9"]
                       [io.aviso/pretty "0.1.10"]]
        :injections [(require 'vinyasa.inject)
                     (require 'spyscope.core)
                     (require 'clj-ns-browser.sdoc)
                     (vinyasa.inject/inject 'clojure.core '>
                       '[[clj-ns-browser.sdoc sdoc]])
                     (require 'alex-and-georges.debug-repl)
                     (vinyasa.inject/inject 'clojure.core '>
                       '[[alex-and-georges.debug-repl debug-repl]])
                     (require 'vinyasa.inject)
                     (vinyasa.inject/inject 'clojure.core '>
                       '[[clojure.repl doc source]
                         [clojure.pprint pprint pp]])]
        :repl-options {:nrepl-middleware [io.aviso.nrepl/pretty-middleware]}}}

; provides all-namespace access to sdoc debug-repl doc source pprint pp
; provides #spy/{p,d,t}
