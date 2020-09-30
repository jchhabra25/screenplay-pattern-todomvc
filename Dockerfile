FROM alpine

RUN apk add curl jq
RUN apk add openjdk8-jre

WORKDIR /usr/share/screenplay-serenity

ADD target/serenity-screenplay-docker-bdd.jar              serenity-screenplay-docker-bdd.jar
ADD target/serenity-screenplay-docker-bdd-tests.jar        serenity-screenplay-docker-bdd-tests.jar
ADD target/libs                                            libs

ADD healthcheck.sh                                         healthcheck.sh

ENTRYPOINT sh healthcheck.sh 