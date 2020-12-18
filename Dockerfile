FROM openjdk:8-jdk-alpine
RUN apk add --update \bash \python
WORKDIR /usr/src/app
COPY . .
RUN tar -xzf apache-cassandra-3.11.5-bin.tar.gz

RUN apk add python3
RUN apk add --update py-pip
RUN pip install cql PyYAML

RUN apk add --no-cache git
RUN git clone https://github.com/pcmanus/ccm.git

WORKDIR /usr/src/app/ccm
RUN ./setup.py install