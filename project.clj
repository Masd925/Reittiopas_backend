(defproject reittiopas_backend "0.1.0-SNAPSHOT"
  :description "Backend for the solution to Solidabis coding challenge 2020.
                Checks url for route json and updates frontend json.js if needed"
  :license {:name "EPL-2.0 OR GPL-2.0-or-later WITH Classpath-exception-2.0"
            :url "https://www.eclipse.org/legal/epl-2.0/"}
  :dependencies [[org.clojure/clojure "1.10.0"]
                 [org.clojure/data.json "0.2.6"]
                 [clj-http "3.10.0"]
                 [overtone/at-at "1.2.0"]]
  :main ^:skip-aot reittiopas-backend.core
  :target-path "target/%s"
  :profiles {:uberjar {:aot :all}})
