FROM  openjdk:11
LABEL wordsClient="1"
COPY wordsClients-0.0.1-SNAPSHOT.jar /opt/app/
CMD java -jar  /opt/app/wordsClients-0.0.1-SNAPSHOT.jar
