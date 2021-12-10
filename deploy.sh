#!/usr/bin/bash

echo "Deploying changes..."

# pull from git
git reset --hard HEAD &&
git pull

# build
./mvnw clean package -DskipTests &&
cp target/student-service-0.0.1-SNAPSHOT.jar src/main/docker &&

# shutdown existing containers
cd src/main/docker &&
docker-compose down &&
docker rmi docker-spring-boot-postgres:latest &&

# start new containers
docker-compose up -d

echo "Deployed!"
