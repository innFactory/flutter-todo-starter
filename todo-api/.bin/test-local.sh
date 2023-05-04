#!/bin/bash

RED='\033[0;31m'
ORANGE='\033[0;33m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

REMOVE=$GITHUB_TOKEN

if [ "$REMOVE" == "" ]; then
    printf "${RED}NO GITHUB TOKEN SET! ${NC} \n" && exit 1
fi




docker run -d -p 5432:5432 -e POSTGRES_PASSWORD=test -e POSTGRES_DB=test -e POSTGRES_USER=test --name todo_metadata_api_db postgres:13

FILE=build.sbt
if test -f "$FILE"; then
    cd .bin
fi

(
for i in `seq 1 10`;
            do
              nc -z localhost 5432 && echo Success && exit 0
              echo -n .
              sleep 1
            done
            echo Failed waiting for Postgres && exit 1
)

cd ..

sbt ciTests
docker stop todo_metadata_api_db
docker rm todo_metadata_api_db