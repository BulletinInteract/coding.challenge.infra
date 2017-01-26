#!/usr/bin/env bash
cd terraform
./build.sh destroy development
./build.sh destroy test
./build.sh destroy staging
./build.sh destroy production
