#!/bin/sh
cd `dirname $0`
gitbook build
echo 'acme1234' | sudo -S rm -rf /usr/share/nginx/html/vim_learn
echo 'acme1234' | sudo -S cp -rf _book  /usr/share/nginx/html/vim_learn
