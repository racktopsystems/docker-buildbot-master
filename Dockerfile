FROM ubuntu:trusty
MAINTAINER Stefan Schindler <docker-buildbot-master@boxbox.org>

RUN apt-get update
RUN apt-get install -y python python-pip python-dev
RUN apt-get install -y git
RUN pip install sqlalchemy==0.7.10 buildbot==0.8.9

RUN mkdir /app
WORKDIR /app

RUN buildbot create-master --config=/app/data/master.cfg master 

ADD start /app/start
VOLUME "/app/data"
EXPOSE 9989
EXPOSE 8010
CMD ["./start"]
