#!/usr/bin/env bash
cd terraform
./build.sh apply development &
./build.sh apply test &
./build.sh apply staging &
./build.sh apply production &
