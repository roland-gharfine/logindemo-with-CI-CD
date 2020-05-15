FROM openjdk:12-alpine

RUN apk add --no-cache bash
COPY ServerAgent-* /ServerAgent
COPY myscript.sh /myscript.sh

EXPOSE 4444

COPY logindemo-*.jar /logindemo-current.jar
EXPOSE 8080
CMD ["bash", "./myscript.sh"]

