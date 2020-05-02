(ns reittiopas-backend.core-test
  (:require [clojure.test :refer :all]
            [reittiopas-backend.core :refer :all]
            [clojure.data.json :as json]
            [clojure.string :as str]))

(deftest fetch-test
  (testing "Fetching route json form url"
    (testing "Prepare empty json.txt file"
      (spit "resources/json.txt" "")
      (is (= (slurp "resources/json.txt") "")))
    (testing "Prepare empty json.js file"
      (spit "resources/json.js" "")
      (is (= (slurp "resources/json.js") "")))
    (testing "Runs function that fetches the json and checks that it contain busstops"
      ((checkNewMessages (agent (slurp "resources/json.txt"))))
      (is (> (count ((json/read-str (slurp "resources/json.txt")) "pysakit")) 0)))
    (testing "Does fetched json contain busroutes"
      ((checkNewMessages (agent (slurp "resources/json.txt"))))
      (is (> (count ((json/read-str (slurp "resources/json.txt")) "linjastot")) 0)))
    (testing "Does generated json.js contain js code"
      (is (str/starts-with? (slurp "resources/json.js") "var reittiopasJsonTxt='{\"pysakit\":[")))))
