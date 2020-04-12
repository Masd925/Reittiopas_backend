# reittiopas_backend

Backend part for Solidabis coding challenge 2020. 

Software was written with VSCode on Windows.
Written with Clojure language. 

## Installation

On server, json.txt url needs to be changed to point to some existing directory, and 
json.js path needs to point to the json.js file that frontend is serving.
Use 'lein uberjar' to create a jar file and run it on the server, 
for example with 'nohup java -jar reittiopas_backend-0.1.0-standalone.jar &' on a Linux server.

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
