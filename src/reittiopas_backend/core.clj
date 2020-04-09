(ns reittiopas-backend.core
  (:gen-class)
  (:require [clojure.string :as str]
            [clojure.data.json :as json]
            [clj-http.client :as client])
  (:use overtone.at-at))

(defn checkNewMessages [ag]
  (println "Creating periodic callback")
  "Gets json text from url and compares it to agent content. 
   If it is not yet there, updates the agent, json.txt, and served json.js. 
   Using agent avoids reading the text file on each url check."
  (fn []
    (let [{:keys [status headers body error] :as resp} (client/get "https://koodihaaste.solidabis.com/reittiopas.json")]
      (println "checking url")
      (if error
        (println "Failed, exception: " error)
        (if (not= body @ag)
            (do
              (println "reittiopas.json had changed")
              (send ag (fn [_] body))  
              (spit "resources/json.txt" body)
              (spit "resources/json.js" (str "var reittiopasJsonTxt='" (json/write-str (json/read-str body)) "';"))))))))

(defn -main
  "Checks url periodically for changes in reittiopas.json"
  []  
  (def ag (agent (slurp "resources/json.txt"))) ;; Json is stored also on text file so that we only update served json.js on actual change on reittiopas.json
  (def my-pool (mk-pool))
  (interspaced 60000 (checkNewMessages ag) my-pool)
)