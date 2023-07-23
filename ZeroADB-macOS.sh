#!/bin/bash

str="/Applications/platform-tools"

if [ -d "$str" ]; then
    rm -rf "$str"
fi

curl -L -o platform-tools-latest-darwin.zip https://dl.google.com/android/repository/platform-tools-latest-darwin.zip
unzip -o platform-tools-latest-darwin.zip -d /Applications/
rm platform-tools-latest-darwin.zip

if [[ ":$PATH:" != *":$str:"* ]]; then
    echo "export PATH=\"\$PATH:$str\"" >> ~/.zshrc
    source ~/.zshrc
    echo "Added platform-tools to PATH"
else
    echo "platform-tools is already in PATH"
fi
