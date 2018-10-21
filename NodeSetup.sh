#! /bin/bash

#http://wiki.bash-hackers.org/scripting/terminalcodes
PURPLE=$(tput setaf 5)
NONE="$(tput sgr0)"

applyColorToString(){
    echo ${PURPLE}$1${NONE}
}

echo "=====Welcome to the Node Managment Project====="
echo "What to you want to do? Type nm <#> to execute"
echo "1 Install Brew and Node"
echo "2 ReInstall Node"
echo "3 Create a new Node Project and add common dependencies"
echo "==============================================="
printf "=>"
read base key


if [ ${base} == "nm" -a ${key} -eq 1 ]; then
    applyColorToString 'Executing :: /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    applyColorToString "Executing :: brew -v"
    brew -v

    applyColorToString 'Executing :: sudo chown -R $(whoami) $(brew --prefix)/*'
    sudo chown -R $(whoami) $(brew --prefix)/*

    applyColorToString "Executing :: brew doctor"
    brew doctor 

    applyColorToString "Executing :: brew prune"
    brew prune

    applyColorToString "Executing :: brew update"
    brew update 

    applyColorToString "Executing :: brew link --overwrite node"
    brew link --overwrite node

    applyColorToString "Executing :: brew install node"
    brew install node

    applyColorToString "Executing :: node -v"
    node -v

    applyColorToString "Executing :: sudo rm -rf /usr/local/lib/node_modules/npm"
    sudo rm -rf /usr/local/lib/node_modules/npm

    applyColorToString "Executing :: sudo apt install npm"
    sudo apt install npm

    applyColorToString "Executing :: npm -v"
    npm -v 

elif [ ${base} == "nm" -a ${key} -eq 2 ]; then
    
    applyColorToString "Executing :: brew reinstall node" 
    brew reinstall node

    applyColorToString "Executing :: node -v"
    node -v

    applyColorToString "Executing :: npm -v"
    npm -v 

elif [ ${base} == "nm" -a ${key} -eq 3 ]; then


    applyColorToString "Executing :: mkdir ../nodeproject" 
    mkdir ../nodeproject

    applyColorToString "Executing :: touch ../nodeproject/server.js"
    touch ../nodeproject/server.js

    applyColorToString "In nodeproject folder.."
    cd ../nodeproject
    pwd 
    ls

    applyColorToString "Executing :: npm init" 
    npm init
    pwd 

    applyColorToString "Executing :: npm i --save express body-parser cors" 
    npm i --save express body-parser cors

    applyColorToString "Auto generating content in server.js ..."
    echo "const express = require('express')" >> server.js
    echo "const cors = require('cors')" >> server.js
    echo "const bodyParser = require('body-parser')" >> server.js
    echo "const app = express()" >> server.js
    echo "app.use(cors())" >> server.js
    echo "app.use(bodyParser.json())" >> server.js 
    echo "app.use(bodyParser.urlencoded({ extended: false }))" >> server.js 

    echo "app.get('/hello', (request, response, next) => {">> server.js
    echo "   response.json('HELLO WORLD')">> server.js
    echo "})">> server.js

    echo "app.listen(4000, () => console.log('Listening on 4000.'))">> server.js

    applyColorToString "Done"

else 
    echo "Not an option ${base} ${key}"
fi


