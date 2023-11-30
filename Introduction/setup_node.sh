#!/bin/bash

# Install necessary prerequisites
echo "We need to install Nodejs and NPM first. Stay strong!"
curl --silent -sL https://deb.nodesource.com/setup_current.x -o /tmp/nodesource_setup.sh
bash /tmp/nodesource_setup.sh
apt-get install -y -q nodejs

# Install AsyncAPI CLI
echo "Installing AsyncAPI CLI..."
npm install -g @asyncapi/cli
echo "All set! Go ahead!"