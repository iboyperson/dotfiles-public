#!/bin/bash

code --list-extensions > $(dirname $0)/../roles/vscode/files/extensions.txt
