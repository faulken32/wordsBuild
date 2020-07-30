#!/bin/bash

app_path=/c/Users/ecncncl/projets
app_name1=wordsBroker
app_name2=wordsClients
version=-0.0.1-SNAPSHOT

echo "i build : "$app_path"/"$app_name1"/pom.xml"

mvn clean install -f $app_path"/"$app_name1"/pom.xml"
echo "----DONE----"
echo "i copy : "$app_path"/"$app_name1"/target/processor"$version".jar"

cp $app_path"/"$app_name1"/target/processor"$version".jar" .
echo "----DONE----"

echo "i build : "$app_path"/"$app_name2"/pom.xml"
mvn clean install -f $app_path"/"$app_name2"/pom.xml"
echo "----DONE----"

echo "i copy : "$app_path"/"$app_name1"/target/processor"$version".jar"
cp $app_path"/"$app_name2"/target/"$app_name2$version.jar .

echo "----DONE----"

echo "I shutdown docker compose "
docker-compose down
echo "----DONE----".
echo "I start docker compose"
docker-compose up -d --build
docker-compose restart client
