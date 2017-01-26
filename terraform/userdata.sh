#!/usr/bin/env bash

app_path=./app

rm -rf $${app_path}
mkdir -p $${app_path}
cd $${app_path}

curl -sO https://raw.githubusercontent.com/BulletinInteract/coding.challenge.packages/master/app/app.latest.tar.gz
curl -sO https://raw.githubusercontent.com/BulletinInteract/coding.challenge.packages/master/config/config.${env}.latest.tar.gz

tar xzf app.latest.tar.gz
tar xzf config.${env}.latest.tar.gz

sleep 1

docker run -d \
  --name coding-challenge-webapp \
  -p 80:3000 \
  -v "$PWD":/usr/src/app \
  -w /usr/src/app \
  -e "NODE_ENV=${env}" \
  node:6 \
  node server.js
