# reittiopas_backend

Backend part for Solidabis coding challenge 2020. 

Software was written with VSCode on Windows.
Written with Clojure language. 

## Installation

On server, the core.clj needs some changes in url's used. The json.txt url needs to be changed 
to point to some existing directory, and the json.js path needs to point to the json.js file that frontend is serving.
Use Leiningen build tool command 'lein uberjar' on command line to create a jar file and run it on the server, 
for example with 'nohup java -jar reittiopas_backend-0.1.0-standalone.jar &' on a Linux server.

## Running tests

Backend clojure tests can be run using 'lein test' on command line in the project folder. 
Tests check that backend code can fetch route json from url and update js file served by the front-end. 
JSON is checked to contain valid json and some busstops and busroutes.

Robot framework UI tests can be run on command line with 'robot .\TestCases\reittihaku.robot' on backend project robot folder.

## Usage

Checks https://koodihaaste.solidabis.com/reittiopas.json url periodically for changes and 
updates the json.js the frontend is serving. Route search frontend is thus kept up to date if 
the json on the url changes.

## License

Copyright © 2020 Markus Kiili

This program and the accompanying materials are made available under the
terms of the Eclipse Public License 2.0 which is available at
http://www.eclipse.org/legal/epl-2.0.

This Source Code may also be made available under the following Secondary
Licenses when the conditions for such availability set forth in the Eclipse
Public License, v. 2.0 are satisfied: GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or (at your
option) any later version, with the GNU Classpath Exception which is available
at https://www.gnu.org/software/classpath/license.html.
